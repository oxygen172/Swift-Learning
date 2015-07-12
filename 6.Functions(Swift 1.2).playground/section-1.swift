// Playground - noun: a place where people can play

import UIKit

// 1. Functions 函数
  // 函数是执行特定任务的代码自包含块。通过给定一个函数名称标识它是什么，并在需要的时候使用该名称来调用函数以执行任务。

// Swift的统一的功能语法足够灵活的，可表达任何东西，无论是不带参数名称的简单的样式函数，还是带本地和外部参数名称的复杂的Objective-C样式方法。参数可为简单函数调用提供默认值，并且可以被作为输入/输出参数传递，在函数执行完成时修改传递来的变量。

// Swift中的每个函数都有一个类型，包括函数的参数类型和返回类型。你可以像使用Swift中其他类型一样使用该类型,这使得它很容易将函数作为参数传递给其他函数,甚至从函数中返回函数类型。函数也可以被写入其他函数中以在函数作用于中封装有用的功能。



// 2. Defining and Calling Functions 定义和调用函数

/* 当你定义一个函数时,你可以选择性地定义一个或多个名称,类型值作为函数的输入(parameters称为形参),或者定义一个函数结束后返回值的类型(return type 称之为返回型)。每一个函数都有一个函数名,用来描述了函数执行的任务。要使用一个函数时,可使用它的名称进行“调用”,并通过它的输入值(arguments称为实参)来匹配函数的参数类型。一个函数的实参 (arguments)必须始终和函数形参(parameter)顺序一致。
*/

// 例如在下面的例子中被调用的函数greetingForPerson，像它描述的那样 -- 它需要一个人的名字作为输入并返回一句针对那个人的问候语。为了实现该功能，你定义了一个输出参数--一个名为personName的字符串值，以及一个String返回类型，包含一个针对那个人的问候语：
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName  + "!"
    return greeting
}  // personName 是形参

// 所有这些信息都汇总到以func关键字为前缀的函数定义中。使用箭头->来指明函数的返回类型（一个连字符后跟一个向右的箭头），后边跟着返回的类型名称。

// 该定义描述了函数的作用是什么，它期望接收什么，以及完成后返回的结果。该定义可轻易地让你在代码中的其他地方清晰明确地调用该函数：

println(sayHello("Anna"))  // "Anna" 是实参

println(sayHello("Brian"))

// 你可以通过给它传递一个圆括号内String实参值来调用sayHello函数，例如sayHello（"Anna"）。由于该函数返回一个String值，sayHello可以被包裹在一个println函数调用中来打印字符串，看看它的返回值，如上图所示。

// sayHello的函数主体首先定义了一个新的名为greeting的String常量，并将其设置加上personName组成一句简单的问候消息。然后这个greeting以关键字return来传回到函数外部。只要return greeting被调用，函数执行完毕后就会返回greeting的当前值。

// 你可以通过不同的输入值多次调用sayHello的函数。上面的例子显示了如果使用"Anna"输入值调用它会发生什么，以及以"Brian"输入值调用时会发生什么。函数为每种情况量身定制了问候语。


// 为了简化这个函数的主体，可把消息创建和return语句合并成一行：

func sayHelloAgain(personName: String) -> String {
    return  "Hello again, " + personName + "!"
}

println(sayHelloAgain("Anna"))
// prints "Hello again, Anna!" 



// 3. Function Parameters and Return Values 函数的形参和返回值
// 在swift中，函数的形参和返回值是非常具有灵活性的。你可以定义任何事情，无论是一个简单的仅有一个未命名形参的工具函数，还是那种具有丰富的参数名称和不同的形参选项的复杂函数。



// 3.1 Multiple Input Paramters 多输入形参
//函数可以有多个输入形参，把它们写到函数的括号内，并用逗号加以分隔。下面这个函数设置了一个半开区间的开始和结束索引，用来计算在范围内有多少元素：
func halfOpenRangeLegngth (start: Int, end: Int) -> Int {
    return end - start
}
println(halfOpenRangeLegngth(1, 10))



