//: Playground - noun: a place where people can play

import UIKit

/*
 https://leetcode.com/problems/minimum-depth-of-binary-tree/
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
    func minDepth(_ root: TreeNode?) -> Int {
        
        if root == nil { return 0 }
        if root!.left == nil { return 1 + minDepth(root?.right) }
        if root!.right == nil { return 1 + minDepth(root?.left) }
        return 1 + min(minDepth(root?.left), minDepth(root?.right))
    }
}