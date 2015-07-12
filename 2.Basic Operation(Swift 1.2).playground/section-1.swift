// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 1. Basic Operation 基本运算符

/*
运算符是检查, 改变, 合并值的特殊符号或短语. 例如, 加号 + 把计算两个数的和(如 let i = 1 + 2). 复杂些的运行算包括逻辑与&&(如 if enteredDoorCode && passedRetinaScan), 还有自增运算符 ++i 这样让自身加一的便捷运算.

Swift支持大部分标准C语言的运算符, 且改进许多特性来减少常规编码错误. 如, 赋值符 = 不返回值, 以防止错把等号 == 写成赋值号 = 而导致Bug. 数值运算符( + , -, *, /, %等)会检测并不允许值溢出, 以此来避免保存变量时由于变量大于或小于其类型所能承载的范围时导致的异常结果. 当然允许你选择使用Swift的溢出运算符来玩溢出. 具体使用请参考[Overflow Operators].

区别于C语言, 在Swift中你可以对浮点数进行取余运算( % ), 还提供了C语言没有的表达两数之间的值的区间运算符, ( a..b 和 a...b ), 这方便我们表达一个区间内的数值.

本章节只描述了Swift中的基本运算符, 高级运算符包含了高级运算符,及如何自定义运算符, 及如何进行自定义类型的运算符重载.

*/

// 2. Terminology 术语
/*
运算符有一目, 双目和三目运算符.

一目运算符对单一操作对象操作, 如 -a.

一目运算符分前置符和后置运算符, 前置运算符需紧排操作对象之前, 如 !b, 后置运算符需紧跟操作对象之后,如 i++,

双目运算符操作两个操作对象, 如 2 + 3. 是中置的, 因为它们出现在两个操作对象之间.

三目运算符操作三个操作对象, 和C语言一样, Swift只有一个三目运算符, 就是三目条件运算符 a ? b : c.

受运算符影响的值叫操作数, 在表达式 1 + 2 中, 加号 + 是双目运算符, 它的两个操作数是值 1 和 2.

*/



// 3. Assignment Operator 赋值运算符
  // 赋值运算 a = b, 表示用 b 的值来初始化或更新 a 的值.
let b1 = 10
var a1 = 5
a1 = b1

// 如果赋值的右边是一个多元组, 它的元素可以马上被分解多个变量或变量
let (x, y) = (1, 2)

println(x)
println(y)

// 与C语言和Objective-C不同, Swift的赋值操作并不返回任何值. 所以以下代码是错误的:
//if x = y {
//    // 此句错误, 因为 x = y 并不返回任何值
//}
// 这个特性阻止你把==错写成=了, 由于if x = y是错误代码, Swift从底层帮你避免了这些代码错误.



// 4. Arithmetic Operator 数值运算
/*
Swift让所有数值类型都支持了基本的四则运算:

加法 +
减法 -
乘法 *
除法 /
*/
 1 + 2
 
 5 - 3
 
 2 * 3
 
 10.0/2.5
 
 // 与C语言和Objective-C不同的是, Swift默认不允许在数值运算中出现溢出情况. 但你可以使用Swift的溢出运算符来达到你有目的的溢出, (如 a &+ b ). 详情请参考Overflow Operators.
 
 //加法操作 + 也用于字符串的拼接:
 "Hello, " + "world"
 
 

// 4.1. Remainder Operator 求余运算
 
 // 求余运算 a % b 是计算 b 的多少倍刚刚好可以容入 a , 多出来的那部分叫余数.
 
// 注意：求余运算(%)在其他语言也叫取模运算modulo operator. 然而严格说来, 我们看该运算符对负数的操作结果, 求余比取模 更合适些.
/*
 我们来谈谈取余是怎么回事, 计算 9 % 4, 你先计算出4的多少倍会刚好可以容入 9 中.
 
 2倍, 非常好, 那余数是1 (用'*'标出)
 */
//在Swift中这么来表达
9 % 4
// 为了得到 a % b 的结果, %计算了以下等式, 并输出余数作为结果:
   // a = (b × 倍数) + 余数
// 当倍数取最大值的时候, 就会刚好可以容入 a 中.

