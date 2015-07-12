// Playground - noun: a place where people can play

import UIKit

// 1. Strings and Characters 字符串和字符
/*
String 是一个有序的字符集合，例如 "hello, world", "albatross"。Swift 字符串通过 String 类型来表示，也可以表示为 Character 类型值的集合。

Swift 的 String 和 Character 类型提供了一个快速的，兼容 Unicode 的方式来处理代码中的文本信息。创建和操作字符串的语法与 C的操作方式相似，轻量并且易读。字符串连接操作只需要简单地通过 + 号将两个字符串相连即可。与 Swift 中其他值一样，能否更改字符串的值，取决于其被定义为常量还是变量。

尽管语法简易，但 String 类型是一种快速、现代化的字符串实现。每一个字符串都是由独立编码的 Unicode 字符组成，并提供了用于访问这些字符在不同Unicode表示的支持。

String也可以用来在长字符串中插入常量、变量、字面量和表达式，这一过程称为字符串插值。这使得创建用于展示、存储和打印的自定义字符串变得轻松自如。


注意：Swift 的 String 类型与 Foundation NSString 类进行了无缝桥接。如果您利用 Cocoa 或 Cocoa Touch 中的 Foundation 框架进行工作，整个 NSString API 都可以调用您创建的任意 String 类型的值，除了本章介绍的String特性。您也可以在任意要求传入NSString 实例作为参数的 API 中使用 String 类型的值进行替换。

更多关于在 Foundation 和 Cocoa 中使用 String 的信息请查看 Using Swift with Cocoa and Objective-C。
*/



// 2. String Literals 字符串字面量
// 您可以在您的代码中包含一段预定义的字符串值作为字符串字面量。字符串字面量是由双引号("")包裹着的具有固定顺序的文本字符。

// 字符串字面量可以用于为常量和变量提供初始值。
let someString = "Some string literal value"
//注意：someString 常量通过字符串字面量进行初始化，Swift 因此推断其为 String 类型。
// 注意：更多有关字符串字面量的特殊字符请参考Special Unicode Characters in Strings Literals.

let wiseWords = "\"Imagination is more important than knowledge\""



// 3. Initializing an Empty String 初始化空字符串
  // 为了构造一个很长的字符串，可以创建一个空字符串作为初始值。可以将空的字符串字面量赋值给变量，也可以初始化一个新的 String 实例：

var emptyString = "" // empty string literal

var anotherEmptyString = String() // initializer syntax
// 这两个字符串都为空，并且两者等价， 注意是空，不是nil。

// 您可以通过检查其 Boolean 类型的 isEmpty 属性来判断该字符串是否为空：
if emptyString.isEmpty {  // isEmpty 是Boolean类型的属性
    println("Nothing to see here")
}
// prints "Nothing to see here"



// 4. String Mutability 字符串可变性
  // 您可以通过将一个特定字符串分配给一个变量（对其进行修改）或者常量（保证其不会被修改）来指定该字符串是否可以被修改：
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"



/*   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
let constantString = "Highlander"
constantString += " and another Highlanderinvoke" 
// 这会报告一个编译错误(compile-time error) -- 常量不可以被修改
*/

// 注意：在 Objective-C 和 Cocoa 中，您通过选择两个不同的类( NSString 和 NSMutableString )来指定该字符串是否可以被修改，Swift中的字符串是否可以修改仅通过定义的是变量还是常量来决定，实现了多种类型可变性操作的统一。


// 5. Strings Are Value Types 字符串是值类型
  //Swift 的 String 类型是值类型。如果您创建了一个新的字符串值，那么当其进行常量、变量赋值操作或在函数/方法中传递时，会进行值拷贝。在不同情况下，都会对已有字符串值创建新副本，并对该新副本进行传递或赋值。值类型在 Structures and Enumerations Are Value Types 中进行了说明。
// 注意：和Cocoa 中的 NSString 不同，当您在 Cocoa 中创建了一个 NSString 实例，并将其传递给一个函数/方法，或者赋给一个变量，您永远都是传递或赋值同一个 NSString 实例的一个引用。除非您特别要求其进行值拷贝，否则字符串不会进行赋值新副本操作。

