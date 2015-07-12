// Playground - noun: a place where people can play

import UIKit

// 1. Optional Chaining 自判断链接
  /*
自判断链接(Optional Chaining)是一种可以请求和调用属性、方法及子脚本的过程,它的自判断性体现于请求或调用的目标当前可能为空(nil)。如果自判断的目标有值,那么调用就会成功;相反,如果选择的目标为空(nil),则这种调用将返回空(nil)。多次请求或调用可以被链接在一起形成一个链,如果任何一个节点为空(nil)将导致整个链失效。
*/

//注意: Swift 的自判断链和 Objective-C 中的消息为空有些相像,但是 Swift 可以使用在任意类型中,并且失败与否可以被检测到。





// 2. Optional Chaining as an Alternative to Forced Unwrapping 自判断链接可替代强制拆包
  /*
通过在想调用的属性、方法、或子脚本的自判断值(optional value)(非空)后面放一个问号,可以定义一个自判断链接。这一点很像在自判断值后面放一个声明符号来强制拆得其封包内的值。他们的主要的区别在于当自判断值为空时自判断链接即刻失败,然而一般的强制拆包将会引发运行时错误。

为了反映自判断链接可以调用空(nil),不论你调用的属性、方法、子脚本等返回的值是不是自判断值,它的返回结果都是一个自判断值。你可以利用这个返回值来检测你的自判断链接是否调用成功,有返回值即成功,返回 nil 则失败。
调用自判断链接的返回结果与原本的返回结果具有相同的类型,但是原本的返回结果被包装成了一个自判断值,当自判断链接调用成功时,一个应该返回 Int 的属性将会返回 Int?。

*/

// 下面几段代码将解释自判断链接和强制拆包的不同。

class Person1 {
    var residence: Residence1?
}

class Residence1 {
    var numberOfRooms = 1
}
// Residence 具有一个 Int 类型的 numberOfRooms,其值为 1。Person 具有一个自判断 residence 属性,它的类型是 Residence?。

// 如果你创建一个新的 Person 实例,它的 residence 属性由于是被定义为自判断型的,此属性将默认初始化为空:

let john1 = Person1()


// ￼如果你想使用声明符!强制拆包获得这个人 residence 属性 numberOfRooms 属性值,将会 引发运行时错误,因为这时没有可以供拆包的 residence 值。
// let roomCount = john.residence!.numberOfRooms
// this triggers a runtime error
// 当 john.residence 不是 nil 时,会运行通过,且会将 roomCount 设置为一个 int 类型的合理 值。然而,如上所述,当 residence 为空时,这个代码将会导致运行时错误。