// 把 9 和 4 代入等式中, 我们得 1: 9 = (4 x 2) + 1

// 同样的方法, 我来们计算 -9 % 4 :
-9 % 4  //  等于 -1
// 把 -9 和 4 代入等式, -2 是取到的最大整数: -9 = (4 × -2) + -1 
// 余数是 -1.

// 在对负数 -b 求余时, -b的符号会被忽略. 这意味着 a % b 和 a % -b的结果是相同的.


// 4.2. Floating-Point Remainder Calculations 浮点数求余计算

  // 不同于C和Objective-C, Swift中是可以对浮点数进行求余的.
8 % 2.5 // swift 可以对浮点数进行求余
// 这个例子中, 8除于2.5等于3余0.5, 所以结果是0.5.


// 4.3 Increment and Decrement Operators 自增和自减运算

 // 和C一样, Swift也提供了方便对变量本身加1或减1的自增 ++ 和自减 -- 的运算符. 其操作对象可以是整形和浮点型。 ‌

var i = 0
++i  //当 ++ 前置的时候, 先自増再返回.  推荐使用++i
// 每调用一次 ++i, i 的值就会加1. 实际上, ++i 是 i = i + 1 的简写, 而 --i 是 i = i - 1的简写.

i++  //当 ++ 后置的时候, 先返回再自增.

// ++ 和 --既是前置又是后置运算. ++i, i++, --i 和 i-- 都是有效的写法.

// 我们需要注意的是这些运算符修改了 i 后有一个返回值. 如果你只想修改 i 的值, 那你就可以忽略这个返回值. 但如果你想使用返回值, 你就需要留意前置和后置操作的返回值是不同的.

// 当 ++ 前置的时候, 先自増再返回.

// 当 ++ 后置的时候, 先返回再自增.

// 不懂? 我们看例子:
var a = 0

let b = ++a // a 和 b 现在都是 1

let c = a++ // a 现在 2, 但 c 是 a 自增前的值 1 

/*
上述例子, let b = ++a, 先把 a 加1了再返回 a 的值. 所以 a 和 b 都是新值 1.

而 let c = a++, 是先返回了 a 的值, 然后 a 才加1. 所以 c 得到了 a 的旧值1, 而 a 加1后变成2.

除非你需要使用 i++ 的特性, 不然推荐你使用 ++i 和 --i, 因为先修改后返回这样的行为更符合我们的逻辑.
*/


// 4.4. Unary Minus Operator 单目负号  
  // 数值的正负号可以使用前缀 - (即单目负号) 来切换

let  three = 3
let minusThree = -three  // minusThree 等于 -3
let plusThree = -minusThree // plusThree 等于 3, 或 "负负3"

//￼单目负号写在操作数之前, 中间没有空格.


// 4.5. Unary Plus Operator单目正号
  //单目正号 + 不做任何改变地返回操作数的值

let minusSix = -6
let alsoMinusSix = +minusSix

// 虽然单目 + 做无用功, 但当你在使用单目负号来表达负数时, 你可以使用单目正号来表达正数, 如此你的代码会具有对称美.


// 5. Compound Assignment Operators 复合赋值运算符
  // 如同强大的C语言, Swift也提供把其他运算符和赋值运算 = 组合的复合赋值运算符, 加赋运算 += 是其中一个例子:
var a3 = 1
a3 += 2 // short for a3 = a3 + 2 // a 现在是 3 

a3 -= 1 // short for a3 = a3 -1 // a  现在是 2 

// 表达式 a += 2 是 a = a + 2 的简写, 一个加赋运算就把加法和赋值两件事完成了.

// 注意：复合赋值运算没有返回值, let b = a += 2 这类代码是错误. 这不同于上面提到的自增和自减运算符.
// 完整的复合赋值运算符请参考[Expressions]


// 6. Comparison Operators 比较运算
  /* 所有标准C中的比较运算都可以在Swift中使用.
等于 a == b
不等于 a != b
大于 a > b
小于 a < b
大于等于 a >= b
小于等于 a <= b

注意: Swift也提供恒等 === 和不恒等 !== 这两个比较符来判断两个对象是否引用同一个对象实例. 更多细节在Class and Structures.
*/

