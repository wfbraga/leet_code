# To be fair, I have to disclaim that I've never used linked lists and had to lear from scratch.
# Now I understand why they are not commonly used in Ruby.
# However, I found the problem interesting and a oportunity to learn something new.
# Below my considerations and a list of resources I used to understand linked lists.

# https://www.youtube.com/watch?v=uwFhvQdd_yM

# This is my attempt to solve the problem "Middle of the Linked List".
# It performs in 0ms, beats 100%, and uses 211.2(MB) of memory beatin 45%
# However I can't talk much about it becouse I'm just gettin familiar with linked lists.
def middle_node(head)
  slow = head
  fast = head

  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  slow
end
