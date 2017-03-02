//: Playground - noun: a place where people can play

// Author: Kee
// 用了一下快排，看来还没忘干净
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
        var nums = nums
        quickSort(&nums, l: 0, r: nums.count - 1)
        return nums[k-1]
    }
    
    func quickSort(_ nums: inout [Int], l: Int, r: Int) {
        if l >= r {
            return
        }
        var i = l
        var j = r
        let key = nums[i]
        while i < j {
            while i < j && nums[j] <= key {
                j -= 1
            }
            nums[i] = nums[j]
            
            while i < j && nums[i] >= key {
                i += 1
            }
            nums[j] = nums[i]
        }
        nums[i] = key
        quickSort(&nums, l: l, r: i - 1)
        quickSort(&nums, l: i + 1, r: r)
    }
}

let s = Solution()
s.findKthLargest([2,3,4,5,1,6], 2)
