# It was my first attempt but it is not efficient because of the sum method inside the loop.
# Took 4ms runtime, beats 6.29% submissions.

def running_sum(nums)
    running_sum = []
    nums.each_with_index do |num, i|
     running_sum << nums[0..i].sum
    end
    running_sum
end

p running_sum([1,2,3,4]) # [1,3,6,10]


# I thought of another way to do it more efficiently.
# Thinking .each_with_object where a "overkill" and decide to try a for
# It performed better, took 0ms runtime, beats 100% submissions.
# However, it is still not the most optimal solution.
# The sum method inside the loop, leading to O(n^2) time complexity.
# I dind't get it until I asked Grok. See AI suggestion for optimal solution.

def running_sum(nums)
    running_sum = []
    nums_size = nums.size
    for i in (0...nums_size)
     running_sum << nums[0..i].sum
    end
    running_sum
end

p running_sum([1,2,3,4]) # [1,3,6,10]

# This third attempt is mine after seeing AI suggestion.
# It took 0ms runtime, beats 100% submissions.

def running_sum(nums)
    for i in (1...nums.size)
        nums[i] += nums[i - 1]
    end
    nums
end

p running_sum([1,2,3,4]) # [1,3,6,10]

# See AI consideration about my solution:

# =============================================================================
# ANALYSIS (Why this version is OPTIMAL)
# =============================================================================

# Time Complexity : O(n)
#   - We visit each element exactly once
#   - Only one pass through the array

# Space Complexity: O(1)   ← This is the key advantage!
#   - We modify the input array in-place
#   - No extra array created (unlike all previous versions that used O(n) space)

# Comparison with previous solutions:

# Your original code:           O(n²) time, O(n) space
# My first suggestions:         O(n)  time, O(n) space
# THIS version (in-place):      O(n)  time, O(1) space  ← Optimal!

# When is this allowed?
# - On LeetCode: YES! This is the expected optimal solution for this problem
# - In interviews: Usually allowed unless explicitly told "don't modify input"
# - In real production code: Use with caution — only if the caller doesn't need the original array

# One-liner version (same efficiency):
def running_sum(nums) = nums.tap { |a| (1...a.size).each { |i| a[i] += a[i-1] } }

# Or if you are in a team and want a more readable version:
def running_sum(nums)
  nums.each_index { |i| nums[i] += nums[i-1] if i > 0 }
end
# Final verdict:
# This is the BEST solution for performance and memory usage
# Use this version whenever you're allowed to modify the input array
# Perfect for LeetCode, coding interviews, and performance-critical code!

# Save and use this — it's production-grade optimal!
