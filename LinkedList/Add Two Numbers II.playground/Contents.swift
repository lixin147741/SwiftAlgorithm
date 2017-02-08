//: Playground - noun: a place where people can play

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1
        var l2 = l2
        
        var stack1 = [Int]()
        var stack2 = [Int]()
        var result = [Int]()
        
        while l1 != nil {
            stack1.append(l1!.val)
            l1 = l1!.next
        }
        
        while l2 != nil {
            stack2.append(l2!.val)
            l2 = l2!.next
        }
        
        var needPlusOne = false
        while !stack1.isEmpty || !stack2.isEmpty {
            var value = 0
            if let s1 = stack1.popLast() {
                value += s1
            }
            if let s2 = stack2.popLast() {
                value += s2
            }
            if needPlusOne {
                value += 1
            }
            if value > 9 {
                needPlusOne = true
                value %= 10
                
            } else {
                needPlusOne = false
            }
            result.append(value)
        }
        if needPlusOne {
            result.append(1)
        }
        
        return getList(result.reversed())
    }
    
    func getList(_ list: [Int]) -> ListNode? {
        
        if list.count == 0 {
            return nil
        }
        let root: ListNode = ListNode(list[0])
        root.next = getList(Array(list.dropFirst(1)))
        
        return root
    }
    
    func printListNode(_ root: ListNode?) {
        var root = root
        while root != nil {
            print(root!.val)
            root = root?.next
        }
    }
}


var t = [7]
print(t.popLast())

let a = [7,2,4,3]
let b = [5,6,4]
let s = Solution()
let aa = s.getList(a)
let bb = s.getList(b)

let list = s.addTwoNumbers(aa, bb)
list?.val
s.printListNode(list)
