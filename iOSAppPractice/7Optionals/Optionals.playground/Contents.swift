import UIKit

struct User {
  let name: String
  let age: Int?
}

let user = User(name: "Manas", age: nil)

// IF LET
if let age = user.age {
  print("User's age is \(age)")
} else {
  print("User didn't entered an age")
}

// GUARD LET
func check(age: Int?) {
  // Early Exit
  guard let age else {
    print("Age is nil")
    return
  }
  
  if age > 28  && age < 30 {
    print("Get married")
  }
}
check(age: user.age)

// NIL COALESCING
let myAge = user.age ?? 0
print(myAge)

// FORCE UNWRAP
//let newAge = user.age!
//print(newAge)

// OPTIONAL CHAINING
struct NewUser {
  let name: String
  let age: Int
}
var optionalUser: NewUser?
let name = optionalUser?.name ?? "Not Given"
print(name)

if let newName = optionalUser?.name {
  print(newName)
}
