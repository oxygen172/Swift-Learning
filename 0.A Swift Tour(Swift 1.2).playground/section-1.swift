// a tour for Swift 1.2 

import UIKit

var str = "Hello, playground"


let const = "hello My boy!"


var x = 0

/*for x in 0..255 {
let t = Double(x) * sin
        (Double(x) * M_PI_4/4)
}

*/


// -----------------------Simple Values -------------------------

println ("hello, world")


let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//Practice 

let myTestConstantVariable = 4

let label = "The width is "
let width = 94
let withLable = label + String(width) //转换width为string

//Practice

let apples = 3.4
let oranges : Double = 5
let appleSummary = "I have \(apples) apples"
let friutSummary = "John, I have \(apples + oranges) pieces of fruit."
   // 把值转换成字符串的方法就是\（值）

var shoppingList = ["catfish", "water","tulips","blue paint"]


shoppingList[1] = "bottle of water"


var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations ["Jayne"] = "Public Relations"


let emptyArray = [String]() // empty arry


let emptyDictiionary = [String: Float]()

shoppingList = []

occupations = [:]


// -----------------------------Control Flow------------------------

let individualScores = [75, 43, 103,87,12]

var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

println(teamScore)

///---

var optionalString: String? = "Hello"

optionalString == nil


var optionalName: String? = "John Appleseed"



var greeting = "Hello!"


if let name = optionalName {
    
    greeting = "Hello, \(name)"
    
}

//optionalName = nil

if optionalName == nil {
        greeting = "Hello, How are you?"
    
} else {
    let name = optionalName
    greeting = "Hello, \(name)"
}


// switch
var vegetable = "red pepper"  // ? if I change the value to be 'pepper celery'
vegetable = "pepper celery"

switch vegetable {
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwith."
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is is a spicy \(x)?"
    default:
       let vegetableComment = "Everything tastes good in soup."
}




let interestingNumber = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25]
]

var largest = 0

var type = ""

for (kind, numbers) in interestingNumber {
    for number in numbers {
        if number > largest {
            largest = number
            type = kind
        }
    }
}
largest
type


//while

var n = 2
while n < 100 {
    n = n * 2
}
n


var m = 2
do {
    m = m * 2
} while m < 100
m


var firstForLoop = 0
for i in 0 ..< 4 { // 好奇怪的语法, 这里不需要声明i, 为什么这里<跟4要用空格间隔？
    firstForLoop += i  // 等于firstForLoop = firstForLoop + i
}

firstForLoop //其实是 0+1+2+3 = 6


var secondForLoop = 0
for  var i = 0; i < 4; ++i {  //没有括号哦， 但是这里需要声明i，直冒汗
    secondForLoop += i
}
secondForLoop //其实是 0+1+2+3 = 6




// -------------------Fucntion &  Closures--------------------


// -> 用来指定返回值的类型
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

greet("Bob", "Tuesday")


func greet_2(name: String, Lunch: String) -> String {
    return "Hello \(name), I will eat \(Lunch) at lunch."
}

greet_2("Tim", "Bread")



func getGasPrices() -> (Double, Double, Double) {  // 使用一个元组返回多个值
    return (3.59, 3.69, 3.79)
}

getGasPrices()


func calculateStatistics (scores: [Int]) -> (min: Int, max : Int, sum: Int) {
    //参数是一个数组scores， 返回一个元组： min, max, sum
    var min = scores [0]
    var max = scores [0]
    var sum = 0
    
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
        
    }
    return(min, max, sum)
}

let statistics = calculateStatistics([5,3,100,3,9])

statistics.sum

statistics.1





