# https://leetcode.com/problems/richest-customer-wealth/

# This is the first attempt to solve the problem "Richest Customer Wealth".
# The goal is to find the maximum wealth among all customers,
# it runs in 0ms and beats 100%
# in memory usage, beating 57%.

def maximum_wealth(accounts)
  richer_balance = 0
  accounts.each do |a|
      balance = a.sum
      richer_balance = balance > richer_balance ? balance : richer_balance
  end
  richer_balance
end
p maximum_wealth([[1,2,3],[3,2,1]]) # Expected output: 6

# this is the AI solution for the same problem
def maximum_wealth(accounts)
  accounts.map(&:sum).max
end
p maximum_wealth([[1,2,3],[3,2,1]]) # Expected output: 6

# Both solutions are efficient and have the same time complexity of O(m × n),
# where m is the number of customers and n is the number of banks per customer.

# The AI solution is more idiomatic Ruby, using `map` and `max` for clarity.
# The original solution is also efficient but uses a more manual approach
# with explicit iteration and comparison to find the maximum wealth.

# Important Note: My original solution is already optimal in terms of performance and use less memory.
# Why? Dont use extra data structures like map which creates a new array.
# The AI solution is more readable but less efficient in terms of memory usage.