// Swift 默认字符串拷贝的方式保证了在函数/方法中传递的是字符串的值，其明确您独有该字符串的值，无论它来自哪里。您可以放心您传递的字符串本身不会被更改，除非是你自己更改它。

// 在实际编译时，Swift编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您始终可以将字符串作为值类型的同时获得极高的性能。



// 6. Working with Characters使用字符
  // Swift 的 String 类型表示特定序列的字符值的集合。每一个字符值代表一个 Unicode 字符。您可利用 for-in 循环来遍历字符串中的每一个字符：
for character in "Dog!🐶" {
    println(character)
}
// D
// o
// g
// !
// 🐶
// for-in 循环在For Loops中进行了详细描述。

// 另外，通过标明一个 Character 类型注解并通过字符字面量进行赋值，可以建立一个独立的字符常量或变量：
let yenSing: Character = "¥"




// 7. Concatenating Strings and Characters 连接字符串和字符
  // 符串和字符的值可以通过加法运算符 (+) 相加在一起并创建一个新的字符串值:

let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"

// 也可以通过加法赋值运算符 (+=) 将一个字符串或者字符添加到一个已经存在字符串变量上:
var instruction = "look over"
instruction += string2
// instruction now equals "look over there"

// 你可以用字符类型的append方法将一个字符连接到一个字符串变量
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome now equals "hello there!"


// 注意:您不能将一个String字符串或者Character字符添加到一个已经存在的Character字符变量上,因为Character字符变量只能包含一个字符。



// 8. String Interpolation 字符串插值
  // 字符串插值是一种全新的构建字符串的方式，可以在其中包含常量、变量、字面量和表达式。您插入的字符串字面量的每一项都被包裹在以反斜线为前缀的圆括号中：
let multiplier = 3

let message = "\(multiplier) times 2.5 is \"\(Double(multiplier) * 2.5)\""
// message is "3 times 2.5 is 7.5"

// 在上面的例子中，multiplier 作为 \(multiplier) 被插入到一个字符串字面量中。当创建字符串执行插值计算时此占位符会被替换为 multiplier 实际的值。

// multiplier 的值也作为字符串中后面表达式的一部分。该表达式计算 Double(multiplier) * 2.5 的值并将结果 (7.5) 插入到字符串中。在这个例子中，表达式写为 \(Double(multiplier) * 2.5) 并包含在字符串字面量中。

//  注意：您插值字符串中写在括号中的表达式不能包含非转义双引号 (") 和反斜杠 (\)，并且不能包含回车或换行符。



// 9. Unicode
  // Unicode 是文本编码和表示的国际标准。它使您可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。

// Swift 的字符串和字符类型是完全兼容 Unicode 的，它支持如下所述的一系列不同的 Unicode 编码。


// 9.1 Unicode Scalars  -- Unicode 标量
  // 在后台，Swift的原生String 类型是从Unicode scalar值来构建的。对于每个字符或者modifier，一个Unicode标量是唯一的一个21位数字，例如U+0061对应LATIN SMALL LETTER A("a")，又例如U+1F425对应FRONT-FACING BABY CHICK("🐥")
// 注意： Unicode标量的代码点是从U+0000到U+D7FF，或者从U+E000到U+10FFFF。但是Unicode标量不包括从U+D800到U+DFFF的surrogate pair代码点。
// 注意并不是全部21位的Unicode标量都是分配给一个字符，某些保留给将来使用。标量如果被分配给一个字符的话，它一定有名字，例如上面例子的LATIN SMALL LETTER A和FRONT-FACING BABY CHICK。


// 9.2 Special Unicode Characters in String Literals 字符串字面量中的特殊Unicode字符

/*
字符串字面量可以包含以下特殊字符：
1.转义特殊字符 \0 (空字符)、\\(反斜线)、\t (水平制表符)、\n (换行符)、\r (回车符)、\" (双引号)、\' (单引号)。
2. Unicode 标量，写成 \U{n}，其中 n 为1~8s位十六进制数。
*/

var string_1 = "\0"  // null characters

var string_2 = "\\"  // backslash

var string3 = "\t"  // horizontal tab

var string4 = "\n" // line feed

var string5 = "\r" //carriage return

var string6 = "\"" // double quote

var string7 = "\'" // single quote

//下面代码展示了4个特殊字符的例子：