//自判断链接提供了一种另一种获得 numberOfRooms 的方法。利用自判断链接,使用问号来代替原来!的位置:
if let roomCount1 = john1.residence?.numberOfRooms {
    println("John's residence has \(roomCount1) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}
// prints "Unable to retrieve the number of rooms"

// 这告诉Swift来链接自判断residence?属性,如果residence存在则取回numberOfRooms 的值。

// 因为这种尝试获得 numberOfRooms 的操作有可能失败,自判断链接会返回 Int?类型值, 或者称作“自判断 Int”。当 residence 是空的时候(上例),选择 Int 将会为空,因此会出先无法访问 numberOfRooms 的情况。

// 要注意的是,即使 numberOfRooms 是非自判断 Int(Int?)时这一点也成立。只要是通过自判断链接的请求就意味着最后 numberOfRooms 总是返回一个 Int?而不是 Int。

//你可以自己定义一个 Residence 实例给 john.residence,这样它就不再为空了:

john1.residence = Residence1()
// 现在有了实际存在的实例而不是nil了。如果你想使用和前面一样的自判断链接来获得 numberOfRoooms,它将返回一个包含默认值 1 的 Int?:


if let roomCount1 = john1.residence?.numberOfRooms {
    println("John's residenece has \(roomCount1) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}
// prints "John's residence has 1 room(s)."






// 3. Defining Model Classes for Optional Chaining 为自判断链接定义模型类

  // 你可以使用自判断链接来多层调用属性,方法,和子脚本。这让你可以利用它们之间的复杂模型来获取更底层的属性,并检查是否可以成功获取此类底层属性。

// 后面的代码定义了四个将在后面使用的模型类,其中包括多层自判断链接。这些类是由上面 的 Person 和 Residence 模型通过添加一个 Room 和一个 Address 类拓展来。

// Person2 类定义与之前相同。

class Person2 {
    var residence: Residence2?
}

//Residence 类比之前复杂些。这次,它定义了一个变量 rooms,它被初始化为一个 Room[]类型的空数组:
class Residence2 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        println("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
// 因为 Residence2 存储了一个 Room 实例的数组,它的 numberOfRooms 属性值不是一个固定的存储值,而是通过计算而来的。numberOfRooms 属性值是由返回 rooms 数组的 count属性值得到的。

// 为了能快速访问 rooms 数组,Residence 定义了一个只读的子脚本,通过插入数组的元素角标就可以成功调用。如果该角标存在,子脚本则将该元素返回。

// Residence 中也提供了一个 printNumberOfRooms 的方法,即简单的打印房间个数。



// 最后,Residence 定义了一个自判断属性叫 address(address?)。Address 类的属性将在后面定义。 
//用于 rooms 数组的 Room 类是一个很简单的类,它只有一个 name 属性和一个 设定 room 名的初始化器。

class Room {
    let name: String
    init(name: String) { self.name = name }
}

//这个模型中的最终类叫做 Address。它有三个自判断属性他们额类型是 String?。前面两个自判断属性 buildingName 和 buildingNumber 作为地址的一部分,是定义某个建筑物的两种方式。第三个属性 street,用于命名地址的街道名:

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
    } else {
            return nil
        }
    }
}
// Address 类还提供了一个 buildingIdentifier 的方法,它的返回值类型为 String?。这个方法检查 buildingName 和 buildingNumber 的属性,如果 buildingName 有值则将其返回,或者如果 buildingNumber 有值则将其返回,再或如果没有一个属性有值,返回空。




// 4. Accesssing Properties Through Optional Chaining 通过自判断链接调用属性

  // 如自判断链接可替代强制拆包所述，你可以使用自判断链接的来调用自判断值的方法并检查方法调用是否成功。即使这个方法没有返回值,你依然可以使用自判断链接来达成这一目的。

// 使用上述定义的类来创建一个Person2实例,并再次尝试后去链接numberOfRooms 属性
let john2 = Person2()
if let roomCount = john2.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}
// prints "Unable to retrieve the number of rooms."
// ￼由于 john.residence 是空,所以这个自判断链接和之前一样失败了,但是没有运行


// 你也可以尝试通过自判链接来设置属性的值
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john2.residence?.address = someAddress
// 上述例子，设置john2.residence的address属性会失败，因为john2.residence 现在是nil。




// 5. Calling Methods Through Optional Chaining 通过自判断链接调用方法
  // 你可以使用自判断链接的来调用自判断值的方法并检查方法调用是否成功。即使这个方法没 有返回值,你依然可以使用自判断链接来达成这一目的。
/* Residence 的 printNumberOfRooms 方法会打印 numberOfRooms 的当前值。方法如下:
    func printNumberOfRooms() {        println(“The number of rooms is \(numberOfRooms)”) 
    }
这个方法没有返回值。但是,没有返回值类型的函数和方法有一个隐式的返回值类型 Void (参见 Function Without Return Values)。

如果你利用自判断链接调用此方法,这个方法的返回值类型将是 Void?,而不是 Void,因为当通过自判断链接调用方法时返回值总是自判断类型(optional type)。,即使是这个方法 本是没有定义返回值,你也可以使用 if 语句来检查是否能成功调用 printNumberOfRooms方法:如果方法通过自判断链接调用成功,printNumberOfRooms 的隐式返回值将会是 Void, 如果没有成功,将返回 nil:
*/

if john2.residence?.printNumberOfRooms() != nil {
    println("It was possible to print the number of rooms.")
} else {
    println("It was not possible to print the number of rooms.")
}
// prints "It was not possible to print the number of rooms."


//  如果你尝试通过自判断链接去设置属性也是同样结果。在Accesssing Properties Through Optional Chaining里的例子也是这样想通过address值来赋给john.residence，尽管residence属性是nil。 任何尝试通过自判断链接设置属性的都返回Void？值类型，所以你可以通过跟nil的对比来知道是否属性被赋值成功。
if (john2.residence?.address = someAddress) != nil {
    println("It was possible to set the address.")
} else {
    println("It was not possible to set the address.")
}
// prints "It was not possible to set the address."




// 6. Accessing Subscripts Through Optional Chaining 使用自判断链接调用子脚本
  // 你可以使用自判断链接来尝试从子脚本获取值并检查子脚本的调用是否成功,然而,你不能通过自判断链接来设置子代码。

// 注意: 当你使用自判断链接来获取子脚本的时候,你应该将问号放在子脚本括号的前面而不是后面。自判断链接的问号一般直接跟在自判断表达语句的后面

// 下面这个例子用在 Residence 类中定义的子脚本来获取 john.residence 数组中第一个房间 的名字。因为 john.residence 现在是 nil,子脚本的调用失败了。

if let firstRoomName = john2.residence?[0].name {
    println("The first room name is \(firstRoomName).")
} else {
    println("Unable to retrieve the first room name.")
}
// prints "Unable to retrieve the first room name."

// 在子代码（脚本）调用中自判断链接的问号直接跟在 john.residence 的后面,在子脚本括号的前面, 因为 john.residence 是自判断链接试图获得的自判断值。

// 同样，你也可以通过使用自判断链接的子脚本来设置一个新的值。
john2.residence?[0] = Room(name: "Bathroom")
// 同样这个子脚本设值还是会失败，因为residence现在是nil。

// 如果你创建一个 Residence 实例给 john.residence,且在他的 rooms 数组中有一个或多个Room 实例,那么你可以使用自判断链接通过 Residence 子脚本来获取在 rooms 数组中的实例了:

let johnsHouse = Residence2()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john2.residence = johnsHouse


if let firstRoomName = john2.residence?[0].name {
    println("The first room name is \(firstRoomName).")
} else {
    println("Unable to retrieve the first room name.")
}
// prints "The first room name is Living Room."



// 6.1 Accessing Subscripts of Optional Type
  // 如果子脚本返回一个自判断类型的值，例如Swift的字典类型中的key子脚本， 放一个？在子脚本结束括号后来链接它自己的自判断类型返回值：

var testScores = ["Dave":[86,82,84], "Tim":[79,94,81]]
testScores["Dave"]?[0] = 91
testScores["Tim"]?[0]++
testScores["Brian"]?[0] = 72
// the "Dave" array is now [91,82,84] and the "Tim" array is now [80,94,81]
// 上面例子定义一个字典名叫testScores， 包含两个key对，字符串key和整数数组。例子中运用了自判断链接来设定Dave的数组第一个只为91， 然后让Tim的数组第一个自加1，然后尝试去设定Brian的数组的第一个值为72. 前面两个成功，因为testScores字典包含Dave和Tim这两个key。 第三个会失败，因为testScores里没有Brian这个key。




// 7. Linking Multiple Levels of Chaining 连接多层链接
  /* 你可以将多层自判断链接连接在一起,可以掘取模型内更下层的属性方法和子脚本。然而多层自判断链接不能再添加比已经返回的自判断值更多的层。 也就是说:

    1. 如果你试图获得的类型不是自判断类型,由于使用了自判断链接它将变成自判断类型。 
    2. 如果你试图获得的类型已经是自判断类型,由于自判断链接它也不会提高自判断性。
因此,
    1. 如果你试图通过自判断链接获得 Int 值,不论使用了多少层链接返回的总是 Int?。
    2. 相似的,如果你试图通过自判断链接获得 Int?值,不论使用了多少层链接返回的总是 Int?。

*/

// 下面的例子试图获取 john 的 residence 属性里的 address 的 street 属性。这里使用了两层自判断链接来联系 residence 和 address 属性,他们两者都是自判断类型:

if let johnsStreet = john2.residence?.address?.street {
    println("John's street name is \(johnsStreet).")
} else {
    println("Unable to retrieve the address.")
}
// prints "Unable to retrieve the address."
// john.residence 的值现在包含一个 Residence 实例,然而john.residence.address 现在是 nil,因此 john.residence?.address?.street 调用失败。

//从上面的例子发现,你试图获得 street 属性值。这个属性的类型是 String?。因此尽管在自 判断类型属性前使用了两层自判断,john.residence?.address?.street 的返回值类型也是 String?

// 如果你为 Address 设定一个实例来作为 john.residence.address 的值,并为 address 的street 属性设定一个实际值,你可以通过多层自判断链接来得到这个属性值。

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john2.residence!.address = johnsAddress

if let johnsStreet = john2.residence?.address?.street {
    println("John's street name is \(johnsStreet).")
} else {
    println("Unable to retrieve the address.")
}
// prints "John's street name is Laurel Street."
// 值得注意的是,“!”符的在定义 address 实例时的使用(john.residence.address)。 john.residence 属性是一个自判断类型,因此你需要在它获取 address 属性之前使用!拆包以获得它的实际值。


// 8. Chaining on Methods With Optional Return Values 链接自判断返回值的方法
//前面的例子解释了如何通过自判断链接来获得自判断类型属性值。你也可以通过调用返回自判断类型值的方法并按需链接方法的返回值。
//下面的例子通过自判断链接调用了 Address 类中的 buildingIdentifier 方法。这个方法的返回值类型是 String?。如上所述,这个方法在自判断链接调用后最终的返回值类型依然是String?:

if let buildingIdentifier = john2.residence?.address?.buildingIdentifier() {
    println("John's building identifier is \(buildingIdentifier).")
}
// prints "John's building identifier is The Larches."


// ￼如果你还想进一步对方法返回值执行自判断链接,将自判断链接问号符放在方法括号的后 面:

if let beginsWithThe = john2.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe{
        println("John's building identifier begins with \"The\". ")
    } else {
        println("John's building identifier does not begin with \"The\". ")
    }
}

// ￼注意: 在上面的例子中,你将自判断链接问号符放在括号后面是因为你想要链接的自判断 值是buildingIdentifier 方法的返回值,不是 buildingIdentifier 方法本身。






















