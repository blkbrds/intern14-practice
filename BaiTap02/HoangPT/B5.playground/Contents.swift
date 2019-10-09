import UIKit

/**
 *  CStacl class
 **/
class CStack {
    var stackArr: [Int]
    var stackLimit: Int
    init(_ stackArr: [Int], _ stackLimit: Int = 5) {
        self.stackArr = stackArr
        self.stackLimit = stackLimit
    }
    
    func checkIsEmpty() -> Bool {
        if stackArr.isEmpty {
            print("Stack is empty!")
            return true
        } else {
            print("Stack isn't empty!")
            return false
        }
    }
    
    func checkIsFull() -> Bool {
        if stackArr.count == stackLimit {
            print("Stack is full")
            return true
        } else {
            print("Stack isn't full")
            return false
        }
    }
    
    func addItem(_ item: Int) -> [Int] {
        stackArr.append(item)
        return stackArr
    }
    
    func removeFistItem() -> [Int] {
        stackArr.removeFirst(1)
        return stackArr
    }
}

// Test
let stacks: [CStack] = [
    CStack([]),
    CStack([2,4,6,8]),
    CStack([1,3,5,7,9])
]

for (key, stack) in stacks.enumerated() {
    print("Check stack \(key):")
    if (!stack.checkIsEmpty()) {
        if (stack.checkIsFull()) {
            print("Stack after remove item: \(stack.removeFistItem())")
        } else {
            print("Stack after add item: \(stack.addItem(99))")
        }
    }
}
