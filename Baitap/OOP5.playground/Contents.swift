import UIKit

class CStack {
    var stackArray: [Int] = []
    var element: Int
    init?(stackArray: [Int], element: Int){
        self.element = element
        if stackArray.count == 0 {
            return nil
        } else {
        self.stackArray = stackArray
        }
    }
    func pushElement() -> [Int] {
        stackArray.append(element)
        return stackArray
    }
//    func checkStack(){
//        if stackArray.count == 0 {
//            print("The stack is emty")
//        }
//
//        else {
//            print("The stack is full")
//        }
//    }
    func popStack() -> [Int] {
        stackArray.popLast()
        return stackArray
    }
}
if let stack = CStack (stackArray: [], element: 4) {
    print("The stack after push \(stack.pushElement())")
    print("The stack after pop \(stack.popStack())")
}
else {
    print("The stack is empty")
}

