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

/// 寻找两个正序数组的中位数, 求第k小的数
extension Solution {
    
    class func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let length = nums1.count + nums2.count
        
        if length % 2 == 1 {
            let midIndex = length / 2
            return Double(getKthElement(nums1, nums2, midIndex+1))
        } else {
            let midIndex1 = length / 2 - 1
            let midIndex2 = length / 2
            
            return Double(getKthElement(nums1, nums2, midIndex1 + 1) + getKthElement(nums1, nums2, midIndex2 + 1)) / 2
        }
        
        
    }
    
    // 查找第k小的数：原理就是排除小于第k值的数,从两个数组同时进行，所以用k/2 - 1, 这样的话，至多排除k - 2个，如果用k/2,至多会被排除k个，获取不到k值
    class func getKthElement(_ nums1: [Int], _ nums2:[Int], _ lk: Int) -> Int {
        let length1 = nums1.count
        let length2 = nums2.count
        
        //排除元素后新数组的起始点
        var index1 = 0
        var index2 = 0
        var k = lk
        
        while true {
            
            //边界情况，当数组1为空/元素都被排除时，返回数组2的第k个值
            if index1 == length1 {
                return nums2[index2 + k - 1]
            }
            
            if index2 == length2 {
                return nums1[index1 + k - 1]
            }
            
            // k = 1时说明还需要排除一个，剩下的那个就是第k小值，二选一
            if k == 1 {
                return min(nums1[index1], nums2[index2])
            }
            
            // k/2 - 1
            let half = k / 2
            let newIndex1 = min(index1 + half, length1) - 1
            let newIndex2 = min(index2 + half, length2) - 1
            
            let pivot1 = nums1[newIndex1]
            let pivot2 = nums2[newIndex2]
            
            if pivot1 <= pivot2 {
                //+1: k是个数，index是索引。k = 原始k值 - 排除个数
                k = k - (newIndex1 - index1 + 1)
                index1 = newIndex1 + 1
            } else {
                k = k - (newIndex2 - index2 + 1)
                index2 = newIndex2 + 1
            }
 
            
        }
        
        
    }
}

let a = 0 % 2 == 0
Solution.findMedianSortedArrays([1,3], [2])

// MARK: 字符串

/// 最长公共前缀
extension Solution {
    class func longestCommonPrefix(_ strs: [String]) -> String {
        
        if strs.count == 0 {
            return ""
        }
        
        var preStr = strs.first!

        
        for i in 1..<strs.count {
            
            var index = 0
            let str = strs[i]

            var preIndex = preStr.index(preStr.startIndex, offsetBy: index)
            var preChar = preStr[preIndex]
            

            for (j, char) in str.enumerated() {
                
                if preChar.asciiValue == char.asciiValue {
                    break
                }
            }
            
        }
    }
}

// MARK: 链表


