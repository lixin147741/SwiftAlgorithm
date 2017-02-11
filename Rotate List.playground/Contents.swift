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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard var head = head else {
            return nil
        }
        guard k > 0 else {
            return head
        }
        var cur = head
        var len = 1
        while cur.next != nil {
            cur = cur.next!
            len += 1
        }
        
        cur.next = head

        let index = len - k % len
        var tail = head
        for _ in 1..<index {
            tail = tail.next!
        }
        
        head = tail.next!
        tail.next = nil
        return head
    }
}