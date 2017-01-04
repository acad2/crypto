# copied from pride.functions

import exceptions

_TYPE_SYMBOL = {int : chr(0), float : chr(1), str : chr(2), 
                bool : chr(3), list : chr(4), dict : chr(5),
                tuple : chr(6), set : chr(7), type(None) : chr(8),
                unicode : chr(9), BaseException : chr(10), long : chr(11),
                bytearray: chr(12)}
                
_TYPE_RESOLVER = {_TYPE_SYMBOL[int] : int, 
                  _TYPE_SYMBOL[float] : float, 
                  _TYPE_SYMBOL[str] : lambda value: value,
                  _TYPE_SYMBOL[bool] : lambda value: True if value == "True" else False,                  
                  _TYPE_SYMBOL[type(None)] : lambda value: None,                                                     
                  _TYPE_SYMBOL[unicode] : unicode, 
                  _TYPE_SYMBOL[long] : long,
                  _TYPE_SYMBOL[bytearray] : bytearray}
                  
def save_data(*args):
    output = []
    for arg in args:
        packed_data = pack_data(arg)
        output.append(str(len(packed_data)) + ' ' + packed_data)
    return ''.join(output)

def load_data(packed_data):
    output = []
    while packed_data:
        size, packed_data = packed_data.split(' ', 1)
        size = int(size)
        output.append(unpack_data(packed_data[:size]))
        packed_data = packed_data[size:]
    return tuple(output) if len(output) > 1 else output[0]
        
def pack_data(arg):
    """ Pack arguments into a stream, prefixed by size headers.
        Resulting bytestream takes the form:
            
            size1 size2 size3 ... sizeN data1data2data3...dataN
            
        The returned bytestream can be unpacked via unpack_data to
        return the original contents, in order. """       
    if isinstance(arg, BaseException):        
        arg_string = _TYPE_SYMBOL[BaseException] + pack_data((type(arg).__name__, arg.args))
    elif isinstance(arg, tuple) or isinstance(arg, list) or isinstance(arg, set):
        types = []
        sizes = []
        packed_values = []
        for value in arg:
            arg_string = pack_data(value)
            types.append(_TYPE_SYMBOL[type(value)])
            sizes.append(str(len(arg_string)))
            packed_values.append(arg_string)
        arg_string = _TYPE_SYMBOL[type(arg)] + ''.join(types) + ' ' + ' '.join(sizes) + ' ' + ''.join(packed_values)
        #packed_values = ''.join(packed_values)
        #arg_string = _TYPE_SYMBOL[type(arg)] + "{} {} {}".format(len(arg), len(packed_values), packed_values)        
    elif isinstance(arg, dict):
        packed_values = pack_data(arg.items())
        arg_string = _TYPE_SYMBOL[type(arg)] + "{} {} {}".format(len(arg), len(packed_values), packed_values)
    else:
        _arg = str(arg)
        try:
            arg_string = _TYPE_SYMBOL[type(arg)] + '0 {} {}'.format(len(_arg), _arg)
        except KeyError:
            raise TypeError("Unsupported type: '{}'".format(type(arg)))
    return arg_string
        
def unpack_data(packed_data):    
    _type = packed_data[0]
    if _type == _TYPE_SYMBOL[BaseException]:        
        # is it safe to do this? I feel like it should be; if an attacker has
        # control over the exceptions module, we've probably already lost
        exception_type, args = unpack_data(packed_data[1:])
        try:
            data = getattr(exceptions, exception_type)(*args)
        except AttributeError:
            import pride.errors
            data = getattr(pride.errors, exception_type)(*args)
        
    elif _type in (_TYPE_SYMBOL[tuple], _TYPE_SYMBOL[list], _TYPE_SYMBOL[set]):      
        data = []
        _types, packed_data = packed_data[1:].split(' ', 1)           
        sizes = packed_data.split(' ', len(_types))      
        packed_data = sizes.pop(-1)
        for size in (int(size) for size in sizes):     
            data.append(unpack_data(packed_data[:size]))
            packed_data = packed_data[size:]
            
        if _type == _TYPE_SYMBOL[tuple]:
            data = tuple(data)                    
        elif _type == _TYPE_SYMBOL[set]:
            data = set(data)
            
    elif _type == _TYPE_SYMBOL[dict]:
        item_count, item_size, packed_data = packed_data.split(' ', 2)
        items = unpack_data(packed_data[:int(item_size)])
        try:
            data = dict(items)
        except TypeError:                
            data = {items[0] : items[1]}
    else:            
        null, item_size, packed_data = packed_data.split(' ', 2)
        data = _TYPE_RESOLVER[_type](packed_data[:int(item_size)])    
    return data
    