// Playground - noun: a place where people can play

import UIKit

// 1. Classes and Structures 类和结构体
  // 类和结构体是人们构建代码所用的一种通用且灵活的构造体。为了在类和结构体中实现各种功能，我们必须要严格按照对于常量，变量以及函数所规定的语法规则来定义属性和添加方法。

// 与其他编程语言所不同的是,Swift 并不要求你为自定义类和结构去创建独立的接口和实现文件。在Swfit中，你要做的是在一个单一文件中定义一个类或者结构体,系统将会自动生成面向其它代码的外部接口。

//注意:通常一个类的实例被称为对象。然而在Swift 中,类和结构体的关系要比在其他语言中更加的密切,本章中所讨论的大部分功能都可以用在类和结构体上。因此,我们会主要使用实例而不是对象。



// 2. Comparing Classes and Structures 对比类和结构体
  /*
Swift 中类和结构体有很多共同点。共同处在于: 
    定义属性用于储存值    定义方法用于提供功能    定义下标用于通过下标语法访问值    定义初始化器用于生成初始化值    通过扩展以增加默认实现的功能    遵循协议以对某类提供标准功能

更多信息请参见 属性，方法，下标，初始过程，扩展，和协议。


与结构体相比,类还有如下的附加功能:    继承允许一个类继承另一个类的特征    类型转换允许在运行时检查和解释一个类实例的类型    取消初始化器允许一个类实例释放任何其所被分配的资源    引用计数允许对一个类的多次引用

更多信息请参见Inheritance, Type Casting, Deinitialization和Automatic Reference Counting.

￼注意:结构体总是通过被复制的方式在代码中传递,因此请不要使用引用计数。

*/


// 2.1 Definition Syntax 语法定义
  // 类和结构体有着类似的定义方式。我们通过关键字class和struct来分别表示类和结构体，并在一对大括号中定义它们的具体内容：
class SomeClass {
        //class definition goes here
}

struct SomeStructure {
    // structure definition goes here
}

//注意: 在你每次定义一个新类或者结构体的时候,实际上你是有效地定义了一个新的 Swift 类型。因此请使用 UpperCamelCase 这种方式来命名(如 SomeClass 和 SomeStructure 等),以便符合标准 Swift 类型的大写命名风格(如 String,Int 和Bool)。相反的,请使用 lowerCamelCase 这种方式为属性和方法命名(如 framerate 和incrementCount),以便和类区分。


// 以下是定义结构体和定义类的示例：
struct Resolution { // 结构体有两个属性
    var width = 0
    var height = 0
}


