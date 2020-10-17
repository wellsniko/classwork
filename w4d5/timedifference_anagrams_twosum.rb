#my_min
# Given a list of integers find the smallest number in the list.

#O(n^2)
def my_min(list)
    minimum_num = [] 
    list.each do |num1| 
        minimum_num = num1 if list.all? {|ele| ele >= num1}
    end
    minimum_num
end


#O(n)
def my_min(list)
    minimum_num = list.first
    list.each {|num| minimum_num = num if num < minimum_num}
    minimum_num
end

# list.sort[0] - n(log n) - highly optimized version of merge sort 



# Example:

    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    # my_min(list)  # =>  -5
# p my_min([0, 3, 5, 4, -5, 10, 1, 90 ])  #=> -5 

# Phase I
# First, write a function that compares each element to every other 
# element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

# Phase II
# Now rewrite the function to iterate through the list just once while 
# keeping track of the minimum. What is the time complexity?




# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous 
# (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

#O(n^3)time O(n^3)memory  
def sub_sum(list)
    array = []
    (0...list.length).each do |idx1|
        (idx1...list.length).each do |idx2|
            array << list[idx1..idx2] #O(n)
        end
    end 
    array.map {|sub| sub.length > 1 ? sub.sum : sub.first}.max
end

#O(n)time O(1) memory
def sub_sum(list)
    largest_sum = list.first
    current_sum = list.first #keep track of current sum 
    (1...list.length).each do |idx|
        current_sum = 0 if current_sum < 0
        current_sum += list[idx]
        if current_sum > largest_sum
            largest_sum = current_sum 
        end
    end
    largest_sum
end




# Example:

    # list = [5, 3, -7]
    # largest_contiguous_subsum(list) # => 8
    # p sub_sum([5, 3, -7]) #=> 8 

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

# Example 2:

    # list = [2, 3, -6, 7, -6, 7]
    # p sub_sum(list) # => 8 (from [7, -6, 7])
# Example 3:

    # list = [-5, -1, -3]
    # p sub_sum(list) # => -1 (from [-1])

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using 
# nested loops. First make an array to hold all sub-arrays. Then find the sums of
#  each sub-array and return the max.

# Discuss the time complexity of this solution.

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory.
#  Keep a running tally of the largest sum. To accomplish this efficient space 
#  complexity, consider using two variables. One variable should track the largest
# sum so far and another to track the current sum. We'll leave the rest to you.

# Anagrams

# Our goal today is to write a method that determines if two given words are anagrams. 
# This means that the letters in one word can be rearranged to form the other word. For example:


#
# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. 
# Check if the second string is one of these.


#O(n!)
def first_anagram?(str1, str2)
    str1.split("").permutation.include?(str2.split(""))    #.to_a.include?(str2.split("")) 
end


# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each 
# letter in the first string, find the index of that letter in the second string 
# (hint: use Array#find_index) and delete at that index. The two strings are anagrams 
# if an index is found for every letter and the second string is empty at the end of the iteration.

#O(n^2)
def second_anagram?(str1,str2)
    chars = str2.split("")
    str1.each_char do |char|
        index = chars.find_index(char)
        return false if index.nil?
        chars.delete_at(index)
    end
    chars.length == 0
end

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings
#  alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.

# O(nlogn)
def third_anagram?(str1, str2)
    str1.split("").sort == str2.split("").sort
end

# What is the time complexity of this solution? Is it better or worse than #second_anagram??


# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the 
# number of times each letter appears in both words. Compare the resulting hashes.

#O(n)
def fourth_anagram?(str1, str2)
    count1 = Hash.new(0)
    

    str1.each_char{|char| count1[char] += 1}
    str2.each_char{|char| count1[char] -= 1}

    count1.values.all?{|value| value == 0}
end


# What is the time complexity?

# Bonus: Do it with only one hash.

# Discuss the time complexity of your solutions together, then call over your TA to look at them.



# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true


# two_sum?
# Given an array of unique integers and a target sum, determine whether any two integers in the array sum to that amount.


# Learning Goals
# Be able to reason about a difficult problem and think of ways to solve it.
# Be able to determine and explain the time and space complexity of a method
# Be able to recognize when time or space complexity can be improved
# Know some common tricks to improve time or space complexity
# Before you start coding anything, talk it over with your partner. Sketch out 
# on paper how you'd approach this problem. What would be the running time of your
#  proposed solution? Take as long as you need, but don't write any code yet.

# Brute force
# If we weren't worried about time complexity, what would be the most straightforward 
# way to solve this problem? To start with, we could check every possible pair. If 
# we sum each element with every other, we're sure to either find the pair that sums
#  to the target, or determine that no such pair exists.

#O(n^2)
def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2,idx2|
            if idx2 > idx1 && arr[idx1] + arr[idx2] == target_sum
                return true
            end
        end
    end
    false
end

arr = [0, 1, 5, 7]
bad_two_sum?(arr, 6) # => should be true
bad_two_sum?(arr, 10) # => should be false

# This is the brute force solution. It's essentially hitting the problem with a 
# sledge hammer. There are faster and more elegant ways to solve the problem, but 
# we know for sure that this will get the job done.

# Let's start by implementing the brute force solution. Write a method called bad_two_sum?, which checks every possible pair.

# Make sure that you don't pair an element with itself. However, you don't need
#  to bother checking for summing the same pair twice; that won't affect your result.

# (Note: you can cut the running-time significantly by returning early, and by 
# not checking pairs more than once. However, these micro-optimizations will not 
# improve the time complexity of the solution. Do you see why?)

# Once you're done, write a comment with your solution's time complexity.

# Sorting
# As a person of elevated algorithmic sensibilities, the brute-force approach 
# is beneath you. Leave that nonsense to the riffraff. Instead, you'll apply a refined and time-honored technique: sorting.

# Sort your data, then try to solve the problem.

# What does sorting do to the lower bound of your time complexity?
# How might sorting that make the problem easier?
# Write a second solution, called okay_two_sum?, which uses sorting. Make sure it works correctly.

def okay_two_sum?(arr, target_sum)
    sorted = arr.sort
    idx1 = 0   #arr[0] arr legnt - 1
    idx2 = arr.length - 1
    while idx1 != idx2
        case arr[idx1] + arr[idx2] <=> target_sum
        when 1
            idx2 -= 1
        when -1
            idx1 += 1
        when 0
            return true
        end
    end
    false
end
#nice working with you!!! whlein kyeou

# likewise!!!
# send over the rest of the projects when you have the chance please.. have a nice weekend and lmk if you ever wanna study

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

# Hint: (There are a couple ways to solve this problem once it's sorted. One way
#  involves using a very cheap algorithm that can only be used on sorted data sets. What are some such algorithms you know?)

# Hash Map
# Finally, it's time to bust out the big guns: a hash map. Remember, a hash map 
# has O(1) #set and O(1) #get, so you can build a hash out of each of the n elements
#  in your array in O(n) time. That hash map prevents you from having to repeatedly
#   find values in the array; now you can just look them up instantly.

# See if you can solve the two_sum? problem in linear time now, using your hash map.

# Once you're finished, make sure you understand the time complexity of your 
# solutions and then call over your TA and show them what you've got. Defend to 
# them why each of your solutions has the time complexity you claim it does.

