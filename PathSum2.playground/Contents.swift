//: Playground - noun: a place where people can play

import UIKit

/*
 
 https://leetcode.com/problems/path-sum-ii/
 
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        
        sum2(root: root, num:sum)
        return list
    }
    
    var list = [[Int]]()
    var l = [Int]()
    var s = 0
    func sum2(root: TreeNode?, num: Int)
    {
        if root == nil {return}
        
        l.append(root!.val)
        
        s = s + root!.val
        if root!.left == nil && root!.right == nil
        {
            if s == num
            {
                list.append(l)
            }
        }
        else
        {
            sum2(root: root!.left, num: num)
            sum2(root: root!.right, num: num)
        }
        s -= root!.val
        l.popLast()
    }
}