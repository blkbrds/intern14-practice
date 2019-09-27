import UIKit

class CStack {

    private(set) var stackArray = [Int]()
    private(set) var max = 20
    
    func isEmpty() -> Bool {
        if stackArray.isEmpty {
            return true
        }
        return false
    }
    
    func isFull() -> Bool {
        return stackArray.count == max
    }
    
    func push(number stackItem: Int) -> Void {
        if !isFull() {
            stackArray.append(stackItem)
        } else {
            print("Stack is full.")
        }
    }
    
    func pop() -> Int? {
        return stackArray.popLast()
    }
}
