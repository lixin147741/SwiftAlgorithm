//: Playground - noun: a place where people can play

import UIKit

/*
 
 s = "3[a]2[bc]", return "aaabcbc".
 s = "3[a2[c]]", return "accaccacc".
 s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
 
 https://leetcode.com/problems/decode-string/
 
 */

func decodeString(_ s: String) -> String {
    
    var numStack = [Int]()
    var letterStach = [String]()
    var result = ""
    var count = 0

    for c in s.characters {
        
        if let digit = Int(String(c)) {
            
            count = count * 10 + digit
            
        } else if c == "[" {
            
            numStack.append(count)
            letterStach.append(result)
            count = 0
            result = ""
            
        } else if c == "]" {
            
            let num = numStack.popLast() ?? 0
            var temp = letterStach.popLast() ?? ""
            
            for _ in 0..<num {
                temp += result
            }
            
            result = temp
            
        } else {
            result += String(c)
        }
    }
    
    return result
}

print(decodeString("3[a]2[bc]"))
print(decodeString("3[a2[c]]"))
print(decodeString("2[abc]3[cd]ef"))
print(decodeString("2[s2s[s2s[2d[2d[d]fd]]]]"))
print(decodeString("10[s10[a]]"))