// 3.2 Functions Without Parameters 无形参函数
// 函数并没有要求一定要定义的输入形参。下面就是一个没有输入形参的函数，任何时候调用时它总是返回相同的String消息：
func sayHelloWorld() -> String {
    return "hello, world"
}

println(sayHelloWorld()) // 记得括号要带上
// prints "hello, world" 
//该函数的定义还需要在函数的名称后跟一对儿圆括号，即使它不带任何形参。当函数被调用时函数名称也要跟着一对儿空括号。




// 3.3 Functions Without Return Values 无返回值的函数
  // 函数不需要定义一个返回类型。这里有一个版本的sayHello函数，称为waveGoodbye，它会打印自己的String值而不是返回它：
func sayGoodbye (personName: String) {
    println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")
// prints "Goodbye, Dave!"
//因为它并不需要返回一个值,该函数的定义不包括返回箭头( ->)和返回类型

//  提示：严格地说，sayGoodbye函数确实还返回一个值，即使没有定义返回值。没有定义返回类型的函数返回了一个Void类型的特殊值。这仅是一个空元组，这里边没有元素，可以被写成()。

// 但是如果你用了返回箭头，return是必须的?????


// 当一个函数调用时它的返回值可以忽略不计：
func printAndCount(stringToPrint: String) -> Int {
    println(stringToPrint)
    return count(stringToPrint)
}

func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint) // 虽然调用printAndCount并返回了12，但是这个函数不返回值，所以12也没有被返回
}

printAndCount("hello, world")
// prints "hello, world" and returns a value of 12

printWithoutCounting("hello, world")
// prints "hello, world" but does not return a value

//  第一个函数printAndCount，打印了一个字符串，然后并以Int类型返回它的字符数。第二个函数printWithoutCounting，调用的第一个函数，但忽略它的返回值。当第二函数被调用时，消息由第一函数打印了回来，但没有使用其返回值。

//提示：返回值可以忽略，但一个定义了返回值的函数则必须有返回值。对于一个定义了返回类型的函数来说，如果没有返回值，那么将不允许控制流离开函数的底部。如果试图这样做将出现一个编译时错误。




// 3.4 Functions with Multiple Return Values 多返回值函数
  // 你可以使用一个元组类型作为函数的返回类型，来返回一个由多个值组成的复合返回值。

// 下面的例子定义了一个名为minMax的函数，用来返回数组中的最小值和最大值。
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// minMax函数返回一个元组，包括两个Int值。这两个值被标记为min和max，所以查询函数返回值时可以通过它们找到这两个值。
// 函数minMax的主体首先定义两个操作变量currentMin和currentMax并将数组的第一个值赋给它们。剩下的功能迭代数组其余值，将它们分别跟currentMin比小、跟currentMax比大。最后整体的最小值和最大值通过元组形式返回两个Int值。

// 因为元组成员值被命名为函数返回类型的一部分，所以它们可以通过点语法来访问获取被找到的最小值和最大值。
let bounds = minMax([8,-6,2,109,3,71])
println("min is \(bounds.min) and max is \(bounds.max)")

//注意:函数返回的元组后，元组的成员不需要被命名,因为它们的名字已经被指定为函数的返回类型的一部分。所以可以访问bounds.min




// 3.5 Optional Tuple Return Types 可选的元组返回类型
  // 如果函数返回的整个元组是有可能为空的，你可以使用可选的元组返回类型来表示这整个元组可以是nil的， 格式为 (Int,Int)? 或者 (String,Int,Bool)?

// 注意(Int，Int)?跟(Int?,Int?)是不一样的，前者是整个元组是可选，后者是元组里的元素是可选。

