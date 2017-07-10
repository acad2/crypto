each number N has a 1/N chance of being the factor of a random number
a random N has a high probability of possessing small primes as factors (i.e. a 50% chance to have 2 as a factor)
(100.0/N)% of the time we can use N as the basis, and pretend the rest of the factors of the actual basis p are factors of the point q
pq == N * (other_factors(p) * q) 
then we can use % N on any point pq + e to recover log(N) bits of the error with probability 1/N
   - needs some way to be able to very N as a factor p