//每个比较运算都返回了一个标识表达式是否成立的布尔值:
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1


// 比较运算多用于条件语句, 如 if 条件:
let name = "world"
if name == "world" {
    println("hello, world")
} else {
    println("I'm sorry, \(name), but I don't recognize you")
    
}

// 关于 if 语句, 请看 Control Flow



// 7. Ternary Conditional Operator 三目条件运算
  // 三目条件运算的特殊在于它是有三个操作数的运算符, 它的原型是 问题 ? 答案1 : 答案2. 它简洁地表达根据 问题 成立与否作出二选一的操作. 如果 问题 成立, 返回 答案1 的结果; 如果不成立, 返回 答案2 的结果.

/*
使用三目条件运算简化了以下代码:
if question: {
answer1
}
else {
answer2
}
*/

// 这里有个计算表格行高的例子. 如果有表头, 那行高应比内容高度要高出50像素; 如果没有表头, 只需高出20像素.
let contentHeight  = 40
let hasHearder = true
let rowHeight = contentHeight + (hasHearder ? 50 : 20)
// rowHeight 现在是 90 

// 这样写会比下面的代码简洁:
let contentHeight2 = 40
let hasHeader2 = true
var rowHeight2 = contentHeight2
if hasHeader2 {
    rowHeight2 = rowHeight2 + 50
} else {
    rowHeight2 = rowHeight2 + 20
}
// rowHeight 现在是 90

//第一段代码例子使用了三目条件运算, 所以一行代码就能让我们得到正确答案. 这比第二段代码简洁得多, 无需将 rowHeight 定义成变量, 因为它的值无需在 if 语句中改变.

//三目条件运算提供有效率且便捷的方式来表达二选一的选择. 需要注意的事, 过度使用三目条件运算就会由简洁的代码变成难懂的代码. 我们应避免在一个组合语句使用多个三目条件运算符.


// 8. Nil Coalescing Operator 空合并运算符
  // 空合并运算符（a ?? b）返回可选的非空a，如果a为nil就返回默认值b。表达式里的a必须是可选类型，而b一定要跟a的数据类型一直。
/* 空合并运算符等同于下面代码的简写：
    a != nil ? a! : b

上面的代码使用了三目条件运算符并强制解析（a!）来获取a值，当a不是nil时候返回a，否则返回b。空合并运算符提供了一种更优雅的方式来包含条件检查和精确并可读形式的解析。

注意： 如果a 值不是nil，b值就不会被获取。 这叫做 short-circuit evaluation.
*/
// 下面例子使用空合并运算符来选择默认颜色和一个可选的用户自定义颜色
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

// userDefinedColorName 变量定义为一个可选的String，默认是为nil。应为userDefinedColorName是可选类型，你可以使用空合并运算来考虑它的值。上面例子，一个String变量叫colorNameToUse用这个运算符来决定初始值。因为userDefinedColorName为nil，所以表达式userDefinedColorName ?? defaultColorName 返回defaultColorName，就是red

// 如果你将非nil值赋给userDefinedColorName，再用空合并运算符检查一下，那么包含在userDefinedColorName的值就会替换默认值。
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName



// 9. Range Operators 区间运算符
  // Swift提供了两个方便表达一个区间的值的运算符.

// 9.1 Closed Range Operator 闭区间运算符
  //闭区间运算符 a...b 定义一个包含从 a 到 b (包括 a 和 b)的所有值的区间. 闭区间运算 符在迭代一个区间的所有值时是非常有用的, 如在 for-in 循环


