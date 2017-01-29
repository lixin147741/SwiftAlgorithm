//: Playground - noun: a place where people can play

import UIKit


/*
 
 https://leetcode.com/problems/kth-smallest-element-in-a-bst/
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
    var list = [Int]()
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        
        iteratorTree(root, k)
        return list.last!
    }
    
    func iteratorTree(_ root: TreeNode?, _ k: Int) {
        
        if list.count == k { return }
        
        if let left = root?.left {
            iteratorTree(left, k)
        }
        
        if list.count == k { return }
        
        list.append(contentsOf: [root!.val])
        
        if let right = root?.right {
            iteratorTree(right, k)
        }
    }
}
