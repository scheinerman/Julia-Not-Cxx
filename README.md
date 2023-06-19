# Julia-Not-Cxx
Redoing some code from my *C++ for Mathematicians* book in Julia.


## The Problem

> What is the probability that two positive integers are relatively prime?

This is ill-posed question. Here is the more specific version:

> Let `p(n)` be the probability that two integers chosen independently and uniformly from `{1,2,...,n}` are relatively prime. Find the limit as `n` tends to infinity of `p(n)`.

My book, *C++ for Mathematicians*, uses this question to show how to use C++ for mathematical questions. This book was written before Julia was an option. 

The code in the `src` directory shows how much easier Julia is to use than C++.

* `exhaust.jl` calculates `p(n)` exactly by considering all pairs of positive integers `(a,b)` where `1 ≤ a,b ≤ n`. 
* `monte_carlo.jl` estimates `p(n)` by generating random pairs `(a,b)`.
* `via_totient.jl` computes `p(n)` using ideas from number theory.

In each case, the functions defined in this file are cross referenced with functions in the book.

## Performance

```
julia> @btime rel_prime_prob_exhaust_1(10_000)
  2.059 s (0 allocations: 0 bytes)
0.60794971

julia> @btime rel_prime_rand(10_000, 10_000)
  290.416 μs (0 allocations: 0 bytes)
0.6173

julia> @btime rel_prime_prob_totient(10_000)
  275.958 μs (0 allocations: 0 bytes)
0.60794971
```

## Answer

The answer to the question is `1/ζ(2) = 6/π^2` which equals `0.6079271018540267`.