//: Playground - noun: a place where people can play

import UIKit

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
    func isBalanced(_ root: TreeNode?) -> Bool {
        return depth(root) == -1
    }
    
    func depth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let left = depth(root?.left)
        let right = depth(root?.right)
        
        if left == -1 || right == -1 || abs(left - right) > 1 {
            return -1
        } else {
            return max(left, right) + 1
        }
    }
}