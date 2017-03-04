//: Playground - noun: a place where people can play

// Author: Kee
// 思路： 使用栈，遍历数组依次入栈，每次入栈前判断当前栈顶元素是否大于待入栈元素，
// 如果大于待入栈元素则弹出栈，否则待入栈元素入栈，直到弹出元素的个数小于等于k为止，
// 最后输出栈底的元素即可。
class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        
        var k = k
        var res = ""
        
        for c in num.characters {
            while k > 0 && res.characters.count > 0 && Int(String(res.characters.last!))! > Int(String(c))! {
                res = String(res.characters.dropLast())
                k -= 1
            }
            res += String(c)
        }
        
        res = String(res.characters.dropLast(k))
        while !res.isEmpty && res.characters.first! == "0" {
            res = String(res.characters.dropFirst())
        }
        
        return res.characters.count > 0 ? res : "0"
    }
}

var a = ""
let s = Solution()
a = s.removeKdigits("123", 2)
a = s.removeKdigits("10200", 1)
a = s.removeKdigits("1432219", 3)
a = s.removeKdigits("10", 2)
a = s.removeKdigits("123", 2)
a = s.removeKdigits("123", 2)