for index in 1...5 {  // 记住是三个点...
    println("\(index) * 5 = \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// 关于 for-in, 请看Control Flow.


// 9.2 Half-Open Range Operator 半闭区间
  //半闭区间 a..<b 定义一个从 a 到 b 但不包括 b 的区间. 之所以称为半闭区间, 是因为该区间包含第一个值而不包括最后的值. 因为在闭区间运算，所以a值必须不能比b值大，如果a等于b，那么返回区间为空。

// 半闭区间的实用性在于当你使用一个0始的列表(如数组)时, 非常方便地从0数到列表的长度.
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count { //   ..< 注意是两点
    println("Person \(i + 1) is called \(names[i])")
}
// 第 1 个人叫 Anna
// 第 2 个人叫 Alex
// 第 3 个人叫 Brian
// 第 4 个人叫 Jack

// 注意: 数组有4个元素, 但 0..count 只数到 3 (最后一个元素的下标), 因为它是半闭区间. 关于数组, 请查阅Arrays.


// 10. Logic Operators 逻辑运算
  // 逻辑运算的操作对象是逻辑布尔值. Swift支持基于C语言的三个标准逻辑运算.
/*
逻辑非 ！a
逻辑与 a&&b
逻辑或 a||b
*/


// 10.1 Logical NOT Operator 逻辑非
  // 逻辑非运算 !a 对一个布尔值取反, 使得 true 变 false, false 变 true.

let allowedEntry = false
if !allowedEntry { //逻辑非 ！a  Logical NOT Operator
    println("ACCESS DENIED")
}

//if !allowedEntry语句可以读作 "如果 非 allowed entry.", 接下一行代码只有在如果 "非 allow entry" 为 true, 即 allowEntry 为 false 时被执行.

// 在示例代码中, 小心地选择布尔常量或变量有助于代码的可读性, 并且避免使用双重逻辑非运算, 或混乱的逻辑语句.



// 10.2 Logical AND Operator 逻辑与
  // 逻辑与 a && b 表达了只有 a 和 b 的值都为 true 时, 整个表达式的值才会是 true .

// 只要任意一个值为 false, 整个表达式的值就为 false. 事实上, 如果第一个值为 false, 那么是不去计算第二个值的, 因为它已经不可能影响整个表达式的结果了. 这被称做 "短路计算".

// 以下例子, 只有两个值都为值的时候才允许进入:
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan { //逻辑与 a&&b Logical AND Operator
    println("Wellcome!")
} else {
    println("Access Denied")
}
// 输出 "ACCESS DENIED 


// 10.3 Logical OR Operator 逻辑或
  // 逻辑或 a || b 是一个由两个连续的 | 组成的中置运算符. 它表示了两个逻辑表达式的其中一个为 true, 整个表达式就为 true.

// 同逻辑与运算类似, 逻辑或也是"短路计算"的, 当左端的表达式为 true 时, 将不计算右边的表达式了, 因为它不可能改变整个表达式的值了.

// 以下示例代码中, 第一个布尔值 hasDoorKey 为 false, 但第二个值 knowsOverridePassword 为 true, 所以整个表达是 true, 于是允许进入:

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword { //逻辑或 a||b Logical OR Operator
    println("Welcome!")
} else {
    println("Accessed Denied")
}
// 输出 "Welcome!" 


// 10.4 Combining Logical Operators 组合逻辑
  // 我们可以组合多个逻辑运算来表达一个复合逻辑:
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    println("Welcome!")
} else {
    println("Access Denied")
}
// 输出 "Welcome!" 

/*
这个例子使用了含多个 && 和 || 的复合逻辑. 但无论怎样, && 和 || 始终只能操作两个值. 所以这实际是三个简单逻辑连续操作的结果. 我们来解读一下:

如果我们输入了正确的密码并通过了视网膜扫描; 或者我们有一把有效的钥匙; 又或者我们知道紧急情况下重置的密码, 我们就能把门打开进入.

前两种情况, 我们都不满足, 所以前两个简单逻辑的结果是 false, 但是我们是知道紧急情况下重置的密码的, 所以整个复杂表达式的值还是 true.
*/



// 10.5 Explicit Parentheses 使用括号来明确优先级
  // 为了一个复杂表达式更容易读懂, 在合适的地方使用括号来明确优先级是很有效的, 虽然它并非必要的. 在上个关于门的权限的例子中, 我们给第一个部分加个括号, 使用它看起来逻辑更明确.
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    println("welcome!")
} else {
    println("Access Denied")
}

// 这括号使得前两个值被看成整个逻辑表达中独立的一个部分. 虽然有括号和没括号的输出结果是一样的, 但对于读代码的人来说有括号的代码更清晰.

// 可读性比简洁性更重要, 请在可以让你代码变清晰地地方加个括号吧!
























