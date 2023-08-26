//
//  ClassVsStruct.swift
//  iOSAppPractice
//
//  Created by MANAS VIJAYWARGIYA on 26/08/23.
//

import Foundation

// Both ways to create Objects in Swift

// class is Referece Type. Point to same location. Init is mandatory to write
class Car {
  var year: Int
  var make: String
  var color: String
  
  init(year: Int, make: String, color: String) {
    self.year = year
    self.make = make
    self.color = color
  }
}

/*
 var myCar = Car(year: 2023, make: "BMW", color: "Mixed Colors")
 var changeStyleCar = myCar
 changeStyleCar.color = "Dark Red with Mix colors"
 print(myCar.color)
 */

// struct is value Type. Create new Object all the time (Copied). Init is created automatically so no need to write.
struct Car1 {
  var year: Int
  var make: String
  var color: String
}

/*
 var myCar = Car1(year: 2023, make: "BMW", color: "Mixed Colors") // Obj 1
 var changeStyleCar = myCar // new Obj 2
 changeStyleCar.color = "Dark Red with Mix colors"
 print(myCar.color)
*/

// MARK: - When to use a class or struct
// 1. In class, inheritance is possible. That means create a subclass out of old class and add more properties to it along with old class properties.
// 2. By Inheritance, it will inherit all the properties which is may or may not required, so to avoid that structs is helpful in that case.
// 3. That's why structs are more lightweight and performant
