//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
    
        if num1[num1.startIndex] == "0" || num2[num2.startIndex] == "0" {
            return "0"
        }
        
        var res: [Int] = (num1+num2).characters.map { _ in return 0 }
        
        for (i, n1) in num1.characters.enumerated() {
            for (j, n2) in num2.characters.enumerated() {
                let val = Int(String(n1))! * Int(String(n2))!
                let p1 = i + j
                let p2 = i + j + 1
                
                let sum = val + res[p2]

                res[p1] += sum / 10
                res[p2] = sum % 10
            }
        }
        
        var c = 0
        for (i, n) in res.reversed().enumerated() {
            let val = n + c
            res[res.count - i - 1] = val % 10
            if val >= 10  {
                c = val / 10
            } else {
                c = 0
            }
        }
        
        var resStr = ""
        for n in res {
            if resStr.isEmpty && String(n) == "0" {
                continue
            }
            resStr += String(n)
        }
        
        return resStr
    }
}

let s = Solution()
s.multiply("999", "999")
s.multiply("123", "456")
s.multiply("123456789", "987654321")