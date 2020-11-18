// Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
// Example 1:
// Input: "babad"
// Output: "bab"
// Note: "aba" is also a valid answer.
// Example 2:
// Input: "cbbd"
// Output: "bb"

function palSubstring(string){
    let sub = "";
    for (let i = 0; i < string.length - 1; i++) {
        for (let j = i+1; j < string.length; j++) {
            let temp = string.slice(i, j+1);
            if (temp === temp.split("").reverse().join("")) {
                if (temp.length > sub.length){
                    sub = temp;
                }
            }
        }
    }
    return sub;
}

console.log(palSubstring("babad"))


// Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
// Integers in each row are sorted from left to right.
// The first integer of each row is greater than the last integer of the previous row.
// Example 1:
// Input:
// matrix = [
//   [1,   3,  5,  7],
//   [10, 11, 16, 20],
//   [23, 30, 34, 50]
// ]
// target = 3
// Output: true
// Example 2:
// Input:
// matrix = [
//   [1,   3,  5,  7],
//   [10, 11, 16, 20],
//   [23, 30, 34, 50]
// ]
// target = 13
// Output: false

function binarySearch(sortedArray, target) {
    let midIdx = Math.floor(sortedArray.length / 2)
    if (sortedArray.length < 1) return -1;

    if (sortedArray[midIdx] === target) {
        return midIdx
    } else if (sortedArray[midIdx] > target) {
        return binarySearch(sortedArray.slice(0, midIdx), target);
    } else {
        let result = binarySearch(sortedArray.slice(midIdx+1, sortedArray.length), target);
        if (result === -1){
            return -1
        } else {
            return result + midIdx + 1
        }
    }
}