let wiseWords2 = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein

let dollarSign = "\u{24}"    // $,  Unicode scalar U+0024

let blackHeart = "\u{2665}"   // ♥,  Unicode scalar U+2665

let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496”



// 9.3 Extended Grapheme Clusters 扩展字符群
  // 每一个Swift中Character类型的实例都代表一个单独的扩展字符群。 一个扩展字符群由一系列的一个或多个Unicode标量（结合）所产生的单独可读的字符。

// 例如字母é可以由独立的Unicode标量é（LATIN SMALL LETTER E WITH ACUTE, or U+00E9）来代表，也可以用一对标量来表达-- e（LATIN SMALL LETTER E，or U+0065）和 COMBINING ACUTE ACCENT标量（U+0301）。 
// 两种情况下，é 既可以由独立的Swift Character值来表示，也可以用扩展字符群来表示。第一种情况这个群只包含一个标量，而第二种情况包含两个标量。
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é


// 扩展字符群可以用一种灵活的方式来展现由多种复杂子字符组合的独立Character值。例如，韩语字节既可以用预设的字节序列来显示，也可以用分解的字节序列来显示。 两种展现方式在Swift都能成为一个独立的Character值。
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한”


// 扩展字符群允许包围性符号标量（例如 COMBINING ENCLOSING CIRCLE, or U+20DD）去包围其他Unicode标量作为一部分来表达一个Character值。
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝”

// 地区指示符的Unicode标量可以组合成一对来构造一个独立的Character值，例如REGIONAL INDICATOR SYMBOL LETTER U (U+1F1FA)和 REGIONAL INDICATOR SYMBOL LETTER S (U+1F1F8)
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸”



// 10. Counting Characters 计算字符数
  // 通过调用全局 countElements 函数，并将字符串作为参数进行传递可以获取该字符串的字符数量。
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
println("unusualMenagerie has \(count(unusualMenagerie)) characters")
// prints "unusualMenagerie has 40 characters” 

// 注意Swift使用扩展字符群来连接字符和修改字符不一定影响字符串中字符的数量。

// 例如，你初始化一个新的字符串并赋值为cafe，然后加上COMBINING ACUTE ACCENT(U+0301),结果这个字符串的数量还是4，只是第四个字符变成了é而不是e。

var word = "cafe"
println("the number of characters in \(word) is \(count(word))")

word += "\u{301}"

println("the number of characters in \(word) is \(count(word))")

/*
注意：

1.不同的 Unicode 字符以及相同 Unicode 字符的不同表示方式可能需要不同数量的内存空间来存储，所以Swift 中的字符在一个字符串中表示并不一定占用相同的内存空间。因此，字符串的长度不得不通过迭代字符串中每一个字符的长度来进行计算。如果您正在处理一个长字符串，需要注意 countElements 函数必须遍历字符串中的字符，以精准计算字符串的长度。

2.另外需要注意的是通过 countElements 返回的字符数量并不总是与包含相同字符的 NSString 的 length 属性相同。NSString 的 length 属性是基于利用 UTF-16 表示的十六位code units数目，而不是基于 Unicode 字符。为了解决这个问题，NSString 的 length 属性在被 Swift的 String值访问时会被称为utf16count。
*/


// 11. Accessing and Modifying a String
// 访问和修改某个string，要通过string的方法和属性，或者用下标语法

// 11.1 String Indexes 字符串索引

/*
每个String值都有一个与之关联的索引类型,String.Index,它相当于字符串所包含的每个字符的位置。

如上所说， 不同的字符存储所需的内存数是不同的， 所以为了确定哪个字符在哪个具体位置，你一定要遍历字符串从开始或结束的每个unicode标量。正因如此，Swift字符串不能被整形值索引。

用startIndex属性来访问一个字符串的第一个字符位置，而endIndex属性返回该字符串传来的最后一个字符的位置，如果String是空的，那么startIndex和endIndex是相同的。

String.Index值可以通过调用predecessor()方法访问它的之前紧邻地的索引，而调用successor()方法来访问之后紧邻的索引。字符串中任何索引值能被其他任何索引访问，通过链接这些方法在一起，或者用全局的advance(start:n:)函数。 尝试访问字符串范围外的索引会触发运行时错误。

你可以用下标语法来访问在一个特定字符串索引值上的字符。 尝试访问在字符串索引范围外的字符也会触发运行时错误。

*/