// 上面例子函数minMax返回的是一个包含两个Int值的元组。然而，这个函数没有执行任何安全检查这个数组是否有效。 如果数组参数是一个空的数组，那么数组的count值就是0，像上面函数的定义当访问array[0]的时候会触发运行时报错。

// 为了安全地处理这个空数组场景， 改写这个函数为带有可选元组返回类型并且当数组为空时返回nil值。

func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// 你可以使用可选绑定来检查这个minMax函数版本是否返回一个实际的元组值或者是nil：
let bounds2 = minMax2([]) // test


if let bounds3 = minMax2([8,-6,2,109,3,71]) {
    println("min is \(bounds3.min) and max is \(bounds3.max)")
}
// prints "min is -6 and max is 109"

// 如果 bound3返回的是nil，if语句就不会执行了，反之，如果bounds3不是空，就会执行println（）
// 但是，如果minMax2 返回的tuple不是optional的话，if let bounds3 = minMax2([8,-6,2,109,3,71])这个语句就会报错,因为 if条件判断返回值要为bool类型。




// 4. Function Parameter Names 函数形参名
  // 所有上面的函数都为其形参定义了形参名：
func someFunction(parameterName: Int) {
    // function body goes here, and can use parameterName
    // to refer to the argument value for that parameter
}
// 然而，这些参数名的仅能在函数本身的主体内使用，不能在调用函数时使用。这种形参类型名称被称之为本地形参名（local parameter name），因为它们只能在函数的主体中使用。



// 4.1 External Parameter Names 外部形参名
  // 有时当你调用一个函数将每个形参进行命名是非常有用的，以表明你把每个实参传递给函数的目的。
//如果你希望使用你函数的人在调用函数时提供形参名称,那除了本地形参名外,你还要为每个形参定义一个外部形参名称。你写一个外部形参名称在它所支持的本地形参名称之前, 之间用一个空格来分隔:
// 其实是为了方便阅读代码而给每个形参分别一个别名，但是调用的同时也要写明调用的别名

func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
    // to refer to the argument value for that parameter
}
// 提示:如果您为形参供一个外部形参名称,那么外部形参名必须在调用时使用。

// 举一个例子，考虑下面的函数，通过在它们之间插入第三个"joiner"字符串来连接两个字符串：
func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2
}

// 当你调用这个函数，你传递给函数的三个字符串的目的就不是很清楚了：
join("hello", "world", ", ")
// returns "hello, world"


// 为了使这些字符串值的目的更为清晰,为每个join函数形参定义外部形参名称:
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}
// 在这个版本的join函数中，第一个形参的外部名称string，本地名称s1;第二个形参的外部名称toString，本地名称s2;第三个形参的外部名称是withJoiner，本地名称为joiner。

// 现在，您可以使用这些外部形参名称清楚明确地调用该函数：
join(string: "hello", toString: "world", withJoiner: ", ")
// returns "hello, world"


// 使用外部参数名称使join函数的第二个版本功能以更富有表现力,用户习惯的sentence-like方式调用函数,同时还提供了一个可读的、意图明确的函数体。

// 注意:在别人第一次阅读你的代码不知道你函数形参目的时候,就要考虑到使用外部形参名称了。在调用函数的时候,如果每个形参的目的清晰明确的话,那你就无需指定外部形参名。



// 4.2 Shorthand External Parameter Names 外部参数名称速记
// 如果你想为一个函数提供一个外部形参名，然而本地形参名已经使用了一个合适的名称了，那你就不需要两次书写该形参的名称。相反，你可以写一次名字，并用一个hash符号（＃）作为名称的前缀。这就告诉Swift使用名称相同的本地行参名称和外部形参名称。

// 这个例子定义了一个名为containsCharacter的函数,通过在本地形参名前添加hash符号(#)来定义外部形参名称。
func containsCharacter(#string: String, #characterToFind: Character) -> Bool {
    for character in string {
        if character == characterToFind {
            return true
        }
    }
    return false  //遍历完后都找不到才return false
}

