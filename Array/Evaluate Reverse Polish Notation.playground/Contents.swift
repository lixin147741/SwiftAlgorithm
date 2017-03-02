//: Playground - noun: a place where people can play

// Author: Kee
extension String {
    var isOperator: Bool {
        if self == "+" ||
            self == "-" ||
            self == "*" ||
            self == "/" {
            return true
        }
        
        return false
    }
    
    func caculator(first: Int, second: Int) -> Int {
        if self == "+" {
            return first + second
        } else if self == "-" {
            return first - second
        } else if self == "*" {
            return first * second
        } else if self == "/" {
            return first / second
        } else {
            return 0
        }
    }
}

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var numStack = [Int]()
        
        for c in tokens {
            if c.isOperator {
                let second = numStack.popLast()!
                let first = numStack.popLast()!
                let res = c.caculator(first: first, second: second)
                numStack.append(res)
            } else {
                numStack.append(Int(String(c))!)
            }
        }
        return numStack.first!
    }
}