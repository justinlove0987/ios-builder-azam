import UIKit

struct Hamburger {
    
    let meat :Meat
    let sauce :Sauces
    let toppings :Toppings
    
}

enum Meat :String {
    case beef
    case chicken
    case tofu
}

struct Sauces :OptionSet {
    
    static let mayonnaise = Sauces(rawValue: 1 << 0)
    static let mustard = Sauces(rawValue: 1 << 1)
    static let ketchup = Sauces(rawValue: 1 << 2)
    
    let rawValue :Int
    
    init(rawValue :Int) {
        self.rawValue = rawValue
    }
}

struct Toppings :OptionSet {
    
    static let cheese = Toppings(rawValue: 1 << 0)
    static let lettuce = Toppings(rawValue: 1 << 1)
    static let pickles = Toppings(rawValue: 1 << 2)
    
    let rawValue :Int
    
    init(rawValue :Int) {
        self.rawValue = rawValue
    }
}

class HamburgerBuilder  {
    
    private (set) var meat :Meat = .beef
    private (set) var sauces :Sauces = []
    private (set) var toppings :Toppings = []
    
    func addSauces(_ sauce :Sauces) {
        sauces.insert(sauce)
    }
    
    func removeSauces(_ sauce :Sauces) {
        sauces.remove(sauce)
    }
    
    func addToppings(_ topping :Toppings) {
        toppings.insert(topping)
    }
    
    func removeToppings(_ topping :Toppings) {
        toppings.remove(topping)
    }
    
    func setMeat(_ meat :Meat) {
        self.meat = meat
    }
    
    func build() -> Hamburger {
        return Hamburger(meat: meat, sauce: sauces, toppings: toppings)
    }
    
}

class Employee {
    
    func createCombo() -> Hamburger {
        
        let builder = HamburgerBuilder()
        builder.setMeat(.beef)
        builder.addSauces([.ketchup,.mayonnaise,.mustard])
        builder.addToppings([.cheese,.lettuce,.pickles])
        return builder.build()
        
    }
    
}

let employee = Employee()

let combo = employee.createCombo()
combo.meat
combo.sauce
combo.toppings