class VideoMode { //这个类有4个属性
    var resolution = Resolution() //被初始化为一个新的Resolution结构体实例
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// 在上面的示例中我们定义了一个名为Resolution的结构体，用来描述一个显示器的像素分辨率。这个结构体包含了两个名为width和height的储存属性。储存属性是捆绑和储存在类或结构体中的常量或变量。当这两个属性被初始化为整数0的时候，它们会被推断为Int类型。

// 在上面的示例中我们还定义了一个名为VideoMode的类，用来描述一个视频显示器的特定模式。这个类包含了四个储存属性变量。第一个是分辨率，它被初始化为一个新的Resolution结构体的实例，具有Resolution的属性类型。新VideoMode实例同时还会初始化其它三个属性，它们分别是，初始值为false(意为“non-interlaced video”)的inteflaced，回放帧率初始值为0.0的frameRate和值为可选String的name。name属性会被自动赋予一个默认值nil，意为“没有name值”，因它是一个可选类型。




// 2.2 Class and Structure Instances 类和结构体实例
  // Resolution 结构体和 VideoMode 类的定义仅描述了什么是 Resolution 和 VideoMode。它 们并没有描述一个特定的分辨率(resolution)或者视频模式(video mode)。为了描述一 个特定的分辨率或者视频模式,我们需要生成一个它们的实例。

// 生成结构体和类实例的语法非常相似：
let someResolution = Resolution() // 结构体实例
let someVideoMode = VideoMode() // 类实例
// 结构体和类都使用初始化器语法来生成新的实例。初始化器语法的最简单形式是在结构体或者类的类型名称后跟随一个空括弧，如Resolution()或VideoMode()。通过这种方式所创建的类或者结构体实例，其属均会被初始化为默认值。构造过程章节会对类和结构体的初始化进行更详细的讨论。




// 2.3 Accessing Properties 属性访问
  //￼通过使用点语法(dot syntax),你可以访问实例中所含有的属性。其语法规则是,实例名后面紧跟属性名,两者通过点号(.)连接:

println("The width of someResolution is \(someResolution.width)")
// prints "The width of someResolution is 0”
// 在上面的例子中，someResolution.width引用someResolution的width属性，返回width的初始值0。

// 你也可以访问子属性，如何VideoMode中Resolution属性的width属性：
println("The width of someVideoMode is \(someVideoMode.resolution.width)")
// prints "The width of someVideoMode is 0”

// 你也可以使用点语法为属性变量赋值
someVideoMode.resolution.width = 1280
println("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// prints "The width of someVideoMode is now 1280"

//注意:与 Objective-C 语言不同的是,Swift 允许直接设置结构体属性的子属性。上面的最后一个例子,就是直接设置了 someVideoMode 中 resolution 属性的 width 这个子属性,以上操作并不需要从新设置 resolution 属性。




// 2.4 Memberwise Initializers for Structure Types 结构体类型的成员逐一初始化器
  // 所有结构体都有一个自动生成的成员逐一初始化器,用于初始化新结构体实例中成员的属性。新实例中各个属性的初始值可以通过属性的名称传递到成员逐一初始化器之中
let vga = Resolution(width: 640, height: 480)


//与结构体不同,类实例没有默认的成员逐一初始化器。构造过程章节会对初始化器进行更详细的讨论。



// 3. Structures and Enumerations Are Value Types 结构体和枚举是值类型

  //￼值类型被赋予给一个变量,常数或者本身被传递给一个函数的时候,实际上操作的是其的拷贝.

//在之前的章节中，我们已经大量使用了值类型。实际上,在 Swift 中,所有的基本类型:整数(Integer)、浮点数(floating-point)、布尔值(Booleans)、字符串(string)、数组(array)和字典(dictionaries),都是值类型,并且都是以结构体的形式在后台所实现。

//在 Swift 中,所有的结构体和枚举都是值类型！！！这意味着它们的实例,以及实例中所包含的任何值类型属性,在代码中传递的时候都会被复制。

// 请看下面这个示例，其使用了前一个示例中Resolution结构体：
let hd = Resolution(width: 1920, height: 1080) // hd 是被初始化的Resolution实例，本质也是结构体
var cinema = hd // cinema是hd的一个副本，本质也是结构体，一个新的Resolution实例，但是跟hd是两个不同的实例。

// 在以上示例中，声明了一个名为hd的常量，其值为一个初始化为全高清视频分辨率(1920 像素宽，1080 像素高)的Resolution实例。
// 然后示例中又声明了一个名为cinema的变量，其值为之前声明的hd。因为Resolution是一个结构体，所以cinema的值其实是hd的一个拷贝副本，而不是hd本身。尽管hd和cinema有着相同的宽(width)和高(height)属性，但是在后台中，它们是两个完全不同的实例。

// 下面，为了符合数码影院放映的需求(2048 像素宽，1080 像素高)，cinema的width属性需要作如下修改：
cinema.width = 2048 // 改变cinema的width属性并不会改变hd的
// 这里，将会显示cinema的width属性确已改为了2048：

println("cinema is now \(cinema.width) pixels wide")
// prints "cinema is now 2048 pixels wide”
// 然而，初始的hd实例中width属性还是1920：

println("hd is still \(hd.width) pixels wide")
// prints "hd is still 1920 pixels wide”

// 在将hd赋予给cinema的时候，实际上是将hd中所储存的值(values)进行拷贝，然后将拷贝的数据储存到新的cinema实例中。结果就是两个完全独立的实例碰巧包含有相同的数值。由于两者相互独立，因此将cinema的width修改为2048并不会影响hd中的宽(width)。


// 枚举也遵循相同的行为准则
enum CompassPoint  {
    case North, South, East, West
}

var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection //这只是copy。
currentDirection = .East
println("current direction is \(currentDirection)")
if rememberedDirection == .West {
    println("The remembered direction is still .West ")
}
// prints "The remembered direction is still .West "

// 上例中rememberedDirection被赋予了currentDirection的值(value)，实际上它被赋予的是值(value)的一个拷贝。赋值过程结束后再修改currentDirection的值并不影响rememberedDirection所储存的原始值(value)的拷贝。



// 4. Classes Are Reference Types 类是引用类型

  //与值类型不同,引用类型在被赋予到一个变量,常量或者被传递到一个函数时,操作的并不是其拷贝。因此,引用的是已存在的实例本身而不是其拷贝。

// 请看下面这个示例，其使用了之前定义的VideoMode类：
let tenEighty = VideoMode() // 引用了一个VideoMode的"新实例"
tenEighty.resolution = hd // hd结构体的copy
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// 以上示例中，声明了一个名为tenEighty的常量，其引用了一个VideoMode类的新实例。在之前的示例中，这个视频模式(video mode)被赋予了HD分辨率(1920*1080)的一个拷贝(hd)。同时设置为交错(interlaced),命名为“1080i”。最后，其帧率是25.0帧每秒。

// 然后，tenEighty 被赋予名为alsoTenEighty的新常量，同时对alsoTenEighty的帧率进行修改：

let alsoTenEighty = tenEighty // 相当于alsoTenEighty跟tenEighty引用同一个VideoMode实例。
alsoTenEighty.frameRate = 30.0
//因为类是引用类型,所以 tenEight 和 alsoT enEight 实际上引用的是相同的 VideoMode 实例。换句话说,它们只是同一个实例的两种叫法.

//下面，通过查看tenEighty的frameRate属性，我们会发现它正确的显示了基本VideoMode实例的新帧率，其值为30.0：
println("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// prints "The frameRate property of tenEighty is now 30.0”

// 需要注意的是tenEighty和alsoTenEighty被声明为常量(constants)而不是变量。然而你依然可以改变tenEighty.frameRate和alsoTenEighty.frameRate,因为这两个常量本身不会改变。它们并不储存这个VideoMode实例，在后台仅仅是对VideoMode实例的引用。所以，改变的是被引用的基础VideoMode的frameRate参数，而不改变常量的值。

// alsoTenEighty 和 tenEighty虽然都是常量，但是这个常量存的是VideoMode实例的引用，所以上面是更改这个实例的属性的值



// 4.1 Identity Operators  恒等运算符
  // 因为类是引用类型,有可能有多个常量和变量在后台同时引用某一个类实例。(对于结构体和枚举来说,这并不成立。因为它们作值类型,在被赋予到常量,变量或者传递到函数时,总是会被拷贝。)
// 如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符
//等价于 Identical to ( === )
//不等价于 Not identical to ( !== )

//以下是运用这两个运算符检测两个常量或者变量是否引用同一个实例：
if tenEighty === alsoTenEighty {
    println("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// prints "tenEighty and alsoTenEighty refer to the same VideoMode instance.”

/*
请注意“等价于”(用三个等号表示,===) 与“等于”(用两个等号表示,==)的不同:“等价于”表示两个类类型(class type)的常量或者变量引用同一个类实例。

“等于”表示两个实例的值“相等”或“相同”,判定时要遵照类设计者定义定义的评判标准,因 此相比于“相等”,这是一种更加合适的叫法。

当你在定义你的自定义类和结构体的时候,你有义务来决定判定两个实例“相等”的标准。在章节运算符函数(Operator Functions)中将会详细介绍实现自定义“等于”和“不等于”运算符的流程。

*/



// 4.2 Pointers 指针
/*如果你有 C，C++ 或者 Objective-C 语言的经验，那么你也许会知道这些语言使用指针来引用内存中的地址。一个 Swift 常量或者变量引用一个引用类型的实例与 C 语言中的指针类似,不同的是并不直接指向内存中的某个地址,而且也不要求你使用星号(*)来表明你在创建一个引用。Swift 中这些引用与其它的常量或变量的定义方式相同。*/



// 5. Choosing Between Classes and Structures 类和结构体的选择
  // 在你的代码中，你可以使用类和结构体来定义你的自定义数据类型。
/*
然而，结构体实例总是通过值传递,类实例总是通过引用传递。这意味两者适用不同的任务。当你的在考虑一个工程项目的数据构造和功能的时候,你需要决定每个数据构造是定义成类还是结构体。

按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：

结构体的主要目的是用来封装少量相关简单数据值。有理由预计一个结构体实例在赋值或传递时,封装的数据将会被拷贝而不是被引用。任何在结构体中储存的值类型属性,也将会被拷贝,而不是被引用。结构体不需要去继承另一个已存在类型的属性或者行为。
合适的结构体候选者包括:	几何形状的大小,封装一个 width 属性和 height 属性,两者均为 Double 类型。
    一定范围内的路径,封装一个 start 属性和 length 属性,两者均为 Int 类型。    三维坐标系内一点,封装 x,y 和 z 属性,三者均为 Double 类型。
在所有其它案例中,定义一个类,生成一个它的实例,并通过引用来管理和传递。实际中,这意味着绝大部分的自定义数据构造都应该是类,而非结构体。


*/



// 6. Assignment and Copy Behavior for Strings, Arrays, and Dictionaries   -- Strings, Arrays, and Dictionaries的赋值和拷贝行为

/*
Swift中Strings， Arrays， Dictionaries都是结构体方式实现的， 所以当他们被copy时，他们是被赋值给一个新的常量或变量，或被传递给一个函数或方法。

而在Foundation里的NSString, NSArray, and NSDictionary，他们是以类的方式实现的，并不是结构体方式。所以他们都是作为实例的引用被赋值或被传递，而不是copy。

注意： 在Swift 的后台中,只有确有必要,实际 (actual)拷贝才会被执行。Swift 管理所有的值拷贝以确保性能最优化的性能,所以你也没有必要去避免赋值以保证最优性能。
*/





