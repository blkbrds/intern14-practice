import UIKit

struct Student {
    var fullName: String
    var yearOfBirth: Int
    var score: Float
    
    init(fullname: String, year: Int, score: Float) {
        self.fullName = fullname
        self.yearOfBirth = year
        self.score = score
    }
    
    func displayInfo() {
        print("Full name :\(fullName)")
        print("Year of birth: \(yearOfBirth)")
        print("Score \(score)")
    }
}

class Students {

    private var studentsCollection : [Student]

    init(students: [Student]) {
        self.studentsCollection = students
    }
    
    func getListSortOrder() -> [Student] {
        for i in 0..<(studentsCollection.count-1) {
            for j in 1..<studentsCollection.count {
                if studentsCollection[i].score < studentsCollection[j].score {
                    (studentsCollection[i], studentsCollection[j]) = (studentsCollection[j], studentsCollection[i])
                } else if studentsCollection[i].score == studentsCollection[j].score && studentsCollection[i].yearOfBirth < studentsCollection[j].yearOfBirth {
                    (studentsCollection[i], studentsCollection[j]) = (studentsCollection[j], studentsCollection[i])
                }
            }
        }
        for i in 0..<studentsCollection.count {
            studentsCollection[i].fullName = studentsCollection[i].fullName.capitalized
        }
        
        return studentsCollection
    }
}
