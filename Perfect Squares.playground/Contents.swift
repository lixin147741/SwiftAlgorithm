//: Playground - noun: a place where people can play

import UIKit

/*
    题目： https://leetcode.com/problems/perfect-squares/
    数学公式参考：
    https://en.wikipedia.org/wiki/Legendre's_three-square_theorem
    https://zh.wikipedia.org/wiki/%E5%9B%9B%E5%B9%B3%E6%96%B9%E5%92%8C%E5%AE%9A%E7%90%86
 */

class Solution {
    // DP  O(n2)
    func numSquares(_ n: Int) -> Int {
        
        var dp = [Int](repeating:.max, count: n+1)
        dp[0] = 0
        
        for i in 1...n {
            var j = 1
            while j*j <= i {
                dp[i] = min(dp[i], dp[i - j*j] + 1)

                j += 1
            }
        }
        return dp.last ?? 0
    }
    
    // Math 
    func numSquaress(_ n: Int) -> Int {
        var n = n
        // 完全平方数
        if isSquare(n) {
            return 1
        }
        
        while n%4 == 0 {
            n>>=2
        }
        if n%8 == 7 {
            return 4
        }
        print(n)
        for i in 1...Int(sqrt(Double(n))) {
            if isSquare(n - i*i) {
                return 2
            }
        }
        
        return 3
    }
    
    func isSquare(_ n: Int) -> Bool {
        let sq = Int(sqrt(Double(n)))
        // 完全平方数
        if sq * sq == n {
            return true
        }
        return false
    }
}

let s = Solution()
s.numSquaress(96)
s.numSquares(96)