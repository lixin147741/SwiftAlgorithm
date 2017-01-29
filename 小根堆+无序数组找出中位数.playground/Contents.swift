//: Playground - noun: a place where people can play

import UIKit

// 把处于k位置的元素交换到对应的位置上
func siftDown(_ a: inout [Int], k: Int) {
    
    var k = k
    
    while k < a.count {
        
        var smallest = k

        if k * 2 + 1 < a.count && a[k * 2 + 1] < a[smallest] {
            smallest = k * 2 + 1
        }

        if k * 2 + 2 < a.count && a[k * 2 + 2] < a[smallest] {
            smallest = k * 2 + 2
        }
        
        if smallest == k {
            break
        }
        
        let temp = a[smallest]
        a[smallest] = a[k]
        a[k] = temp

        k = smallest
    }
}

// 创建一个小根堆（调整一个小根堆）
func createHeap(_ a: [Int]) -> [Int] {
    
    var a = a
    for i in (0...a.count/2).reversed() {
        siftDown(&a ,k: i)
    }
    
    return a
}

// 忘小根堆里面插入一个元素，并且调整堆
func insertHeap(_ a: inout [Int], t: Int) {
    var tmp = a.count
    a.append(t)
    
    while tmp >= 0 && a[(tmp-1)/2] > a[tmp] {
        swap(&a[(tmp-1)/2], &a[tmp])

        tmp = (tmp-1)/2
    }
}

var a = [2,7,26,25,19,17,1,90,3,36,18]

// 找中位数
var a1 = Array(a.prefix((a.count+1)/2))
var a2 = a[(a.count+1)/2+1..<a.count]

var t = createHeap(a1)
for i in a2 {
    if i > t.first ?? 0 {
        t[0] = i
        t = createHeap(t)
    }
}
print(t.first ?? 0)
