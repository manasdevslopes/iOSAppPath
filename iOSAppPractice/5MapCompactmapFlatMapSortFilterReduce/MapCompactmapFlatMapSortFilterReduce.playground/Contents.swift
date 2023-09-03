import UIKit

struct IndieApp {
  let name: String
  let monthlyPrice: Double
  let users: Int
}

let appPortfolio = [
  IndieApp(name: "Creator View", monthlyPrice: 11.99, users: 4356),
  IndieApp(name: "FitHero", monthlyPrice: 0.00, users: 1756),
  IndieApp(name: "Buckets", monthlyPrice: 3.99, users: 7598),
  IndieApp(name: "Connect Four", monthlyPrice: 1.99, users: 34081),
]

// Filter
let freeApps = appPortfolio.filter { $0.monthlyPrice == 0.00 }
print(freeApps)
let highUsers = appPortfolio.filter { $0.users > 5000 }
print(highUsers)

// Map
// Pull out items
let appNames = appPortfolio.map { $0.name }.sorted()
print(appNames)

// Also update the values and put it back in an array
let increasedPrices = appPortfolio.map { $0.monthlyPrice * 1.5 }
print(increasedPrices)

// Reduce
let numbers = [3, 5, 9, 12, 18]
// array.reduce(initialResult, {currentResult + currentElement}) -> return finalResult
let sum = numbers.reduce(0, { $0 + $1 })
print(sum)
// Or,
let sum1 = numbers.reduce(0, +)
print(sum1)
let substract = numbers.reduce(100, -)
print(substract)

let stringArray = ["1", "2", "3", "Hello World"]
let reduceStringArray = stringArray.reduce(0, {$0 + (Int($1) ?? 0)})
print(reduceStringArray)

let totalUsers = appPortfolio.reduce(0, {$0 + $1.users })
print(totalUsers)

// Chaining
// As 70% is Developers Cut after Apple Cut so * 0.7
let recurringRevenue = appPortfolio.map { $0.monthlyPrice * Double($0.users) * 0.7 }.reduce(0, +)
print(recurringRevenue)


// CompactMap
// Takes all elements -> transform it -> unwrap it -> & after unwrap if the value is nil then it will discard the element and put it back into the container
let nilNumbers: [Int?] = [1, nil, 18, nil, 3, 7, nil, 99]
let nonNilNumbers = nilNumbers.compactMap { $0 }
print(nonNilNumbers)

// FlatMap
// Arrays of Arraya then use this to flattens into single Array
let arrayOfArrays: [[Int]] = [[1,2,3], [4,5,6], [7,8,9]]
let singleArray = arrayOfArrays.flatMap { $0 }
print(singleArray)
let newSingleArray = arrayOfArrays.flatMap { $0.map { $0 * 2} }
print(newSingleArray)

let codes: [[String]] = [["abc", "def", "ghi"], ["jkl", "mno", "pqr"], ["stu", "vwx", "yz"]]
let singleCodes = codes.flatMap { $0 }
print(singleCodes)
let anotherSingleCodes = singleCodes.flatMap { $0.map { $0.uppercased() }}
print(anotherSingleCodes)

// Sort
let topAppsRanking = appPortfolio.sorted { $0.users > $1.users }
print(topAppsRanking)
