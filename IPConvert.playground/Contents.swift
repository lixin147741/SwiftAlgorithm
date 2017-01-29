//: Playground - noun: a place where people can play
import Foundation
/*
 百词斩的程序员喜欢研究各种算法。百词斩的Jerry自己做了一个简单的IP变换算法，将一个IP地址转化为字符串。比如IP地址1.1.1.129：
 第一步：转化为二进制：00000001000000010000000110000001
 第二步：替换（0用a表示，1用b表示）：aaaaaaabaaaaaaabaaaaaaabbaaaaaab
 第三步：将连续相同的字符合并：7a1b7a1b7a2b6a1b
 第四步：减少长度，将数字1去掉：7ab7ab7a2b6ab。
 现在给出一个Jerry的算法生成的字符串，请你来还原最初的IP地址。
 
 输入：
 1、输入为一行，含有a、b和数字的字符串
 
 输出：
 1、输出为一行，即最初的IP地址
 
 Sample Input：
 7ab7ab7a2b6ab
 
 Sample Output：
 1.1.1.129
 */

let kCountOfIPV4 = 4
let kCountOfBinary = 8

// 按照定义各种操作字符串
func ipConvert(encryptIP: String) -> String
{
    var encryptIP = encryptIP
    
    //还原后的字符串
    var originStr = ""
    
    var resultStr = ""
    // 还原字符串
    while !encryptIP.isEmpty {
        // 找到第一个a或者b的位置
        var firstCharIndex = encryptIP.startIndex
        var dis = 0
        for c in encryptIP.characters
        {
            if c == "a" || c == "b"
            {
                firstCharIndex = encryptIP.index(firstCharIndex, offsetBy: dis)
                break;
            }
            dis += 1
        }
        // 获取a或者b前面的数字
        if firstCharIndex == encryptIP.startIndex
        {
            // 数字是1
            let ch = encryptIP[firstCharIndex]
            originStr.append(ch)
            let _ = encryptIP.remove(at: firstCharIndex)
        }
        else
        {
            let count = Int(encryptIP.substring(to: firstCharIndex)) ?? 0
            let ch = encryptIP[firstCharIndex]
            
            encryptIP.removeSubrange(ClosedRange(uncheckedBounds:(encryptIP.startIndex, firstCharIndex)))
            
            for _ in 0..<count
            {
                originStr.append(ch)
            }

        }
    }
    
    // 如果不是32位说明输入不合法
    guard originStr.characters.count == 32 else
    {
        print(originStr)
        print(originStr.characters.count)
        return ""
    }
    
    // 把a，b替换成0，1
    originStr = originStr.replacingOccurrences(of: "a", with: "0").replacingOccurrences(of: "b", with: "1")
    
    // 把二进制转化成十进制的IP
    for i in 0..<kCountOfIPV4
    {
        // 每8位截取一次
        let start = originStr.index(originStr.startIndex, offsetBy: i*kCountOfBinary)
        let end = originStr.index(originStr.startIndex, offsetBy: (i+1)*kCountOfBinary)
        let subStr = originStr.substring(with: Range(uncheckedBounds: (start, end)))
        
        resultStr = resultStr + binTodec(number: subStr) + (i==kCountOfIPV4 - 1 ? "" : ".")
    }
    
    return resultStr
}

// 把二进制转化为十进制
func binTodec(number num: String) -> String {
    var sum: Int = 0
    for c in num.characters {
        let str = String(c)
        sum = sum * 2 + Int(str)!
    }
    return String(sum)
}

// Test case
ipConvert(encryptIP: "7ab7ab7a2b6ab")
ipConvert(encryptIP: "7a5b3ab7a7bab")
ipConvert(encryptIP: "32a")
ipConvert(encryptIP: "32b")
ipConvert(encryptIP: "31ab")
ipConvert(encryptIP: "a31b")
ipConvert(encryptIP: "abababababababababababababababab")
ipConvert(encryptIP: "babababababababababababababababa")
ipConvert(encryptIP: "7a5b2a2b7a7bab")
ipConvert(encryptIP: "2a2b2a2b2a2b2a2b2a2b2a2b2a2b2a2b")
ipConvert(encryptIP: "2b2a2b2a2b2a2b2a2b2a2b2a2b2a2b2a")


