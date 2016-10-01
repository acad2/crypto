def generate_initial_client_message(username, g, p, q):
    x = random_number(q)
    X = pow(g, x, p)
    return (username, X)
    
def receive_initial_client_message(username, X, g, p, q):
    if X % p in (0, 1, -1):
        raise ValueError()
    y = random_number(q)
    r = hash_function("\x01" + username + server_identifier + bn2bin(X))
    Y = pow((X * (W ** r)), y, p)