// 该函数对形参名的选择使得其函数主题更加清晰易读，并且在调用该函数时也不会有歧义：
let containsAVee = containsCharacter(string: "aardvark", characterToFind: "v")
// containsAVee equals true, because "aardvark" contains a "v”




// 4.3 Default Parameter Values 默认形参值
  //你可以为任何形参定义默认值以作为函数定义的一部分。如果已经定义了默认值,那么调用函数时就可以省略该形参。
// 注意:请在函数形参列表的末尾放置带默认值的形参。这将确保所有函数调用都使用顺序相同的无默认值实参,并让在每种情况下清晰地调用相同的函数。

// 这里有一个早期的join函数，并为参数joiner设置了默认值：
func join2(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
    return s1 + joiner + s2
}

// 如果在join函数调用时为joiner提供了字符串值，那么该字符串值可以用来连接两个字符串，就跟以前一样：
join2(string: "hello", toString: "world", withJoiner: "-")
// retuns "hello-world"


//如果函数调用时没有为 joiner 提供值,就会使用单个空格(" ")的默认值
join2(string: "hello", toString: "world")
// returns "hello world"




// 4.4 External Names for Parameters with Default Values 有默认值的外部形参名
  // 在大多数情况下,为所有形参提供一个带默认值的外部名是非常有用的(因此要求)。如果在调用函数的时候提供了一个值，那么这将确保形参对应的实参有着明确的目的。

// 为了使这个过程更容易，当你自己没有提供外部名称时，Swift将为你定义的任何默认形参提供一个自动外部名。这个自动外部名和本地名一样，就像你已经在本地名前添加了hash符号（#）一样。

// 这里有一个早期join函数版本，没有为任何外部形参提供外部名，但仍然提供了joiner形参的默认值
func join3(s1: String, s2: String, joiner: String = " ") ->String {
    return s1 + joiner + s2
}

// 在这种情况下，Swift为带默认值的形参提供了外部形参名，当调用该函数的时候，外部形参名必须让形参的目的明确无歧义：
join3("hello", "world", joiner:"-" )
// returns "hello-world"

//  注意：在定义形参时，你可以通过使用下划线(_)来代替显示外部名称。不过在适当的情况下，带有默认值形参的外部名通常是优先推荐的。




// 4.5 Variadic Parameters 可变形参
  //一个可变形参可接受零个或多个指定类型的值。当函数被调用时，你可以使用可变形参来指定--形参可以用来传递任意数量的输入值。可通过在形参的类型名后边插入三个点符号（...）来编写可变形参。

// 传递至可变形参的值在函数主体内是以适当类型的数组存在的。例如,一个可变参数的名称为numbers和类型为Double...在函数体内就作为名为numbers类型为Double[]的常量数组。

// 下边示例为任何长度的数字列表计算算术平均值：
func arithmeticMean(numbers: Double...) -> Double {
    //一个可变参数的名称为 numbers 和类型为 Double...在函数体内就作为名为 numbers 类型为 Double[]的常量数 组。
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5)
// returns 3.0, which is the arithmetic mean of these five numbers

arithmeticMean(3,8,19)
// returns 10.0, which it the arithmetic mean of these three numbers.

//注意:函数最多可以有一个可变形参,而且它必须出现在参数列表的最后,以避免使用多个形参调用函数引发歧义。如果你的函数有一个或多个带有默认值的形参,并且还有可变形参,请将可变形参放在所有默认形参之后,也就是的列表的最末尾。




// 4.6 Constant and Variable Parameters 常量形参和变量形参
  //函数的形参默认是常量。试图在函数体内改变函数形参的值会引发一个编译时错误。这意味着你不能错误地改变形参的值。
//但是有时候,函数有一个形参值的变量副本是非常有用的。您可以指定一个或多个形参作 为变量形参,从而避免在函数内部为自己定义一个新的变量。变量参数是变量而非常量,并 给函数一个可修改的形参值副本。

