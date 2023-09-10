
import Foundation
import UIKit

class Person {
  let name: String
  var macBook: MacBook?
  
  init(name: String, macBook: MacBook?) {
    self.name = name
    self.macBook = macBook
  }
  
  deinit {
    print("\(name) is being deinitialized")
  }
}

class MacBook {
  let name: String
  weak var owner: Person?
  
  init(name: String, owner: Person?) {
    self.name = name
    self.owner = owner
  }
  deinit {
    print("MacBook named \(name) is being deinitialized")
  }
}

var manas: Person?
var matilda: MacBook?

manas = Person(name: "Manas", macBook: nil)
matilda = MacBook(name: "Matilda", owner: nil)
//manas = nil
//matilda = nil

manas?.macBook = matilda
matilda?.owner = manas
manas = nil
print(matilda?.owner)
matilda = nil

// Above example in View Controller below.
class ViewController: UIViewController {
  var manas: Person?
  var matilda: MacBook?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createObjects()
//    assignProperties()
  }
  
  func createObjects() {
    manas = Person(name: "Manas", macBook: nil)
    matilda = MacBook(name: "Matilda", owner: nil)
    
        manas = nil
        matilda = nil
  }
  
  func assignProperties() {
    manas?.macBook = matilda
    matilda?.owner = manas
    
    manas = nil
    print("\(matilda?.owner)")
    matilda = nil
  }
}

