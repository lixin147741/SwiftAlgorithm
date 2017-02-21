//: Playground - noun: a place where people can play

import Foundation

// Author: Kee
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        var res = ""
        let str = strs.sorted()
        
        let first = str.first ?? ""
        let last = str.last ?? ""
    
        for (i, c) in first.characters.enumerated() {
            if c == last[last.index(last.startIndex, offsetBy: i)] {
                res += String(c)
            } else {
                return res
            }
        }
        
        return res
    }
}