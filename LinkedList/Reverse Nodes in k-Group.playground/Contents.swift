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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var head = head
        var cur = head
        var c = 0
        while cur != nil && c != k {
            cur = cur?.next
            c += 1
        }
        
        if c == k {
            cur = reverseKGroup(cur, k)
            
            // reverse
            for _ in 0..<c {
                let tmp = head?.next
                head?.next = cur
                cur = head
                head = tmp
            }
            
            head = cur
        }
        
        return head
    }
}