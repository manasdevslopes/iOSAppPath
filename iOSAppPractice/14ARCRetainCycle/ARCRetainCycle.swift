//
//  ARCRetainCycle.swift
//  iOSAppPractice
//
//  Created by MANAS VIJAYWARGIYA on 10/09/23.
//

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

class ViewController: UIViewController {
  var manas: Person?
  var matilda: MacBook?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createObjects()
    assignProperties()
  }
  
  func createObjects() {
    manas = Person(name: "Manas", macBook: nil)
    matilda = MacBook(name: "Matilda", owner: nil)
    
    //    manas = nil
    //    matilda = nil
  }
  
  func assignProperties() {
    manas?.macBook = matilda
    matilda?.owner = manas
    
    manas = nil
    print("\(matilda?.owner)")
    matilda = nil
  }
}
