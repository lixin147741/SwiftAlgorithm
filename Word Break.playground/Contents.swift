//: Playground - noun: a place where people can play

import UIKit

/*
 
 https://leetcode.com/problems/word-break/
 
 */

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        // contains[n]表示s中前n个元素能用list中的元素组合出来
        var contains = [Bool](repeating: false, count: s.characters.count+1)
        contains[0] = true
        
        for i in 1...s.characters.count {
            for j in 0..<i {
                
                if !contains[j] {
                    continue
                }
                
                let start = s.index(s.startIndex, offsetBy: j)
                let end = s.index(s.startIndex, offsetBy: i)
                
                contains[i] = contains[j] && wordDict.contains(s.substring(with: Range(uncheckedBounds: (lower: start, upper: end))))
                
                if contains[i] {
                    break
                }
            }
        }

        return contains[s.characters.count]
    }
}

let s = Solution()
s.wordBreak("leetcode", ["leet","code"])
s.wordBreak("aaaaaaa", ["aaaa","aa"])
