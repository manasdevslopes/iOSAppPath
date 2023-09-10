import UIKit

class NetworkManager {
  func fetchIngredients() {
    print("Ingredients Fetched")
  }
}

class Bag {
  var items: [String] = []
  
  func placeOrder() {
    print("Order Placed")
  }
}

// Without Dependency Injection - Child View
class BurritoIngredientViewModel {
  let networkManager = NetworkManager()
  let bag = Bag()
  
  func fetchItems() {
    networkManager.fetchIngredients()
  }
  
  func placeOrder() {
    bag.placeOrder()
  }
}

// With Dependency Injection - Child View
class DIBurritoIngredientViewModel {
  let networkManager: NetworkManager
  let bag: Bag
  
  init(networkManager: NetworkManager, bag: Bag) {
    self.networkManager = networkManager
    self.bag = bag
  }
  
  func fetchItems() {
    networkManager.fetchIngredients()
  }
  
  func placeOrder() {
    bag.placeOrder()
  }
}

struct MealCategoryView {
  let networkManager = NetworkManager()
  let bag = Bag()
  
  func goToBurritoIngredientView() {
    let viewModel = DIBurritoIngredientViewModel(networkManager: networkManager, bag: bag)
  }
}
