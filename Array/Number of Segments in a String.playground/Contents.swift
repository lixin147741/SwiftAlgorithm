//: Playground - noun: a place where people can play

import UIKit

// Author: Kee
class Solution {
    func countSegments(_ s: String) -> Int {
        var s = s + " "
        var count = 0
        let len = s.characters.count
        for (index, c) in s.characters.enumerated() {
            if index == len - 1 {
                continue
            }
            if c != " " && s[s.index(s.startIndex, offsetBy: index + 1)] == " " {
                count += 1
            }
        }
        
        return count
    }
}