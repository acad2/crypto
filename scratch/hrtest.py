import string

_input = "lhpohes gvjhe ztytwojmmtel lgsfcgver segpsltjyl vftstelc djfl rml catrroel jscvjqjyfo mjlesl lcjmmfqe egvj gsfyhtyq sjfgver csfaotyq lfxtyq gjywplesl lxljm dxcel mpyctyq ztytwojmmtelel mfcgv spres mjm psgvty bfml ofle mjlc dtc tygfycfctjy dfsyl zpygvel csfao yealqsjpml atyl lgsjql qyfsotelc fseyf ojllel gjzmselltyq wpyhtelc zpltgl weygel afyher rstnesl aefleo rtyhes mvflel yphe rstnes qojder dtwwer lojml mfcgvel reocfl djzder djpygtyq gstmmoeafsel reg cpdel qspyqe mflctel csflvtyq vfcl avfghtyq vftsdfool mzer rsjye wjjol psol mplvtyq catrroe mvfqe lgseey leqzeycer wjseqsjpyrer lmjtoes msjwtoel docl djpyger cjpstlcl goefy gojddesl mjrl qjddoe gjy gpdtyql lyftotyq rjayojfr swgl vjle atrqec gjzmfgces frfl qotcgver gspzd zftodjzdl lyfsh"

#with open("dictionary.lst", 'r') as dictionary_file:
#    dictionary_words = dictionary_file.readlines()
    
def crack_monoalphabetic_substitution_cipher(ciphertext, dictionary):
    lowercase_ascii = string.lowercase
    ciphertext_words = sorted(ciphertext.split(), key=len)    
    sorted_dictionary = sorted(dictionary, key=len)
        
    biggest_word_size = len(ciphertext_words[-1])
    key = {}
    searching = True                                       
    for ciphertext_word in (bytearray(word) for word in reversed(sorted_dictionary)):
        word_size = len(ciphertext_word)
        for branch, dictionary_word in enumerate((bytearray(word) for word in 
                                                  reversed(sorted_dictionary) if 
                                                  len(word) == word_size)):
            for index, letter in enumerate(dictionary_word):
                try:
                    key[branch][letter] = ciphertext_word[index]
                except KeyError:
                    _key = bytearray(26)
                    _key[letter] = ciphertext_word[index]
                    key[branch] = _key
           
            
if __name__ == "__main__":
    crack_monoalphabetic_substitution_cipher(_input, None)