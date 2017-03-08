
// Author: Kee
class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        
        var res = [1]
        var i2 = 0 // 上一次乘2之后最小值的index
        var i3 = 0 // 上一次乘3之后最小值的index
        var i5 = 0 // 上一次乘5之后最小值的index
        
        
        while res.count < n {
            let t2 = res[i2] * 2
            let t3 = res[i3] * 3
            let t5 = res[i5] * 5
            let minVal = min(min(t2, t3), t5)
            res.append(minVal)
            if minVal == t2 { i2 += 1 }
            if minVal == t3 { i3 += 1 }
            if minVal == t5 { i5 += 1 }
        }
        
        return res.last ?? 1
    }
}