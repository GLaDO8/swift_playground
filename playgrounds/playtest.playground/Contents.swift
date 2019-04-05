import UIKit

//var is for variables and let is for constants
let c = 10
var x = 2
var y = x + c
x = 3
var cased = "ssssweiefe"
cased.uppercased()
cased.count

//string concate using string interpolations
var hell = "deijei \(cased)"

//if else loops
if x == 2{
    print("hto")
}
else{
    print("yp")
}

//arrays and iterating
var arr = ["yp", "www", "wrweqfwefw"]
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
//the reason why meaning is optional is because if we try to access a key which doesn't exist in the dict, then we will be accessing a nil value, causing an app crash. So be default they are nil. in order to use it, we can use optional binding (given below)
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
