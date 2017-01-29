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
    var nodes = [Int]()
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        rightSideNode(root, height: 0)
        return nodes
    }
    
    // 对于每一层来说优先使用右边的节点，如果右边节点不存在则使用左边的节点
    func rightSideNode(_ root: TreeNode?, height: Int) {
        if root == nil {
            return
        }
        if height == nodes.count {
            nodes.append(root!.val)
        }
        rightSideNode(root?.right, height: height + 1)
        rightSideNode(root?.left, height: height + 1)
    }
}