using Memoize

"""
    rel_prime_prob_exhaust_1(n::Int)::Float64

Compute the probability two integers between `1` and `n` are relatively 
prime by exhaustion. Program 3.9
"""
function rel_prime_prob_exhaust_1(n::Int)::Float64
    count = 0
    for a = 1:n
        for b = 1:n
            if gcd(a, b) == 1
                count += 1
            end
        end
    end
    return Float64(count) / n / n
end

"""
    rel_prime_prob_exhaust_2(n::Int)::Float64

Compute the probability two integers between `1` and `n` are relatively 
prime by slightly better exhaustion (twice as fast). Program 3.10.
"""
function rel_prime_prob_exhaust_2(n::Int)::Float64
    count = 0
    for a = 1:n
        for b = a+1:n
            if gcd(a, b) == 1
                count += 1
            end
        end
    end
    count = 2 * count + 1
    return Float64(count) / n / n
end


@memoize function gcd_m(a::Int, b::Int)::Int
    if a==0 
        return b 
    end
    if b==0
        return a 
    end
    aa = b
    bb = mod(a,b)
    return gcd_m(aa,bb)
end


"""
    rel_prime_prob_exhaust_m(n::Int)::Float64

Compute the probability two integers between `1` and `n` are relatively 
prime by exhaustion but memoized.
"""
function rel_prime_prob_exhaust_m(n::Int)::Float64
    count = 0
    for a = 1:n
        for b = 1:n
            if gcd_m(a, b) == 1
                count += 1
            end
        end
    end
    return Float64(count) / n / n
end
