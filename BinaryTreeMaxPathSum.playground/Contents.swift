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
    
    var maxValue = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        
        maxValue = Int.min
        dfs(root)
        return maxValue
    }
    
    func dfs(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        
        var left = dfs(root?.left)
        var right = dfs(root?.right)
        left = left > 0 ? left : 0
        right = right > 0 ? right : 0
        // 记录当前状态
        maxValue = max(maxValue, left + right + (root?.val ?? 0))
        return max(left, right) + (root?.val ?? 0)
    }
}