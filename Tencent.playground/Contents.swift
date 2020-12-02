import UIKit

var leetcode = "https://leetcode-cn.com/leetbook/read/tencent/x6zv4j/"

print(leetcode)

class Solution {}

// MARK: 数组

/// 两数之和
extension Solution {
    class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var map: [Int: Int] = [:]
        
        for (i, n) in nums.enumerated() {
            let offset = target - n
            let value = map[n]
            
            if let v = value {
                return [i,v]
            } else {
                map.updateValue(i, forKey: offset)
            }
        }
        
        return []
        
    }
}

let case1 = [-1,-2,-3,-4,-5]
print(Solution.twoSum(case1, -8))

// MARK: 字符串


// MARK: 链表


