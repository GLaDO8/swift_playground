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
for q in 0...arr.count - 1 {
    print (arr[q])
}
arr.count

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

//optionals and forced unwrapping
var opt: String?
opt = "hello"
if opt != nil{
    print(opt!)
}

//optionals and forced binding (recommended)
//the opt after 'let' is a constant which is assigned with the value of the optional variable
if let opt = opt{
    print(opt)
}
//functions
//in Swift, all parameters are passed in as constants. We can't change them.
func checkFunc(argLabel label:String) -> Int{
    print(label)
    return 0
}

//if you want to pass a value which can be changed inside the function and the result is available outside, we can use inout.
func doubleInt(_ number: inout Int){
    number*=2
}
var dblNum = 10
doubleInt(&dblNum) //we need to put an ampersand, which signifies we are passing in a address.
print(dblNum)

//Variadic functions
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
//if you want to iniitalise a variable but not explicitely give it a value, you can use this keyword 'nil'. but you need to make sure that the type of the variable is explicitely mentioned as swift has type inference and nil has no innate type. the best way tp initialise is...This is a optional integer.
//but even this will not work without the use of a '?'
//this means the variable can now store as usual, or a nil.
let present: XmasPresent? = XmasPresent()
//as it is possible for the variable to contain nil, we need to explicitely check if it actually contains an object.

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

//NOTE - swift by default assigns nil to variables which do not have any value assigned to them.

//this is called implicitly unwrapped optional. you do not need to use extra '?' or '!' to unwrap them, swift will do it for you. But this is dangerous as it will allow you to run the code even if it's nil as it automatically unwraps it.
//use this when you know that the variable will be nil ONLY initially.
let optional2: String!

//in this, swift will automatically assign a nil for us. Use this if you WANT it to be nil at first.
let optional1: String?

//Closures in swift are like lambda functions in other languages.
//functions are basically named closures.
//closure syntax
//we start the body of the closure using the 'in' keyword
var names = ["hello", "how", "are", "you"]
var resultName = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})
//swfit can infer type of the closure

