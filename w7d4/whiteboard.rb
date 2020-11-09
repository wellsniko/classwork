# Problem 1:
# You are climbing a stair case. It takes n steps to reach to the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
# Note: Given n will be a positive integer.
# Example 1:
# Input: 2
# Output: 2
# Explanation: There are two ways to climb to the top.
# 1. 1 step + 1 step
# 2. 2 steps
# Example 2:
# Input: 3
# Output: 3
# Explanation: There are three ways to climb to the top.
# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step

def n_steps(stairs)
    return 1 if stairs <= 1 
    count = 0
    count += n_steps(stairs - 1) + n_steps(stairs - 2)
end

# p n_steps(2)

# 1   1 1 1 2 2 
# 2   1 2 1     
# 3   1   2 1 2
# 4   1 1   1

# Problem 2:
# Given an array nums, write a function to move all 0's to the end of it while
#  maintaining the relative order of the non-zero elements.
# Example:
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Note:
# Minimize the total number of operations.

def moves_zeros(array)
    i = 0
    count = 0
    new_array = []
    while i < array.length
        if array[i] != 0
            new_array << array[i]
        else
            count += 1
        end
        i += 1
    end
    count.times { new_array << 0}
    new_array
end

p moves_zeros([0,1,0,3,12])
