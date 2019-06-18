import UIKit

class CStack {
    // size of stack
    var capacity: Int
    
    // first index of stack
    var top: Int
    
    // Stack with int array
    var stack: [Int]
    init(_ capacity: Int) {
        self.capacity = capacity
        self.stack = [Int](repeating: 0, count: capacity)
        self.top = -1
    }
    
    func isEmpty() -> Bool {
        return top == -1
    }
    
    func isFull() -> Bool {
        return top == capacity - 1
    }
    
    func push(_ number: Int) -> String {
        if top == capacity - 1 {
            return "Stack is full"
        } else {
            top += 1
            stack[top] = number
            return "\(stack)"
        }
    }
    
    func pop() -> String {
        if top == -1 {
            return "Stack is empty"
        } else {
            stack[top] = 0
            top -= 1
            return "\(stack)"
        }
    }
}
var cStack = CStack(4)
cStack.isEmpty()
cStack.isFull()
cStack.push(5)
cStack.push(6)
cStack.push(7)
cStack.push(8)
cStack.pop()
cStack.pop()
cStack.pop()

