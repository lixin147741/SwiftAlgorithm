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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let start: ListNode? = ListNode(0)
        var fast = start
        var slow = start
        slow?.next = head
        
        for _ in 0...n {
            fast = fast?.next
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
        return start?.next
    }
}