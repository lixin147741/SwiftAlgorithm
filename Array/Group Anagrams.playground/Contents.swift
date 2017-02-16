//: Playground - noun: a place where people can play

import UIKit

// Author: Kee
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var dic = Dictionary<String, [String]>()
        for s in strs {
            if var arr = dic[s.hash] {
                arr.append(s)
                dic[s.hash] = arr
            } else {
                dic[s.hash] = [s]
            }
        }
        
        var tmpArr = [[String]]()
        for v in dic.values {
            tmpArr.append(v)
        }
        return tmpArr
    }
}

extension String {
    var hash: String {
        
        return String(self.characters.sorted())
    }
}


