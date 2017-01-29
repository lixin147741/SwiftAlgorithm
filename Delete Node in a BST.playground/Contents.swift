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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        guard let root = root else {
            return nil
        }
        
        if root.val == key {
            
            guard let right = root.right else {
                return root.left
            }
            guard let _ = root.left else {
                return root.right
            }
            
            let node = minNode(right)
            root.val = node.val
            root.right = deleteNode(right, node.val)
            
        } else if root.val > key {
            root.left = deleteNode(root.left, key)
        } else {
            root.right = deleteNode(root.right, key)
        }
        
        
        return root
    }
    
    func minNode(_ root: TreeNode) -> TreeNode {
        guard let left = root.left else {
            return root
        }
        return minNode(left)
    }
}