//: Playground - noun: a place where people can play

import UIKit

/*
 
 https://leetcode.com/problems/sum-root-to-leaf-numbers/
 
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
    func sumNumbers(_ root: TreeNode?) -> Int {
        
        return sum(root: root, s: 0)
    }
    
    func sum(root: TreeNode?, s: Int) -> Int
    {
        return root == nil ? 0 : (root!.left == nil && root!.right == nil) ? root!.val + s * 10 : sum(root: root!.left, s: root!.val + s * 10) + sum(root: root!.right, s: root!.val + s * 10)
    }
    
    var totalSum = 0
    var s = 0
    
    func sum1(root: TreeNode?)
    {
        if root == nil {return}
        
        s = s*10 + root!.val
        if root!.left == nil && root!.right == nil
        {
            totalSum += s
        }
        else
        {
            sum1(root: root!.left)
            sum1(root: root!.right)
        }
        s /= 10
    }

}
