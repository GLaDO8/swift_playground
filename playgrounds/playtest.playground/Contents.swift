//base swift tutorial code
import UIKit

//var is for variables and let is for constants
//default data type in swift is double.
//swift has type safety and type inference. If the type is given, then good, else swift will automatically infer the type. The less type inference swift has to do, the faster the code compilation would be.

// this is not good.
var thisIsArray = ["23424", "egdrg", "fsger"]
//this is good
var ThisArray: [String] = ["23424", "egdrg", "fsger"]

let c = 10
var x = 2
var y = x + c
x = 3
var cased = "ssssweiefe"
print(cased.uppercased())
print(cased.count)
//string concate using string interpolations
var hell = "deijei \(cased)"
print(hell)

//if else loops
if x == 2{
    print("hto")
}
else{
    print("yp")
}

//operations
pow(2, 3)
sqrt(8)
ceil(4.6)
floor(4.6)
//arrays and iterating
var arr = ["yp", "www", "wrweqfwefw"]

//empty array declaration
//we can later use append and insert at to add elements
var emptyArray: [Int] = []
var emptyArray2 = [Int]()

emptyArray.append(3)
emptyArray.append(4)
emptyArray.insert(2, at: 1)
emptyArray.remove(at: 1)

for a in arr {
    print(a)
}
//range is represented using '..'
for q in 0..<arr.count - 1 {
    print (arr[q])
}
arr.count

//creating custom countable ranges
for i in stride(from: 0.5, through: 10, by: 0.25){
    print (i)
}

//tuples are good for multiple values in swift
let x_tuple: (w: String, i: Int, v: Double) = ("Hello", 5, 5.76)

//dictionaries
var emojiDict = [
    "smile" : "😄",
    "death" : "☠️"
]
var wordToLookup = "death"
var meaning = emojiDict[wordToLookup]
//the reason why meaning is optional is because if we try to access a key which doesn't exist in the dict, then we will be accessing a nil value, causing an app crash. So by default they are nil. in order to use it, we can use optional binding (given below)
print(meaning)

if let meaning = meaning{
    print(meaning)
    //UI view creates a view
    let container = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    container.backgroundColor = UIColor.yellow
    
    //UI label is basically text
    let emojiLabel = UILabel(frame: CGRect(x:95, y:20, width: 150, height: 150))
    emojiLabel.text = meaning
    emojiLabel.font = UIFont.systemFont(ofSize: 100.0)
    container.addSubview(emojiLabel)
    
    //UI label for caption
    let captionLabel = UILabel(frame: CGRect(x:110, y:100, width: 150, height: 150))
    captionLabel.text = "death"
    captionLabel.font = UIFont.systemFont(ofSize: 30.0)
    container.addSubview(captionLabel)
}

var dblNum = 10
doubleInt(&dblNum) //we need to put an ampersand, which signifies we are passing in a address.
print(dblNum)



//MARK: - functions
//in Swift, all parameters are passed in as constants. We can't change them.
func checkFunc(argLabel label:String) -> Int{
    print(label)
    return 0
}

//if you want to pass a value which can be changed inside the function and the result is available outside, we can use inout.
func doubleInt(_ number: inout Int){
    number*=2
}



// MARK:- Variadic functions
//variadic functions accept any number of parameters
//To make the function accept any number of parameters, we use ... after the parameter type.
//Note that we add a '_' before any parameter in order to avoid mentioning the label while calling the function.
//We can have atmost 1 variadic parameter.
func sum(_ numbers: Int...) -> Int{
    var Sum = 0
    for num in numbers{
        Sum+=num
    }
    return Sum
}
print(sum(2,3,4,5,6))

//MARK: - Classes
//classes in swift are primarily used for OOP. classes are reference types, in the sense, they are passed around by reference instead of being copied whenever passed as an argument or assigned to anything. They live in the heap and are removed when there aren't any pointers pointing to the class object.
//classes require you to explicitely initialise every class property. It doesn't give you a free initialiser like for structs.
//classes only have single inheritance
class Employee{
    var salary = 0
    var workingHours = 0
    var role = ""
    var name = ""
    init(_ name: String){
        self.name = name
    }
    func doWork(salary: Int){
        print("I work")
        //here self helps distinguish between properties and arguments of the same name.
        self.salary = salary
    }
}

class Manager: Employee{
    var teamSize = 0
    //let's say we want the bonus to be teamSize*1000$. we can directly assign it by we will have to update it whenever teamSize get's updated. This is tedious. We can use Computed properties instead.
    //In computed properties, the variable will store a computation rather than a value.
    var Bonus: Int{
        return 1000*teamSize
    }
    init(_ teamSize: Int, _ name: String){
        super.init(name)
        self.teamSize = teamSize
    }
    override func doWork(salary: Int) {
        super.doWork(salary: salary)
        print("I'm a manager")
    }
}

class XmasPresent {
    func surprise() -> Int {
        return Int.random(in: 1...10)
    }
}



//MARK: -computed properties

//normal properties are basic instance variables
//computed properties are computed whenever someone calls it or assigns stuff to it
//need to have both get and set
var computed_property: Double {
    get{
        //get is called whenever computer_property is called
        return 0
    }
    //newValue is the default keyword
    set(newValue){
        
    }
}



//MARK: - enums in swift
//enums are one of the four data structures - Classes, Structs, enums and protocol
//enums are value type data structures like structs. they can only have a certain vars in it.
enum fastFoodType{
    case burger (numberOfPatties: Int)
    case soda (String, sodaSize: containerSize) //String means it can be anything. //the name doesn't really matter that much for associated data
    case frenchFries (friesSize: containerSize)
}
enum containerSize{
    case large
    case small
}

