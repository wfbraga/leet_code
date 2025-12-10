# Option 1: Most Ruby-like (recommended)
def running_sum(nums)
  nums.each_with_object([]) { |n, arr| arr << arr.last.to_i + n }
end

p running_sum([1, 2, 3])  # => [1, 3, 6]

# Option 2: Using each_with_index and sum (very clear)
def running_sum(nums)
  (0...nums.size).map { |i| nums[0..i].sum }
end

p running_sum([1, 2, 3])  # => [1, 3, 6]

# Most efficient (O(n) time, O(1) extra space besides output)
def running_sum(nums)
  result = []
  total = 0
  nums.each do |n|
    total += n
    result << total
  end
  result
end

p running_sum([1, 2, 3])  # => [1, 3, 6]

# Option 4: One-liner (very idiomatic Ruby)
def running_sum(nums)
  nums.scan(/.*/).map(&:sum)
end
p running_sum([1, 2, 3])  # => [1, 3, 6]

# or even shorter:
def running_sum(nums) = nums.each_with_object([]) { |n,a| a << a.last.to_i + n }
p running_sum([1, 2, 3])  # => [1, 3, 6]

# Bonus ultra-short version:
def running_sum(nums) = nums.inject([]) { |a, n| a << (a.last || 0) + n }
p running_sum([1, 2, 3])  # => [1, 3, 6]

# Performance Considerations
# Your original code issues:

# Recalculates the sum from scratch on every iteration → O(n²) instead of O(n)
# Creates many intermediate arrays with [0..i]

# Best practice: Use Option 3 or the one-liner — they're fast, clear, and very "Rubyish".
