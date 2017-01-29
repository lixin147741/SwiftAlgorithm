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


//class Solution {
//    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
//        
//        guard let root = root else {
//            return 0
//        }
//        
//        return leftLeaves(root.left) + rightLeaves(root.right)
//    }
//    
//    func leftLeaves(_ root: TreeNode?) -> Int {
//        
//        if root == nil { return 0 }
//        if root!.left == nil && root!.right == nil {
//            return root!.val + leftLeaves(root!.left) + rightLeaves(root!.right)
//        }
//        return 0 + leftLeaves(root?.left) + rightLeaves(root?.right)
//    }
//    
//    func rightLeaves(_ root: TreeNode?) -> Int {
//        
//        if let root = root {
//            return 0 + leftLeaves(root.left) + rightLeaves(root.right)
//        }
//        return 0
//    }
//}

extension TreeNode {
    public var isLeaves: Bool {
        return left == nil && right == nil
    }
}

class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        
        if root.left != nil && root.left!.isLeaves {
            return root.left!.val + sumOfLeftLeaves(root.right)
        }
        
        return sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right)
    }
}
