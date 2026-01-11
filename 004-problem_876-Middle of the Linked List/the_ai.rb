#  Surprisingly, Ai gives the same solution as me.
#  It make as I learned it from the internet an AI also.

# Here’s the **idiomatic Ruby solution** using the classic **fast & slow pointers** technique.
# Comments explain the *why*, not just the *what* — like a senior dev would do in a code review 😉


# @param {ListNode} head
# @return {ListNode}
def middle_node(head)
  # Edge case: empty list
  return nil if head.nil?

  # Slow moves 1 step at a time
  # Fast moves 2 steps at a time
  slow = head
  fast = head

  # When fast reaches the end,
  # slow will be at the middle
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  # If the list has even length,
  # this returns the SECOND middle node
  # (which matches the LeetCode problem requirement)
  slow
end


# ### Why this works (quick mentor notes)

# * **O(n) time** → single pass
# * **O(1) space** → no extra data structures
# * **Fast pointer jumps twice as fast**, so when it finishes, slow is halfway
# * For **even-length lists**, returning the second middle is intentional and correct

# ### Example

# ```
# 1 → 2 → 3 → 4 → 5
#           ↑
#         returns 3

# 1 → 2 → 3 → 4
#           ↑
#         returns 3
# ```

# If you want, next we can:

# * Implement a **test helper** to build linked lists in Ruby
# * Solve the same problem **recursively** (for learning purposes)
# * Compare this with a **two-pass solution** and explain why it’s worse

# You’re asking the right kind of questions — this is solid fundamentals territory 💪