// 在参数名称前用关键字var定义变量参数：

func alignRight(var string: String, count2: Int, pad: Character) -> String { //代码例子有误,count要改为count2，这是bug，形参应该不能跟关键字重复
    // 只有string是变量形参，其它两个都是常量形参，在参数名称前用关键字 var 定义变量参数。
    let amountToPad = count2 - count(string)
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, 10, "-")
// paddedString is equal to "-----hello"
// originalString is still equal to "hello”

// 这个例子定义了一个新函数叫做alignRight,用于将一个输入字符串和更长的输出字符串右边缘对齐。所有左侧的空白使用指定的占位符来填充。在这个例子中，字符串"hello"被转化为字符串"-----hello"。

// alignRight函数把输入的形参字符串定义成一个变量形参。这意味着字符串现在可以作为一个本地变量，用传入的字符串值初始化，并且可以在函数体中进行相应操作。

// 函数首先要找出有多少字符需要被添加到字符串的左侧，从而在整个字符串中靠右对齐。这个值存储在本地常量amountToPad中。该函数然后将填充字符的amountToPad个字符拷贝到现有的字符串的左边，并返回结果。


//注意:你对变量形参所做的改变不会比调用函数更持久,并且在函数体外是不可见的。变量形参仅存在于函数调用的声明周期中。

// 注意： Variadic Parameters（可变形参） 跟 Variable Parameters（变量形参）是两码事。



// 4.7 In-Out Parameters  In—Out 形参
  //如上描述,变量形参只能在函数本身内改变。如果你想让函数改变形参值,并想要在函数调用结束后保持形参值的改变,那你可以把形参定义为 in-out 形参。
//通过在形参定义的开始添加 inout 关键字来编写 in-out 形参。in-Out 形参有一个传递至函 数的值,由函数修改,并从函数返回来替换原来的值。
//你只能传递一个变量作为 in-out 形参对应的实参。你不能传递一个常量或者字面量作为实参,因为常量和字面量不能被修改。当你把变量作为实参传递给 in-out 形参时,需要在直接在变量前添加 & 符号,以表明它可以被函数修改。

//注意:in-out 参数不能有默认值,可变参数的参数也不能被标记为 inout。如果您标记 参数为 inout,它不能同时被标记为 var 或 let。

// 这里的一个叫做swapTwoInts函数，它有两个称为a和b的in-out整型形参：
func swapTwoInts(inout a:Int, inout b:Int) { // 可以不需要return
    let temporaryA = a
    a = b
    b = temporaryA
}

// swapTwoInts函数只是简单地交换a、b的值。该函数通过存储一个名为temporaryA临时常量的值，指定b的值到a，然后分配temporaryA到b执行该交换。

// 你可以通过两个Int类型的变量调用swapTwoInts函数，从而交换它们的值。需要注意的是当它们被传递给swapTwoInts函数时，someInt和anotherInt名称前要加上前缀符号&：

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// prints "someInt is now 107, and anotherInt is now 3”

// 上面的例子表明，someInt和anotherInt的原始值由swapTwoInts函数进行了修改，即使它们定义在函数外部。 

//注意:In-out 形参不同于从函数返回一个值。上边 swapTwoInts 例子没有定义返回类型或者返回值,但它仍然会修改 someInt 和 anotherInt 的值。对函数来说,In-out 形参是一个影响函数主体范围外的可选方式。

//事实上swapTowInts是可以指定返回值的，这跟In-Out形参没有冲突



// 5. Function Types  函数类型
  // 每一个函数都有特定的函数类型，由函数的形参类型和返回类型组成。例如：
