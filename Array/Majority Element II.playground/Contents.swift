//: Playground - noun: a place where people can play
16
import UIKit

/*
 https://leetcode.com/problems/majority-element-ii/
 */

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        if nums.count <= 0 {
            return []
        }
        var result = [Int]()
        var num1 = nums[0]
        var num2 = nums[0]
        var count1 = 0
        var count2 = 0
        for n in nums {
            if n == num1 {
                count1 += 1
            } else if n == num2 {
                count2 += 1
            } else if count1 == 0 {
                num1 = n
                count1 = 1
            } else if count2 == 0 {
                num2 = n
                count2 = 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        count1 = 0
        count2 = 0
        for n in nums {
            if n == num1 {
                count1 += 1
            } else if n == num2 {
                count2 += 1
            }
        }
        if count1 > nums.count / 3 {
            result.append(num1)
        }
        if count2 > nums.count / 3 {
            result.append(num2)
        }
        return result
    }
}