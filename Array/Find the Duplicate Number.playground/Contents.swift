//: Playground - noun: a place where people can play

import UIKit

/*
 https://leetcode.com/problems/find-the-duplicate-number/
 */

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        
        var low = 1
        var high = nums.count - 1
        
        while low < high {
            let mid = low + (high - low) / 2
            var count = 0
            for i in nums {
                if i <= mid {
                    count += 1
                }
            }
            
            if count <= mid {
                low = mid + 1
            } else {
                high = mid
            }
        }
        
        return low
    }
}