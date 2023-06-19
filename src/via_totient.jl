using Primes

"""
    rel_prime_prob_totient(n::Int)::Float64

Julia version of program 5.10.
"""
function rel_prime_prob_totient(n::Int)::Float64
    s = sum(totient(k) for k = 1:n)

    return Float64(2s - 1) / n / n
end
