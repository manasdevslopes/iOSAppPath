import UIKit
// ( ) -> ( )
// { $0 > $1 }
// @escaping, non-escaping
// trailing closure syntax - when closure is the last argument

struct Student {
  let name: String
  let testScores: Int
}

let students = [
  Student(name: "Luke", testScores: 88),
  Student(name: "Han", testScores: 73),
  Student(name: "Leia", testScores: 95),
  Student(name: "Chewy", testScores: 78),
  Student(name: "Obi-Wan", testScores: 65),
  Student(name: "Ahsoka", testScores: 86),
  Student(name: "Yoda", testScores: 68)
]

var topStudentFilter: (Student) -> (Bool) = { student in
  return student.testScores > 80
}

func topStudentFilterF(student: Student) -> Bool {
  return student.testScores > 70
}

let topStudents = students.filter(topStudentFilter)

for topStudent in topStudents {
  print(topStudent.name)
}

let topStudents1 = students.filter { $0.testScores > 80 }
let topStudentsRanking = students.sorted { $0.testScores > $1.testScores }
