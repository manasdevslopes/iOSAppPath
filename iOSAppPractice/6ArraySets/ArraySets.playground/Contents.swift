import UIKit

var swiftUIDevs: Set = ["Sean", "Manas"]
var swiftDevs: Set = ["Sean", "Manas", "James", "Olivia", "Maya", "Leo"]
var kotlinDevs: Set = ["Olivia", "Elijah", "Leo", "Maya", "Dan"]
var experiencedDevs: Set = ["Sean", "Manas", "Ava", "Olivia", "Leo", "Maya"]

// Intersect - pull out overlap
let experiencedSwiftUIDevs = swiftUIDevs.intersection(experiencedDevs)
print(experiencedSwiftUIDevs)

// Subtract - pull out difference
let jnrDevs = swiftDevs.subtracting(experiencedDevs)
print(jnrDevs)

// Disjoint - check for overlap
swiftUIDevs.isDisjoint(with: kotlinDevs) // there is no overlap so it will give true otherwise it will give false

// Union - combine
let combineiOSDevs = swiftUIDevs.union(swiftDevs)
print(combineiOSDevs)

// Exclusive - only in 1 set
let specialists = swiftDevs.symmetricDifference(kotlinDevs)
print(specialists)

// Subset
swiftUIDevs.isSubset(of: swiftDevs)

// Superset
swiftDevs.isSuperset(of: swiftUIDevs)

// Insert, Delete, Find
swiftDevs.insert("Joe")
swiftDevs.remove("Leo")
swiftDevs.contains("Maya")
swiftDevs