let greeting = "Guten Tag"
greeting[greeting.startIndex]
// G
greeting[greeting.endIndex.predecessor()]
// g
greeting[greeting.startIndex.successor()]
// u

let index = advance(greeting.startIndex, 7)
greeting[index]

// greeting[greeting.endIndex]  // error

// greeting.endIndex.successor()()  // error

// 用全局函数indices(_:)来创建一系列包含所有索引来访问字符串上各个字符。

for index in indices(greeting) {
    print("\(greeting[index])")
}


// 11.2 Inserting and Removing
// 用insert(_:atIndex:)方法来插入一个字符到一个字符串具体的索引上。

var welcome2 = "hello"
welcome2.insert("!", atIndex: welcome2.endIndex)

// welcome now equals "hello!"

// 用splice(_:atIndex:)方法来插入另外一个字符串到一个字符串的具体索引位置上

welcome2.splice(" there", atIndex: welcome2.endIndex.predecessor())

// 用remove(_:)方法来删除一个字符串上具体索引的一个字符
welcome2.removeAtIndex(welcome2.endIndex.predecessor())
// welcome now equals "hello there"

// 用removeRange(_:) 方法来删除具体索引范围里的一个子字符串

let range = advance(welcome2.endIndex, -6)..<welcome2.endIndex
welcome2.removeRange(range)
// welcome now equals "hello"


// 12. Comparing Strings比较字符串
  //Swift 提供了三种方式来比较字符串的值：字符串相等，前缀相等和后缀相等。


// 12.1 String and Character Equality 字符串相等
// 如果两个字符串以同一顺序包含完全相同的字符，则认为两者字符串相等，相等用==，不等用!=
let quotation = "We're a lot alike, you and I."

let sameQuotation  = "We're a lot alike, you and I."

if quotation == sameQuotation {
    println("These two strings are considered equal")
}


// 如果字符串或字符的扩展字符群是统一码等价的，那么这个两个字符串值（或两个字符值）是相等的。 而扩展字符群的语言意思和外形都是一样的，那么我们就说这两个扩展字符群就是统一码等价的，即使他们由不同的Unicode标量来组成。
// 例如LATIN SMALL LETTER E WITH ACUTE（U+00E9）和 由 LATIN SMALL LETTER E 加上 COMBINING ACUTE ACCENT（U+0301）是统一码等价的。两组扩展字符群都有效的表达了字符é， 所以他们是被看做统一码等价的。


// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    println("These two strings are considered equal")
}
// prints "These two strings are considered equal”


// 相反地，英语中的LATIN CAPITAL LETTER A(U+0041, or "A")跟俄语中的CYRILLIC CAPITAL LETTER A(U_0410,or "A")是不相等的，尽管他们字符看起来很像，但是他们有不同的语义。
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    println("These two characters are not equivalent")
}
// prints "These two characters are not equivalent”

// 注意： 字符串和字符的比较在Swift不是地域敏感的。



// 12.2 Prefix and Suffix Equality 前缀/后缀相等
// 通过调用字符串的 hasPrefix/hasSuffix 方法来检查字符串是否拥有特定前缀/后缀。两个方法均需要以字符串作为参数传入并返回 Boolean 值。两个方法均执行基本字符串和前缀/后缀字符串之间逐个字符的比较操作。
// 下面的例子以一个字符串数组表示莎士比亚话剧《罗密欧与朱丽叶》中前两场的场景位置：
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

// 您可以利用 hasPrefix 方法使用romeoAndJuliet数组来计算话剧中第一幕的场景数：
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        ++act1SceneCount
    }
}

println("There are \(act1SceneCount) scenes in Act 1")
// prints "There are 5 scenes in Act 1"


// 同样，可使用hasSuffix方法来计算发生在Capulet公馆和Lawrence牢房内以及周围的场景数。
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}

