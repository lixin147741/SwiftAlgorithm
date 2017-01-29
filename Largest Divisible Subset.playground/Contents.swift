//: Playground - noun: a place where people can play

import UIKit

class Solution {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        
        if nums.count <= 1 {
            return nums
        }
        
        var nums = nums.sorted()
        var length = [Int]()
        var res = [[Int]]()
        var index: (index: Int, maxLength: Int) = (0, 0)
        
        /// L[i] = max(L[j])+1
        
        for i in 0..<nums.count {
            print(i)
            length.append(1)
            res.append([nums[i]])
            
            for j in 0..<i {
                
                if nums[i] % nums[j] == 0 && length[j] + 1 > length[i] {
                    
                    length[i] = length[j] + 1
                    res[i].append(nums[j])
                }
                
            }
            // 记录最大的长度的位置
            index = index.maxLength > res[i].count ? (index.index, index.maxLength) : (i, res[i].count)

        }
        return res[index.index]
    }
}

let s = Solution()
s.largestDivisibleSubset([1, 2, 4, 8, 16])