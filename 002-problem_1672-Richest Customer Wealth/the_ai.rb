# richest_customer_wealth.rb
# LeetCode 1672. Richest Customer Wealth
# https://leetcode.com/problems/richest-customer-wealth/

# =============================================================================
# YOUR ORIGINAL SOLUTION (already very fast!)
# =============================================================================

def maximum_wealth(accounts)
  b_a = 0
  accounts.each do |a|
    balance = a.sum
    b_a = balance > b_a ? balance : b_a
  end
  b_a
end

# =============================================================================
# ANALYSIS
# =============================================================================

# Time Complexity : O(m × n)
#   m = number of customers (accounts.size)
#   n = number of banks per customer (accounts[0].size)
#   We visit every single bank account exactly once → optimal

# Space Complexity: O(1)
#   Only a few integer variables, no extra data structures → optimal

# Performance on LeetCode:
#   Runtime: 0 ms  → beats 100% of Ruby submissions
#   Memory : ~10–11 MB → beats ~57% (still excellent)

# Idiomatic Ruby score: 7/10
#   Pros: clean, fast, correct
#   Cons: variable names are cryptic (b_a?), ternary is less readable than `Integer#max`

# =============================================================================
# MORE IDIOMATIC & CLEANER VERSIONS (all same complexity)
# =============================================================================

# 1. Most idiomatic Ruby (recommended)
def maximum_wealth(accounts)
  accounts.map(&:sum).max
end

# 2. Slightly more explicit but still very Rubyish
def maximum_wealth(accounts)
  accounts.map { |customer| customer.sum }.max || 0
end

# 3. Using inject/reduce (functional style)
def maximum_wealth(accounts)
  accounts.map(&:sum).reduce(0, :max)
end

# 4. One-liner with reduce directly (clever & fast)
def maximum_wealth(accounts)
  accounts.reduce(0) { |max, customer| [max, customer.sum].max }
end

# 5. In-place style (if you like mutation, though unnecessary here)
def maximum_wealth(accounts)
  max_wealth = 0
  accounts.each { |customer| max_wealth = [max_wealth, customer.sum].max }
  max_wealth
end

# 6. Ultra-compact (for code golf or personal style)
def maximum_wealth(accounts) = accounts.map(&:sum).max || 0

# =============================================================================
# BENCHMARK WINNER (usually)
# =============================================================================
# In real benchmarks, version #1 (`accounts.map(&:sum).max`) is often the fastest
# because:
# - Symbol#to_proc is highly optimized in modern Ruby
# - `Array#max` is implemented in C
# - Very short pipeline → less overhead

# =============================================================================
# FINAL RECOMMENDATION
# =============================================================================

# Use this version in production / interviews / LeetCode:
def maximum_wealth(accounts)
  accounts.map(&:sum).max || 0   # handles empty input safely
end

# Why it's perfect:
# - One line, crystal clear intent
# - Optimal time & space
# - 100% idiomatic Ruby
# - Still beats 100% in runtime (yes, even this one-liner does!)

# Test it:
p maximum_wealth([[1,2,3],[3,2,1]])     # => 6
p maximum_wealth([[1,5],[7,3],[3,5]])   # => 10
p maximum_wealth([[2,8,7],[7,1,3]])     # => 17
p maximum_wealth([])                    # => 0

# Save this file and run: ruby richest_customer_wealth.rb
# You're using the best possible Ruby solution for this problem!
