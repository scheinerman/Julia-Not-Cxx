"""
    rel_prime_rand(n::Int, reps::Int)::Float64

Estimate the probability two integers between `1` and `n` 
are relatively prime using random sampling. Program 4.4.
"""
function rel_prime_rand(n::Int, reps::Int)::Float64
    count = 0
    for _ = 1:reps
        a = mod1(rand(Int), n)
        b = mod1(rand(Int), n)
        if gcd(a, b) == 1
            count += 1
        end
    end
    return Float64(count) / reps
end
