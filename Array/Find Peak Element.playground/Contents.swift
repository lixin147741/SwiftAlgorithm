//: Playground - noun: a place where people can play

import UIKit

/*
 https://leetcode.com/problems/find-peak-element/
 */

// 方法一：O(n)
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        
        var (index, peak) = nums[0] - nums[nums.count - 1] > 0 ? (0, nums[0]) : (nums.count - 1, nums[nums.count - 1])
        
        if nums.count <= 2 {
            return index
        }
        
        for i in 1...nums.count - 2 {
            if nums[i] > nums[i - 1] && nums[i] > nums[i + 1] {
                if peak < nums[i] {
                    peak = nums[i]
                    index = i
                }
            }
        }
        
        return index
    }
}

// 方法二： O(n)
class Solution2 {
    func findPeakElement(_ nums: [Int]) -> Int {
        
        var (ind, max) = (0, nums[0])
        
        for (index, value) in nums.enumerated() {
            if max < value {
                max = value
                ind = index
            }
        }
        
        return ind
    }
}

// 方法三： lg(n)
class Solution3 {
    func findPeakElement(_ nums: [Int]) -> Int {
        return findPeakElement(nums, start: 0, end: nums.count - 1)
    }
    
    func findPeakElement(_ nums: [Int], start: Int, end: Int) -> Int {
        if start == end {
            return start
        } else if start + 1 == end {
            return nums[start] > nums[end] ? start : end
        } else {
            let mid = start + (end - start) / 2
            
            if nums[mid] > nums[mid - 1] && nums[mid] > nums[mid + 1] {
                return mid
            } else if nums[mid - 1] > nums[mid] && nums[mid] > nums[mid + 1] {
                return findPeakElement(nums, start: start, end: mid - 1)
            } else {
                return findPeakElement(nums, start: mid + 1, end: end)
            }
        }
    }
}