func addTwoInts(a:Int, b:Int) -> Int {
    return a + b
}
func multiplyTwoInts(a:Int, b:Int) ->Int {
    return a * b
}
// 这个例子中定义了两个简单的数学函数addTwoInts和multiplyTwoInts。每个函数接受两个int值，并返回一个int值，执行适当的数学运算并返回结果。

// 这两个函数的类型都是(Int, Int)->Int。可以解读为:"这个函数类型,它有两个 Int 类型形参,并返回一个 Int 类型的值。"

// 下面是另一个例子，该函数没有形参或返回值：
func printHelloWorld() {
        println("hello, world")
}
// 这个函数的类型是()->(),或者"没有形参的函数,并返回 void。"没有指明返回值的函数通常会返回 void,在 swift 中相当于一个空元组,显示为()。




// 5.1 Using Function Types  使用函数类型
  // ￼在 swift 中您可以像任何其他类型一样的使用函数类型。例如,你可以定义一个常量或变量为一个函数类型,并为变量指定一个对应的函数
var mathFunction: (Int, Int) -> Int = addTwoInts//: (Int, Int) -> Int 是必须的。

//可以解读为:"定义一个名为 mathFunction 变量,该变量的类型为'一个函数,它接受两个 Int 值,并返回一个 Int 值。'设置这个新的变量来引用名为 addTwoInts 函数。
// 该 addTwoInts 函数具有与 mathFunction 相同类型的变量,所以这个赋值在能通过 swift的类型检查。
//其实上面可以简写成 var mathFunction = addTwoInts

// 现在你可以使用mathFunction来调用指定的函数：
mathFunction(2,6)

println("Result: \(mathFunction(2,3))")
// prints "Result: 5"


//具有相同匹配类型的不同函数可以被赋给同一个变量,和非函数类型一样:
mathFunction = multiplyTwoInts
println("Result: \(mathFunction(2,3))")
// prints "Result: 6"
// 可以修改multiplyTwoInts的形参和返回的数据类型为Double，可以看到报错。



// 与其他类型一样,当你给函数赋一个常量或者变量时，你可以让Swift去推断函数的类型。
let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int, Swift可以自己去判断这个常量或变量的函数类型




// 5.2 Function Types as Parameter Types  作为形参的函数类型
  //可以使用一个函数类型,如(Int, Int)->Int 作为另一个函数的形参类型。这使你预留了一个函数的某些方面的函数实现,让调用者提供的函数时被调用。