//setting enums
//enums are like tuples. enums can be assigned a value only once, when initialised.
//we can use type inference on either side of the equal sign
let menuItem: fastFoodType = fastFoodType.burger(numberOfPatties: 3)

//checking enum's state. We don't use equal to to check the enum's state, we use switch.
//we can ignore the associated data if we want to when using switch in swift
//we can ignore fastFoodType cause of type inference
//we can use break to do nothing
//we can use default for uninteresting cases
//we don't have fallthrough by default. If any of the cases is succesfully matched, it will execute and break. In other languages it is possible
switch menuItem {
case fastFoodType.burger: print("It's a burger")
case fastFoodType.frenchFries: break
default:print("I don't care")
}

//we can access the associated data in switch using let keyword
//the naming for let need not be same as the associated data declaration name.
switch menuItem {
case fastFoodType.burger(let numberOfPatties):
    print("it has \(numberOfPatties) number of patties")
default:
    print("meh")
}

//enums can have methods and computed properties/vars but not stored properties
enum bathItemType{
    case soap (String)
    case shampoo (String, bottleSize: Int) //String means it can be anything. //the name doesn't really matter that much for associated data
    case scrub
    
    func bathableType(number: Int) -> Bool{
        switch self{
        case .shampoo, .soap: return true
        case .scrub: return false
        }
    }
}



//MARK: - Optionals
//optional is a generic type. optionals are generally nil, and the switching is done using ?, !. This is basic syntactic sugar for switching. Its an enum with state none(nil) as default and state some(some generic type)

//we use "?" to declare an optional which is a syntactic sugar for declaring a enum with one state as none and other state as don't care or Int in this case. Swift automatically assigns 'nil' as the default value if we haven't initialised the variable
var thisIsOptional: Int?

//if you want to iniitalise a variable but not explicitely give it a value, you can use this keyword 'nil'. but you need to make sure that the type of the variable is explicitely mentioned as swift has type inference and nil has no innate type.
let present: XmasPresent? = XmasPresent()


//IMPLICIT UNWRAPPING or FORCED UNWRAPPING
//is a way to unwrap the variable and get the value stored without switching on the enum. It works when the variable is set, and will crash your program if it is none. Can be used for bug testing. Use this when you know that the variable will be nil ONLY initially.
var yohoo: Int!

//OPTIONAL UNWRAPPING
//the if statement will just tell if there is a nil inside or not, but to access it, you need to unwrap it.
//to unwrap it, we have to use a '!' mark after the variable.
if (present != nil){
    print(present!.surprise())
}

//OPTIONAL BINDING
//here we use a if let statement to first check if the contents of the object are nil. if not, then the let statement will unwrap the object and assign it to a new constant for access.
if let unwrappedPresent = present{
    print(unwrappedPresent.surprise())
}

//OPTIONAL CHAINING
//this will automatically check and execute the line if it is not nil. If it is nil, then the line won't be executed and the program will not crash.
present?.surprise()

//OPTIONAL DEFAULTING or NIL-COALESCING OPERATOR
//this basically means, set opt2 as opt1 if it is something but if it is nil/none then set it to "foo"

let opt1: String? = "hello"
let opt2 = opt1 ?? "foo"



// MARK: - Guard
//guard is syntactic sugar for if, which makes early returns more explicit and clear.
//syntactic sugar is when the functionality of the word is same as an already existing keyword, but makes the declaration more explicit for easier understanding.
for i in 1...10
{
    guard i.isMultiple(of: 2) else {
        continue
    }

    print(i)
}



//MARK: - Delegation in swift
struct Cookie{
    var size: Int = 5
    var hasChocoChips: Bool = true
}

//now the cookie needs to be sold on various platforms, but that is not the responsibility of the bakery, it just needs to delivery the cookies. This is where we use delegatin to encapsulate all the responsibilities that we are going to hand off to someone else. We use protocols to create delegates

protocol bakeryDelegate{
    //this function is called whenever a cookie is baked
    func cookieWasBaked(_ cookie: Cookie)
}

//the bakery class is responsible for making the cookies using the cookie struct
class Bakery{
    
    var delegate: bakeryDelegate?
    func makeCookie(){
        var cookie = Cookie()
        cookie.size = 6
        cookie.hasChocoChips = false
        delegate?.cookieWasBaked(cookie)
    }
    
}



//MARK:- closures
// closures are basically inline functions
//NOTE: When we capture a variable and change its value inside the closure, we affect its value also outside the closure scope once the closure is called

//various forms of closure
//closure is basically everything about a function except it's name, inside the parameters of another function
// In the following examples pairInt is a single element capture list

func doSomething(thisIsParam: Int, thisIsAnother: (Int) -> String){
}

//1 - the curly brace has to contain the entire inline function and the function body should start after the "in" keyword.
doSomething(thisIsParam: 2, thisIsAnother: {(pairInt: Int) -> String in
    return "❤️"
    })

//2 - we don't need to explicitely mention the types as it is already present in doSomething function declaration. Swift can infer it.
doSomething(thisIsParam: 2, thisIsAnother: {(pairInt) in
    return "❤️"
})

//3 - we can omit the paranthesis over pairInt too
doSomething(thisIsParam: 2, thisIsAnother: {pairInt in
    return "❤️"
})

//4 - we can omit the return as it is a one line function
doSomething(thisIsParam: 2, thisIsAnother: { pairInt in "❤️" })

//5 - As the curly brace is the last argument, we can get rid of the keyword and put the curly brace outside
doSomething(thisIsParam: 2) { pairInt in "❤️" }