func sumOf(numbers: Int...) -> Int { //注意要加省略号
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf()

sumOf(42,597, 12)


//


func avgOf (numbers: Int...) -> Int {
    var sum = 0, i = 0 , avg = 0
    for number in numbers {
        sum += number
        i += 1
    }
    avg = sum/i
    return avg
}


avgOf(2,4,6)



// --- 嵌套函数

func returnFifteen() -> Int {
    var y = 10
    func add () {
        y += 5
    }
    add()
    return y
}

returnFifteen()



func makeIncrementer() -> (Int -> Int) {  //无参数的函数，
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()

increment(7)




////??

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool { //只返回Bool数据, 一旦返回true就跳出循环. condition这里要跟被调用的函数定义数据类型一致
    for item in list {
        if condition(item) {  // 这句话有点糊涂？？？？？
            return true
        }
    }
    return false
}

func lessThanTen (number: Int) -> Bool {  //这个函数只返回bool数据， 并作为参数传到condition里
    return number < 10  //如果number小于10就返回true，不然就返回false
}

var numbers = [20, 19, 7,12]

hasAnyMatches(numbers, lessThanTen)
// numbers里的值传到list这个参数里，这个函数调用for循环判断这些值。函数lessThanTen的返回值被作为参数传到condition


numbers.map ({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

/*
numbers.map ({
    (number: Int) -> Int in
    for number in numbers {
        if number % 2 == 1 {
            let result = number
            return result
        }
    }
   
})
*/


//子函数可以使用父函数中的局部变量，这种行为就叫做闭包！


let mappedNumbers = numbers.map({ number in 3 * number })

mappedNumbers



let sortedNumbers  = sorted(numbers) { $0 > $1 }
sortedNumbers





//--------------------Object & Class ---------------------

class Shape {    //声明一个class
    var numberOfSides = 0   // 这个class的属性
    let color = "white"
    func simpleDescription() -> String {  //声明这个class的方法
        return "A shape with \(numberOfSides) sides."
    }
    
    func ooDetailsDescription() -> String {
        return "I was added to take another argument, now the argument is \(numberOfSides)"
    }
    
}


//

var shape = Shape()

shape.numberOfSides = 7  //为何会返回color的值？？？ 明明只是调用其中一个属性

var shapeDescription = shape.simpleDescription()

var ootestDetailsDescription = shape.ooDetailsDescription()




class NamedShape {
    var numberOfSides: Int = 0
    var name: String  // 小心你的中文输入法的冒号
    
    init(name: String) {  //用init来创建一个构造器
        self.name = name  // self 被用来区别实例变量。
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
} //当你创建实例的时候,像传入函数参数一样给类传入构造 器的参数。每个属性都需要赋值

//怎样调用这个class，貌似用上面方法没有用啊



// subclass

class Square: NamedShape {  //子类
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name) //这个又是干嘛的？
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")

test.area()

test.simpleDescription()



//////

class EquilateralTrigangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength  // 设置子类声明的属性值
        super.init(name: name) //调用父类的构造器
        numberOfSides = 3
    }
    
    var perimeter: Double {  //改变父类定义的属性值
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() ->  String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
    
}

var triangle = EquilateralTrigangle(sideLength: 3.1, name: "a triagnle")

triangle.perimeter

triangle.perimeter = 9.9

triangle.sideLength



//

class TriagnleAndSquare {
    var triangle: EquilateralTrigangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square( sideLength: size, name: name)
        triangle = EquilateralTrigangle (sideLength: size, name: name)

    }
}

var triangleAndSquare = TriagnleAndSquare (size: 10, name: "another test shape")


triangleAndSquare.square.sideLength

triangleAndSquare.triangle.sideLength

triangleAndSquare.square = Square (sideLength: 50, name: "larger square")

triangleAndSquare.triangle.sideLength



//类中的方法和一般的函数有一个重要的区别,函数的参数名只在函数内部使用,但是方法的参数名需要在调用的时候显式说明

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}

var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)


let optionalSquare: Square? = Square (sideLength: 2.5, name: "optional square")//处理变量的可选值时,你可以在操作(比如方法、属性和子脚本)之前加?。如果?之前的 值是 nil,?后面的东西都会被忽略,并且整个表达式返回 nil。否则,?之后的东西都会被运行。

let sideLength = optionalSquare?.sideLength






// ---------------Enumerations and Structures-------------

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
            
        }
    }
}

let ace = Rank.Ace

let aceRawvalue = ace.rawValue

//Practice is missing. Will work on this later.




if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}
//使用 toRaw 和 fromRaw 函数来在原始值和枚举值之间进行转换。



//

enum Suit {
    case Spades, Hearts, Dismonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Dismonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts

let heartsDescription = hearts.simpleDescription()

let heartsDescription2 = Suit.Hearts.simpleDescription()

//Practice is missing. Will work on this later.


//使用 struct 来创建一个结构体。结构体和类有很多相同的地方,比如方法和构造器。它们结 构体之间最大的一个区别就是 结构体是传值,类是传引用。

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)

let threeOFSpadesDescription = threeOfSpades.simpleDescription()

//Practice is missing. Will work on this later.





//

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")

let failure = ServerResponse.Error ("Out of Cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    
case let .Error(error):
    let serverResponse = "Failure...\(error)"
}

//Practice is missing. Will work on this later.



/// ---------------Protocols and Extensions-----------------

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust ()
}



class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()

a.adjust()

let aDescription = a.simpleDescription

struct SimplesStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {  //声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。 SimpleClass 的声明不需要标记任何方法因为类中的方法经常会修改类。
        simpleDescription += "  (adjusted)"
    }
}

var b = SimplesStructure()
b.adjust()
let bDescription = b.simpleDescription



/*
extension Int: ExampleProtocol {
    var simpleDescription: String {
    return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}


7.simpleDescription

*/


let protocolValue: ExampleProtocol = a // a是继承了ExampleProtocol的类

protocolValue.simpleDescription

//protocolValue.anotherProperty //这个有语法错误，因为你处理类型是接口的值时,接口外定义的方法不可用。



///------------------Generics 泛型--------------------

func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType] {
    var result = [ItemType]()
    for i in 0..<times {  //为什么这里<必须跟times连在一起，不能有空格？
        result.append(item)
    }
    return result
}
repeat("knock", 4)


// Reimplement the Swift standard library's optional type

enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)




func anyCommonElements <T, U where T: SequenceType, U:SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs:T, rhs: U) -> Bool {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1,2,3], [3])


























































