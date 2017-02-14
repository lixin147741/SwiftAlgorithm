//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {

        var res = ""
        var ac = a.characters.count - 1
        var bc = b.characters.count - 1
        var carry = 0
        while ac >= 0 || bc >= 0 || carry > 0 {
            let ad = ac >= 0 ? Int(String(a[a.index(a.startIndex, offsetBy: ac)]))! : 0
            let bd = bc >= 0 ? Int(String(b[b.index(b.startIndex, offsetBy: bc)]))! : 0
            
            carry = ad + bd + carry
            res = "\(carry % 2)" + res
            carry = carry >= 2 ? 1 : 0
            
            ac -= 1
            bc -= 1
        }
        
        return res
    }
}




let s = Solution()
let a = s.addBinary("10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101", "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011")