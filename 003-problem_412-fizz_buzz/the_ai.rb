
# fizz_buzz.rb
#
# This file shows multiple FizzBuzz implementations in Ruby,
# starting from a clear/explicit solution and moving toward
# more idiomatic Ruby styles.
#
# All solutions are O(n) and correct — the differences are
# readability, style, and expressiveness.

# ------------------------------------------------------------
# 1. Clear & Explicit (very close to your original solution)
# ------------------------------------------------------------
#
# Pros:
# - Very readable
# - Easy to debug
# - Great for beginners and interviews
#
# Cons:
# - Slightly verbose
# - Manual array mutation

def fizz_buzz_explicit(n)
  answer = []

  (1..n).each do |i|
    if i % 3 == 0
      if i % 5 == 0
        answer << "FizzBuzz"
        next
      end
      answer << "Fizz"
      next
    elsif i % 5 == 0
      answer << "Buzz"
      next
    end

    answer << i.to_s
  end

  answer
end



# ------------------------------------------------------------
# 2. Improved Conditional Order (less nesting)
# ------------------------------------------------------------
#
# Key insight:
# - Check the most specific condition FIRST (divisible by 15)
# - Reduces nesting and improves readability

# Performs worst in time in speed and memory usage

def fizz_buzz_ordered(n)
  answer = []

  (1..n).each do |i|
    if i % 15 == 0
      answer << "FizzBuzz"
    elsif i % 3 == 0
      answer << "Fizz"
    elsif i % 5 == 0
      answer << "Buzz"
    else
      answer << i.to_s
    end
  end

  answer
end

# ------------------------------------------------------------
# 3. Idiomatic Ruby (preferred in real Ruby code)
# ------------------------------------------------------------
#
# Key insight:
# - Use `map` when transforming a collection
# - Avoid manual array mutation
#
# This is the most common Ruby-style solution.

# NOTE: This solution performed better in terms of memory beating 88% but wordt in time using 2ms beating 55%

def fizz_buzz_map(n)
  (1..n).map do |i|
    if i % 15 == 0
      "FizzBuzz"
    elsif i % 3 == 0
      "Fizz"
    elsif i % 5 == 0
      "Buzz"
    else
      i.to_s
    end
  end
end

# ------------------------------------------------------------
# 4. Dynamic String Building (flexible & elegant)
# ------------------------------------------------------------
#
# Key insight:
# - Build the output string instead of branching logic
# - Scales well if rules increase (FizzBuzzBang, etc.)
#
# This is often considered the "clever but readable" solution.

# This was the mor elegante in my opinion and also runs in 0ms beating 100% of the solutions
# However, the worst in memory usage beating only 16%

def fizz_buzz_dynamic(n)
  (1..n).map do |i|
    result = ""
    result << "Fizz" if i % 3 == 0
    result << "Buzz" if i % 5 == 0

    result.empty? ? i.to_s : result
  end
end

# ------------------------------------------------------------
# Notes & Takeaways
# ------------------------------------------------------------
#
# 1. `(1..n)` is correct because FizzBuzz is inclusive
# 2. Prefer `map` when transforming values
# 3. Check more specific conditions first
# 4. Ruby values expressiveness over control flow
#
# For interviews:
# - Version 2 or 3 is usually ideal
#
# For production Ruby:
# - Version 3 or 4 is preferred
#
# All versions return:
# ["1", "2", "Fizz", "4", "Buzz", "Fizz", ...]
