# https://leetcode.com/problems/fizz-buzz/submissions/1876748560/

# This is the first attempt to solve the problem "FizzBuzz".
# The goal is to find the maximum wealth among all customers,
# it runs in 3ms and beats 44.87%
# in memory usage, beating 55%.
# @param {Integer} n
# @return {String[]}

def fizz_buzz(n)
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
p fizz_buzz(15)

# After thinking more about the problem I realize that I can optimize the code by removing some of the nested conditionals
# and test the index for % 15 first.
# This second attempt runs in 0ms and beats 100%
# in memory usage, beating 55%.

def fizz_buzz(n)
    answer = []
    (1..n).each do |i|
        if i % 15 == 0
            answer << "FizzBuzz"
            next
        elsif i % 3 == 0
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
p fizz_buzz(15)
