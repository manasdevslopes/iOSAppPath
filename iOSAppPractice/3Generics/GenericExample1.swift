//
//  GenericExample1.swift
//  iOSAppPractice
//
//  Created by MANAS VIJAYWARGIYA on 26/08/23.
//

import Foundation

func determineHigherValue<T: Comparable>(valueOne: T, valueTwo: T) {
  let higherValue = valueOne > valueTwo ? valueOne : valueTwo
  print("\(higherValue) is the higher value.")
}

/*
determineHigherValue(valueOne: 3, valueTwo: 8)
determineHigherValue(valueOne: "Manas", valueTwo: "A")
determineHigherValue(valueOne: Date.now, valueTwo: Date.distantFuture)
*/

func fetchData<T: Decodable>(for: T.Type, from url: URL) async throws -> T {
  let (data, _) = try await URLSession.shared.data(from: url)
  
  do {
    return try JSONDecoder().decode(T.self, from: data)
  } catch  {
    throw GHError.invalidData
  }
}

//let user = try await NetworkManager.shared.fetchData(for: User.self, from: url)
// User is the model