// 下边的例子打印了上边的数学函数的结果：
func printMathResult (mathFunction: (Int,Int) -> Int, a: Int, b: Int) {
    println("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)
// prints "Result: 8"
//这个例子中定义了一个名为 printMathResult 函数,它有三个形参。第一个形参名为 mathFunction,类型为(Int, Int)->Int。您可以传递任何同类型的函数作为第一个形参的实参。第二和第三个参数 a、b 都是 int 类型。被用来作为数学函数的两个输入值。

//当 printMathResult 被调用时,它被传递到 addTwoInt 函数,以及整数值 3 和 5。它使用 3 和 5 调用了提供的函数addTwoInt,打印的结果是8。

//mathFunction是一个函数类型的形参，调用这个printMathResult时候，addTwoInts这个函数必须要mathFunction的形参类型和返回数据类型一致，才可以正确地被调用。

//printMathResult 的作用是打印调用适当类型的数学函数的结果。该函数真正实现了什么并 不重要--它只关心函数的类型是正确的。这使得 printMathResult 以一种安全类型的方式把自身的功能转换至函数的调用者。




// 5.3 Function Types as Return Types 作为返回函数类型的函数类型
  //可以将一个函数类型作为另一个函数的返回类型。你可以在返回函数的返回箭头(->) 后立即编写一个完整的函数类型来实现。

// 下面的例子定义了两个简单的函数调用stepForward和stepBackward。stepForward函数返回一个输入值+1的结果，而stepBackward函数返回一个输入值-1的结果。这两个函数都有一个相同的(Int) -> Int类型 ：
func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int{
    return input - 1
}


// 下面有一个chooseStepFunction函数，它的返回类型是"函数类型(Int) -> Int"。chooseStepFunction基于名为backwards的布尔形参返回stepBackward或stepForward函数:
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
//chooseStepFunction 函数,它的返回类型是"函数类型(Int) -> Int"。 chooseStepFunction 基于名为 backwards 的布尔形参返回 stepBackward 或 stepForward函数
//这个函数声明方式好奇怪，chooseStepFunction(backward: Bool) -> (Int) -> Int， 首先形参是backward，而(Int) -> Int是这个函数的指定的返回函数类型,也就是这个函数返回的是一个函数。可以看成chooseStepFunction是stepForward和stepBackward的总入口，所以可以理解为先走(backward: Bool)这个点，再返回真正要调用的函数类型，而被调用的函数类型是(Int) -> Int这种类型的，所以被返回的函数类型在被声明时一定是(Int) -> Int类型的。
//这样我们就可以理解(backward: Bool) -> (Int) -> Int这种语法，chooseStepFunction函数形参是(backward: Bool)，被返回的函数stepBackward形参是Int但是不需要再声明形参，所以是(Int)，而被返回的函数类型stepBackward返回的是Int，所以要保持一致的话chooseStepFunction返回的也必须是Int


// 你现在可以使用chooseStepFunction获取一个函数,可能是递增函数或递减函数:
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function”
// currentValue 的初始值为 3,这意味着 currentValue > 0 返回为真,并且 chooseStepFunction 返回 stepBackward 函数。返回函数的引用存储在一个名为moveNearerToZero 的常量里。
// moveNearerToZero是一个函数类型的常量， 但是在声明这个函数时候要先调用布尔预算来判断到底返回哪个函数类型。

let moveNearerTo100 = chooseStepFunction(currentValue > 10)

// 前面的例子可以计算出是否需要通过递增或者递减来让currentValue变量趋于零。currentValue的初始值为3，这意味着currentValue > 0返回为真，并且chooseStepFunction返回stepBackward函数。返回函数的引用存储在一个名为moveNearerToZero的常量里。

// 如今moveNearerToZero执行了正确的功能，就可以用来计数到零
println("Counting to zero:")
// Counting to zero;
while currentValue != 0 {
    println("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
    //因为moveNearerToZero返回的函数类型是stepForward，所以调用moveNearerToZero要按照调用stepForward的方式。
}
println("zero!")
// 3...
// 2...
// 1...
// zero!

println("Now the currentValue = \(currentValue)")


println("Counting to 10:")
// Counting to zero;
while currentValue  != 10 {
    println("\(currentValue)...")
    currentValue = moveNearerTo100(currentValue)
}
println("Now 10!")
println("Now the currentValue = \(currentValue)")

    
    

// 6. Nested Functions 嵌套函数
  // 迄今为止所有你在本章中遇到函数都是全局函数,在全局作用域中定义。其实你还可以在其他函数体中定义函数,被称为嵌套函数。
// 嵌套函数默认对外界是隐藏的,但仍然可以通过它们包裹的函数调用和使用它。enclosing function 也可以返回一个嵌套函数,以便在其他作用域中使用嵌套函数。
    

//重写上面的 chooseStepFunction 例子使用并返回嵌套函数:
func chooseStepFuction2(backwards: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int {
            return input + 1
        }
        func stepBackward(input: Int) -> Int {
            return input - 1
        }
        return backwards ? stepForward : stepForward
}

var currentValue2 = -4
let moveNearerToZero2 = chooseStepFuction2(currentValue2 > 0)
// moveNearerToZero now refers to the nested stepForward() function

while currentValue2 != 0 {
    println("\(currentValue2)...")
    currentValue2 = moveNearerToZero2(currentValue2)
}

println("zero!")

// -4...
// -3...
// -2...
// -1...
// zero!”
























