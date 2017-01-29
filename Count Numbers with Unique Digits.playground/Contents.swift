//: Playground - noun: a place where people can play

import UIKit

/*
 https://leetcode.com/problems/count-numbers-with-unique-digits/
 */

class Solution {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        
        var count = [Int]()
        var digitsNum = 9
        
        for i in 0...(n > 10 ? 10 : n) {
    
            if i == 0 {
                count.append(1)
                continue
            }
            if i == 1 {
                count.append(10)
                continue
            }
            
            digitsNum *= (10 - (i - 1))
            
            count.append(count[i-1] + digitsNum)
        }
        
        return count[n > 10 ? 10 : n]
    }
}

class Solution1 {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        
        if n == 0 {
            return 1
        } else if n == 1 {
            return 10
        } else if n == 2 {
            return 91
        } else if n == 3 {
            return 739
        } else if n == 4 {
            return 5275
        } else if n == 5 {
            return 32491
        } else if n == 6 {
            return 168571
        } else if n == 7 {
            return 712891
        } else if n == 8 {
            return 2345851
        } else if n == 9 {
            return 5611771
        } else {
            return 8877691
        }
    }
}

let s = Solution()
s.countNumbersWithUniqueDigits(10)
