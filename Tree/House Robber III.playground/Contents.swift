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

extension TreeNode: Hashable, Equatable {
    
    public var hashValue: Int {
        return "\(Unmanaged.passUnretained(self).toOpaque())".hashValue
    }
    
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

class Solution {
    
    var dic = [TreeNode:Int]()
    
    func rob(_ root: TreeNode?) -> Int {
        
        if root == nil { return 0 }
        
        if let res = dic[root!] {
            print(res)
            return res
        }
        
        var val = 0
        if root!.left != nil {
            val += rob(root!.left?.left) + rob(root!.left?.right)
        }
        if root!.right != nil {
            val += rob(root!.right?.left) + rob(root!.right?.right)
        }
        val = max(root!.val + val, rob(root?.left) + rob(root?.right))
        dic[root!] = val
        
        return val
    }
}

let t = TreeNode(2)
let t1 = TreeNode(1)
let t2 = TreeNode(3)
let t3 = TreeNode(4)

t1.right = t3
t.left = t1
t.right = t2

let s = Solution()
s.rob(t)

t.right?.right
