import UIKit

final class MySingleton {
  static let shared = MySingleton()
  private init() { }
  
  func doSomething() { }
}

MySingleton.shared.doSomething()
