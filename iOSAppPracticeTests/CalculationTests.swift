//
//  CalculationTests.swift
//  iOSAppPracticeTests
//
//  Created by MANAS VIJAYWARGIYA on 19/08/23.
//

import XCTest
@testable import iOSAppPractice

// Naming Structure : test_UnitOfWork_StateUnderTest_ExpectedBehaviour
// Naming Structure : test_[struct or class]_[variable or function]_[expected result]

// Testing Structure: Given (Arrange), When (Act), Then (Assert)

final class CalculationTests: XCTestCase {
  func test_Calculation_calculateTip_Success() {
    // Given (Arrange)
    let enteredAmount = 100.00
    let tipSlider = 25.00
    let calculation = Calculation()
    
    // When (Act)
    let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
    
    // Then (Assert)
    XCTAssertEqual(tip, 25)
  }
  
  func test_Calculation_calculateTip_NegativeAmountEntered() {
    // Given (Arrange)
    let enteredAmount = -100.00
    let tipSlider = 25.00
    let calculation = Calculation()
    
    // When (Act)
    let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
    
    // Then (Assert)
    XCTAssertNil(tip)
  }
}
