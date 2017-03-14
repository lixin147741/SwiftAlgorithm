// Author: Kee
// 思路：根昨天的Ugly numberII的思路一样，
class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var res = [1] // 超级丑数数组
        var index = [Int](repeatElement(0, count: primes.count)) // 上一个乘了对应因子的最小丑数的下标
        
        while res.count < n {
            var minVal = Int.max
            // 找到当前的最小丑数
            for i in 0..<primes.count {
                let tmp = res[index[i]] * primes[i]
                if tmp < minVal {
                    minVal = tmp
                }
            }
            // 更新下标
            for i in 0..<index.count {
                if minVal == res[index[i]] * primes[i] {
                    index[i] += 1
                }
            }
            
            res.append(minVal)
        }
        return res.last ?? 1
    }
}

let s = Solution()
s.nthSuperUglyNumber(4, [2,7,13,19])