println("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// prints "6 mansion scenes; 2 cell scenes" 

// 注意： 如String and Character Equality里所说，hasPrefix和hasSuffix方法是通过用扩展字符群统一码等价比较逐个逐个比较每个字符串或字符里的扩展字符群。



// 13. Unicode Representations of Strings 字符串的 Unicode 表示
// 当 Unicode 字符串被写进文本文件或其他存储结构当中，这些 unicode 标量将会按照 Unicode 定义的集中格式之一进行编码。每个格式将字符串编码为小的代码块-code units，其包括UTF-8格式(以8位代码单元进行编码)和UTF-16格式(以16位代码单元进行编码),还有UTF-32格式(以32位代码单元进行编码)。兼容 Unicode 的，它支持如下所述的一系列不同的 Unicode 编码。

// Swift 提供了几种不同的方式来访问字符串的 Unicode 表示。
// 您可以利用 for-in 来对字符串进行遍历，从而以 Unicode 字符的方式访问每一个字符值。该过程在 Working with Characters 中进行了描述。
/*
另外，能够以其他三种 Unicode 兼容的方式访问字符串的值：
1.UTF-8 代码单元集合 (利用字符串的 utf8 属性进行访问)
2.UTF-16 代码单元集合 (利用字符串的 utf16 属性进行访问)
3.21位的 Unicode 标量值集合, 等同于UTF-32格式(利用字符串的 unicodeScalars 属性进行访问)
*/

// 下面由 D,o,g !!(DOUBLE EXCLAMATION MARK, or Unicode标量为U+203C) 和字符(DOG FACE，Unicode 标量为 U+1F436)组成的字符串中的每一个字符代表着一种不同的表示：
let dogString = "Dog‼🐶"


// 13.1 UTF-8 Representation
// 您可以通过遍历字符串的 utf8 属性来访问它的 UTF-8 表示。其为 UTF8View 类型的属性，UTF8View 是无符号8位 (UInt8) 值的集合，每一个 UIn8 都是一个字符的 UTF-8 表示：
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")  //为何是print而不是println？
}
print("\n")
// 68 111 103 226 128 188 240 159 144 182”

// 上面的例子中，前四个10进制codeUnit值 (68, 111, 103, 33) 代表了字符 D o g 和 ‼ ，他们的 UTF-8 表示与其ASCII 表示相同。后四个codeUnit值 (240, 159, 144, 182) 是DOG FACE字符的4位UTF-8表示。


// 13.2 UTF-16 Representation
// 您可以通过遍历字符串的 utf16 属性来访问它的 UTF-16 表示。其为 UTF16View 类型的属性，是UTF16View 是无符号16位 (UInt16) 值的集合，每一个 UInt16 都是一个字符的 UTF-16 表示：

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}
print("\n")
// 68 111 103 8252 55357 56374”
// 同样，前三个codeUnit值 (68, 111, 103) 代表了字符 D o g ，他们的 UTF-16 code units值和 UTF-8 表示完全相同。
// 第四个codeUnit值 （8252）等于十六进制里的203C，代表了Unicode标量为U+203C的DOUBLE EXCLAMATION MARK ‼。

// 第五和第六个codeUnit值 (825255357 and 56374) 是 DOG FACE字符的UTF-16 表示。第一个值为 U+D83D (十进制值为 55357)，第二个值为 U+DC36 (十进制值为 56374)。


// 13.3 Unicode Scalar Representation -- Unicode 标量表示
// 您可以通过遍历字符串的 unicodeScalars 属性来访问它的 Unicode 标量表示。其为 UnicodeScalarView 类型的属性， UnicodeScalarView 是 UnicodeScalar 的集合。一个Unicode Scalar是任意的21位的 Unicode 代码点。
// 每一个 UnicodeScalar 拥有一个值属性，可以返回对应的21位数值，用 UInt32值来表示。
for scalar in dogString.unicodeScalars {
    print("\(scalar.value)")
}
print("\n")
// 68 111 103 8252 128054”
// 同样，前四个UnicodeScalar值 (68, 111, 103, 33) 再次代表了字符D, o, g和 ! 。第五个也是最后一个UnicodeScalar的值属性为128054，是一个十六进制1F436的十进制表示。其等同于DOG FACE 字符的Unicode 标量 U+1F436。


// 作为查询字符值属性的一种替代方法，每个 UnicodeScalar 值也可以用来构建一个新的字符串值，比如在字符串插值中使用：
for scalar in dogString.unicodeScalars {
    println("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶”











