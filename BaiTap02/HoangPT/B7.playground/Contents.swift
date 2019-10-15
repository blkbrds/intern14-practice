import UIKit

/**
 *  Student class
 **/
class Student {
    var name: String
    var yearOfBirth: Int
    var totalScore: Int
    
    init(_ name: String,_ yearOfBirth: Int,_ totalScore: Int ) {
        self.name = name
        self.yearOfBirth = yearOfBirth
        self.totalScore = totalScore
    }
}

/**
 *  StudentListManagement class
 **/
class StudentListManagement {
    var studentList:[Student]
    
    init(_ studentList:[Student]) {
        self.studentList = studentList
    }

    func sortStudentList() -> [Student] {
        self.studentList.sort { (s1, s2) -> Bool in
            if s1.totalScore > s2.totalScore {
                return true
            } else if s1.totalScore == s2.totalScore {
                return s1.yearOfBirth < s2.yearOfBirth
            } else {
                return false
            }
        }
        return studentList
    }
}

// Test
let studentList = StudentListManagement([
    Student("nguyen van b", 95, 80),
    Student("le thi c", 91, 70),
    Student("truong van d", 94, 80),
    Student("pham tan a", 93, 100)
])

var sortResut = studentList.sortStudentList()


for (key, item) in sortResut.enumerated() {
    print("\(key): \(item.name.capitalized) \(item.yearOfBirth) \(item.totalScore)")
}


