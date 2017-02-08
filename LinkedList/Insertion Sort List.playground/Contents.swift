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
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        
        let result = ListNode(0)
        var head = head
        var pre: ListNode? = result
        var next: ListNode? = nil

        while head != nil {
            next = head!.next
            
            while pre!.next != nil && pre!.next!.val < head!.val {
                pre = pre!.next
            }
            
            head?.next = pre?.next
            pre?.next = head
            pre = result
            head = next
        }
        
        return result.next
    }
}