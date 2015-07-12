// Playground - noun: a place where people can play

import UIKit

// 1. Collection Types 集合类型 
/*
Swift语言提供经典的数组和字典两种集合类型来存储集合数据。数组用来按顺序存储相同类型的数据。字典虽然无序存储相同类型数据值但是需要由独有的标识符引用和寻址（就是键值对）。


Swift语言里的数组和字典中存储的数据值类型必须明确。 这意味着我们不能把不正确的数据类型插入其中。 同时这也说明我们完有信心对获取出值类型。 Swift对显式类型集合的用法确保了我们的代码清楚对工作所需要的类型，也让我们在开发中可以早早地找到任何的类型不匹配错误。

注意： Swift的数组和字典类型是以generic collection（泛型集合）方式来实现的。 获取更多信息请参见Generics的generic types and collections。
*/



// 2. Mutability of Collections  集合的可变性
  // 如果你创建一个数组或字典并赋给一个变量， 那么这类集合创建时就是可修改的。这意味着创建完后，你可以通过添加、删除或更改集合的元素来刚改（或修改）这个集合。相反， 如果你创建时是赋给一个常量，那么这个数组或字典就是不可改变的，并且大小和内容都不能更改。

// 注意：如果集合是不需要修改的话，那么创建不可修改的集合是推荐的。这样做可以让Swift编译器去优化你所创建的集合。

    
// 3. Arrays  数组
  /*
数组使用有序列表存储相同类型的多重数据。相同的值可以多次出现在一个数组的不同位置中。

Swift数组对存储数据有具体要求。 不同于 Objective-C的NSArray和NSMutableArray类，他们可以存储任何类型的实例而且不提供他们返回对象的任何本质信息。 在 Swift 中，数据值在被存储进入某个数组之前类型必须明确，方法可以通过显式的类型标注或类型推断来获得，而且不能是class类型。例如： 如果我们创建了一个Int值类型的数组，我们不能往其中插入任何不是Int类型的数据。 Swift 中的数组是类型安全的，并且必须明确它们中包含的类型。
*/


// 3.1. Array Type Shorthand Syntax  数组类型简写语法
  // Swift数组类型完整写法是Array<SomeType>, SomeType指定数组存放数据类型。 你也可以简写为[SomeType]来定义数组的类型。 尽管两种形式在功能上是一样的， 但是我们推荐较短的那种，而且在本文中都会使用这种形式来使用数组。


// 3.2. Array Literals 数组字面量
  // 我们可以使用字面语句来进行数组构造，这是一种用一个或者多个数值构造数组的简单方法。字面语句是一系列由逗号分割并由方括号包含的数值。 [value 1, value 2, value 3]。
// 下面这个例子创建了一个叫做shoppingList并且存储字符串的数组：
var shoppingList_1: [String] = ["Eggs","Milk"]
// shoppingList 已经被构造并且拥有两个初始项


// shoppingList变量被声明为“字符串值类型的数组“，记作[String]。 因为这个数组被规定只有String一种数据结构，所以只有String类型可以在其中被存取。 在这里，shoppinglist数组由两个String值（"Eggs" 和"Milk"）构造，并且由字面语句定义。

// 注意： Shoppinglist数组被声明为变量（var关键字创建）而不是常量（let创建）是因为以后可能会有更多的数据项被插入其中。

// 在这个例子中，字面语句仅仅包含两个String值。匹配了该数组的变量声明（只能包含String的数组），所以这个字面语句的分配过程就是允许用两个初始项来构造shoppinglist。

// 由 于Swift 的类型推断机制，当我们用字面语句构造只拥有相同类型值数组的时候，我们不必把数组的类型定义清楚。 shoppinglist的构造也可以这样写：
var shoppingList =  ["Eggs", "Milk"]
// 因为所有字面语句中的值都是相同的类型，Swift 可以推断出String[]是shoppinglist中变量的正确类型。




// 3.3. Accessing and Modifying an Array 访问和修改数组
// 我们可以通过数组的方法和属性来访问和修改数组，或者下标语法。 还可以使用数组的只读属性count来获取数组中的数据项数量。

    // 数组count属性,求数组个数
println("The shopping list contains \(shoppingList.count) items.")
// 打印出"The shopping list contains 2 items."（这个数组有2个项）


// 使用布尔项isEmpty属性来作为检查count属性的值是否为0。
    // isEmpty属性，判断数组是否为空
if shoppingList.isEmpty {
    println("The shopping list is empty.")
} else {
    println("The shopping list is not empty.")
}
// prints "The shopping list is not empty."


// 也可以使用append方法在数组后面添加新的数据项：
    //append 属性, 增加数组元素
shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes”

println("\(shoppingList.count)")


// 除此之外，使用加法赋值运算符（+=）也可以直接在数组后面添加数据项：
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items”
println("\(shoppingList.count)")

// 我们也可以使用加法赋值运算符（+=）直接添加拥有相同类型数据的数组。
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items”
println("\(shoppingList.count)")


// 可以直接使用下标语法来获取数组中的数据项，把我们需要的数据项的索引值放在直接放在数组名称的方括号中：
var firstItem = shoppingList[0] // firstItem is equal to "Eggs"
// 注意第一项在数组中的索引值是0而不是1。 Swift 中的数组索引总是从零开始。
// 我们也可以用下标来改变某个已有索引值对应的数据值：
shoppingList[0] = "Six eggs"// the first item in the list is now equal to "Six eggs" rather than "Eggs"

// 还可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的。下面的例子把"Chocolate Spread"，"Cheese"，和"Butter"替换为"Bananas"和 "Apples"：
shoppingList[4...6] = ["Bananas", "Apples"]
//“// shoppingList now contains 6 items”

println("\(shoppingList.count)")
// 注意： 我们不能使用下标语法在数组尾部添加新项。如果我们试着用这种方法对索引越界的数据进行检索或者设置新值的操作，我们会引发一个运行期错误。我们可以使用索引值和数组的count属性进行比较来在使用某个索引之前先检验是否有效。除了当count等于0时（说明这是个空数组），最大索引值一直是count - 1，因为数组都是零起索引。


for i in 0..<shoppingList.count {
    var item = shoppingList[i]
    println(item)
}


// 调用数组的 insert(atIndex:)方法来在某个具体索引值之前添加数据项

shoppingList.insert("Maple syrup", atIndex: 0)

firstItem = shoppingList[0]
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list”
// 这次insert函数调用把值为"Maple Syrup"的新数据项插入shopping列表的最开始位置，并且使用0作为索引值。


//类似的我们可以使用 removeAtIndex 方法来移除数组中的某一项。这个方法把数组在特定 索引值中存储的数据项移除并且返回这个被移除的数据项
let mapleSyrup = shoppingList.removeAtIndex(0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string”

// 数据项被移除后数组中的空出项会被自动填补，所以现在索引值为0的数据项的值再次等于"Six eggs":
firstItem = shoppingList[0]
// firstItem is now equal to "Six eggs”

// 如果我们只想把数组中的最后一项移除,可以使用 removeLast 方法而不是 removeAtIndex方法来避免我们需要获取数组的 count 属性。

let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no apples
// the apples constant is now equal to the removed "Apples" string”




// 3.4. Iterating Over an Array  数组的遍历
// 我们可以使用for-in循环来遍历所有数组中的数据项：
for item in shoppingList {
    println(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas”


//如果我们同时需要每个数据项的值和索引值,可以使用全局 enumerate 函数来进行数组遍 历。enumerate 返回一个由每一个数据项索引值和数据值组成的键值对组。我们可以把这个 键值对组分解成临时常量或者变量来进行遍历:
for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1)： \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas”

// 更多关于for-in循环的介绍请参见For Loops。



// 3.5. 创建并构造一个数组 Creating and Initializing an Array
  // 我们可以使用构造语法来创建一个由特定数据类型构成的空数组：
var someInts = [Int]()
println("someInts is of type [Int] with \(someInts.count) items.")
//注意 someInts 被设置为一个 Int[]构造函数的输出所以它的变量类型被定义为 Int[]

//除此之外，如果代码上下文中提供了类型信息， 例如一个函数参数或者一个已经定义好类型的常量或者变量，我们可以使用空数组语句创建一个空数组，它的写法很简单：[]（一对空方括号）：
someInts.append(3)
// someInts now contains 1 value of type Int”
someInts = []
// someInts is now an empty array, but is still of type [Int]”

// Swift 中的Array类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法。我们可以把准备加入新数组的数据项数量（count）和适当类型的初始值（repeatedValue）传入数组构造函数：
var threeDoubles = [Double] (count: 3, repeatedValue: 0.0)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]”

// 因为类型推断的存在，我们使用这种构造方法的时候不需要特别指定数组中存储的数据类型，因为类型可以从默认值推断出来：
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
// anotherThreeDoubles is inferred as [Double], and equals [2.5, 2.5, 2.5]”

// 最后，我们可以使用加法操作符（+）来组合两种已存在的相同类型数组。新数组的数据类型会被从两个数组的数据类型中推断出来：
var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]”
println(sixDoubles[4])


// 4. Sets
    // Set 存储一个集合里同一类型的不同值（无排序的）。你可以将sets看作为数组的替代方式，而且item的排序是无关紧要的，又或者只需要每个item只出现一次。

// 注意： Swift 的set 类型是跟框架的NSSet类桥接的。更多有Foundation和 Cocoa 中Set的使用，请看Using Swift with Cocoa and Objective-C.



// 4.1 Set Type Syntax  Set类型语法

// Swift中Set类型写作为 Set<SomeType>,  SomeType 是指被set 存储的类型。 跟数组不一样， sets没有相似的便捷的形式。


// 4.2 Creating and Initializing a Set  创建并初始化一个Set
// 使用构造器语法来创建一个某种类型的空set：

var letters = Set<Character>()
println("letters is of type Set<Character> with \(letters.count) items.")
// prints "letters is of type Set<Character> with 0 items.

// 注意： 从构造器的类型，letters的类型被推断为Set<Character>类型。

// 或者，如果上下文已经提供了类型信息， 例如一个函数参数或者一个已经类型化的变量或常量， 那么你可以创建一个空的set，带上一个空的的数组字面量。

letters.insert("a")
// letters now contains 1 value of type Character
letters = []
// letters is now an empty set, but is still of type Set<Character>


// 4.3 Sets with Array Literals  带数组字面量的Sets

// 像快捷方式去写带一个或多个值的Set集，你也可以去初始化一个带数组字面量的set

// 下面的例子创建一个set叫favoriteGenres来存储String值：

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items

// favoriteGenres变量被声明为字符串set，类型为Set<String>。 因为这个特殊的set拥有具体的String类型，所以它只能存放String值。这个favoriteGenres set是被初始化为一个数组字面量，带有"Rock", "Classical", "Hip hop"三个字符串。
// 注意：favoriteGenres set声明时是用var而不用let是因为下面的例子要增删items。

// set类型不能从单单的数组字面量被推断为set，所以必须使用Set来声明set类型。然而，因为Swift的类型推断机制，如果你要初始化一个数组字面量并当中包含同样数据类型的值，那就不需要在set后添加数据类型。favoriteGenres的初始化可以简写为：
var favoriteGenres_2: Set = ["Rock", "Classical", "Hip hop"]

// 因为在数组字面量的所有值都是同一种类型，Swift可以推断Set<String> 就是favoriteGenres的正确使用类型。



// 4.4 Accessing and Modifying a Set 访问或修改Set

// 你可以通过set的方法和属性来访问和修改一个set。

// 要算出一个set的items个数，用它的只读属性count：

println("I have \(favoriteGenres.count) favorite music genres.")
// prints ""I have 3 favorite music genres.

// 使用Boolean布尔 isEmpty属性作为一种快捷方式检查count属性是否为0：
if favoriteGenres.isEmpty {
    println("As far as music goes, I'm not picky.")
} else {
    println("I have particular music preferences.")
}
// prints "I have particular music preferences."

//  你可以通过调用set的insert(_:)方法来插入一个新的item。

favoriteGenres.insert("Jazz")
// favoriteGenres now contains 4 items.

// 想删除一个set的某个item，你可以通过调用set的remove(_:)方法来 -- 删除某个item如果这个item是这个set的成员，并且返回删除的值，或者但会nil如果set没有这个item。 或者， 通过removeAll()方法来删除某个set里的所有item。


if let removedGenre = favoriteGenres.remove("Rock") {
    println("\(removedGenre)? I'm over it.")
} else {
    println("I never much cared for that.")
}
// prints "Rock? I'm over it."

// 想检查某个set是否含有特定item， 用contains(_:)方法

if favoriteGenres.contains("Funk") {
    println("I get up on the good foot.")
} else {
    println("It's too funky in here.")
}
// println("It's too funky in here.")


// 4.5 Iterating Over a Set  遍历Set

// 你可以用 for-in循环来遍历set里的所有值。

for genre in favoriteGenres {
    println("\(genre)")
}
// Classsical
// Jazz
// Hip hop

// 更多有关for-in循环，see For Loops.

// Swift的Set类型没有预设的顺序。 想遍历set并以特定顺序，使用全局sorted函数，它将根据提供的序列返回一个排序的集合。

for genre in sorted(favoriteGenres) {
    println("\(genre)")
}
// Classical
// Hip hop
// Jazz



// 5. Performing Set Operations  完成sSet操作

// 你可以高效的完成set的一些基本操作， 比如把两个set组合到一起， 判断两个set共有元素，或者判断两个集合是否全包含，部分包含或者不相交。

// 5.1 Constructing Sets  构建Set

// 下面的插图描述了两个集合-a和b-以及通过阴影部分的区域显示集合各种操作的结果。

/*
使用union(_:)方法根据两个集合的值创建一个新的集合。
使用subtract(_:)方法根据不在该集合中的值创建一个新的集合。
使用intersect(_:)方法根据两个集合中都包含的值创建的一个新的集合。
使用exclusiveOr(_:)方法根据值在一个集合中但不在两个集合中的值创建一个新的集合。
*/

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]
sorted(oddDigits.union(evenDigits))
// [0,1,2,3,4,5,6,7,8,9]

sorted(oddDigits.intersect(evenDigits))
// []

sorted(oddDigits.subtract(singleDigitPrimeNumbers))
// [1, 9]

sorted(oddDigits.exclusiveOr(singleDigitPrimeNumbers))
// [1, 2, 9]


// 5.2 Comparing Sets  对比Set
// 下面的插图描述了三个集合-a,b和c,以及通过悬浮区域表述集合间共享的元素。Set a是Set b的父集合，因为a包含了b中所有的元素，相反的，Set b是a的子集合，因为属于b的元素也被a包含。Set b和Set c彼此不关联，因为它们之间没有共同的元素。

/*
o 使用“是否等”运算符(==)来判断两个集合是否包含相同的值。
o 使用isSubsetOf(_:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
o 使用isSupersetOf(_:)方法来判断一个集合中包含的值是另一个集合中所有的值。
o 使用isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且和特定集合不相等。
o 使用isDisjointWith(_:)方法来判断两个结合是否不含有任何相同的值。
*/
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubsetOf(farmAnimals)
// true
farmAnimals.isSupersetOf(houseAnimals)
// true
farmAnimals.isDisjointWith(cityAnimals)
// true


// 5.3 Hash Values for Set Types   Set类型的Hash值
/*
为了存储在集合中，该类型必须是可哈希化的-也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是Int类型的，它和其他的对象相同，其被用来比较相等与否，比如a==b,它遵循的是a.hashValue == b.hashValue。

Swift的所有基本类型(比如String,Int,Double和Bool)默认都是可哈希化的，它可以作为集合的值或者字典的键值类型。没有关联值的枚举成员值(在枚举部分有讲述)默认也是可哈希化的。

*/

/* 注意 你可以使用你自定义的类型作为集合的值或者是字典的键值类型，但你需要使你的自定义类型服从Swift标准库中的Hashable协议。服从Hashable协议的类型需要提供一个类型为Int的取值访问器属性hashValue。这个由类型的hashValue返回的值不需要在同一程序的不同执行周期或者不同程序之间保持相同。 因为hashable协议服从于Equatable协议，所以遵循该协议的类型也必须提供一个"是否等"运算符(==)的实现。这个Equatable协议需要任何遵循的==的实现都是一种相等的关系。也就是说，对于a,b,c三个值来说，==的实现必须满足下面三种情况：
    a==a(自反性)
    a==b意味着b==a(对称性)
    a==b&&b==c意味着a==c(传递性)
    关于协议遵循的更多信息，请看Protocols
*/


// 6. 字典 Dictionaries
/*
字典是一种存储相同类型多重数据的存储器。每个值（value）都关联独特的键（key），键作为字典中的这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。

注意： Swift 的字典使用时需要具体规定可以存储键和值类型。不同于 Objective-C 的NSDictionary和NSMutableDictionary 类可以使用任何类型的对象来作键和值并且不提供任何关于这些对象的本质信息。在 Swift 中，在某个特定字典中可以存储的键和值必须提前定义清楚，方法是通过显性类型标注或者类型推断。


*/


// 6.1.  Dictionary Type Shorthand Syntax 字典类型速写语法
//定义字典的完整写法是Dictionary<Key,Value>, ,其中Key是字典中键的数据类型，ValueType是字典中对应于这些键所存储值的数据类型。
// 你可以简写定义字典类型为[Key: Value]。尽管两种形式在功能上是一样的， 但是我们推荐较短的那种，而且在本文中都会使用这种形式来使用字典。




// 6.2.  Dictionary Literals 字典字面语句
/*
我们可以使用字典字面语句来构造字典，他们和我们刚才介绍过的数组字面语句拥有相似语法。一个字典字面语句是一个定义拥有一个或者多个键值对的字典集合的简单语句。

一个键值对是一个key和一个value的结合体。在字典字面语句中，每一个键值对的键和值都由冒号分割。这些键值对构成一个列表，其中这些键值对由方括号包含并且由逗号分割：
[key 1: value 1, key 2: value 2, key 3: value 3]
*/

// 下面的例子创建了一个存储国际机场名称的字典。在这个字典中键是三个字母的国际航空运输相关代码，值是机场名称：
var airports1: [String: String] = ["TYO":"Tokyo", "DUB": "Dublin"]
// airports字典被定义为[String: String]类型,它意味着这个字典的键和值都是String类型。
//注意： airports字典被声明为变量（用var关键字）而不是常量（let关键字）因为后来更多的机场信息会被添加到这个示例字典中。

//airports字典使用字典字面语句初始化，包含两个键值对。第一对的键是TYO，值是Tokyo。第二对的键是DUB，值是Dublin。

// 这个字典语句包含了两个String: String类型的键值对。他们对应airports变量声明的类型（一个只有String键和String值的字典）所以这个字典字面语句是构造两个初始数据项的airport字典。

// 和数组一样，如果我们使用字面语句构造字典就不用把类型定义清楚。airports的也可以用这种方法简短定义：
var airports = ["TYO":"Tokyo", "DUB": "Dublin"]// 推荐这样定义字典
// 因为这个语句中所有的键和值都分别是相同的数据类型，Swift 可以推断出Dictionary是airports字典的正确类型。



// 6.3. Accessing and Modifying a Dictionary 读取和修改字典

// 我们可以通过字典的方法和属性来读取和修改字典，或者使用下标语法。和数组一样，我们可以通过字典的只读属性count来获取某个字典的数据项数量：
    // 只读属性count
println("The airports dictionary contains \(airports.count) items.")


//使用布尔项isEmpty属性来作为检查count属性的值是否为0.
    // 属性 isEmpty
if airports.isEmpty {
    println("The airports dictionary is empty")
} else {
    println("The airports dictionary is not empty.")
}

// 我们也可以在字典中使用下标语法来添加新的数据项。可以使用一个合适类型的key作为下标索引，并且分配新的合适类型的值：
    // 使用下标语法添加新数据项
airports["LHR"] = "London"

// 我们也可以使用下标语法来改变特定键对应的值：
airports["LHR"] = "London Heathrow"


//作为另一种下标方法，字典的updateValue(forKey:)方法可以设置或者更新特定键对应的值。就像上面所示的示例，updateValue(forKey:)方法在这个键不存在对应值的时候设置值或者在存在时更新已存在的值。和上面的下标方法不一样，这个方法返回更新值之前的原值。这样方便我们检查更新是否成功。
    // updateValue(forKey:),
// updateValue(forKey:)函数会返回包含一个字典值类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。如果值存在，则这个可选值值等于被替换的值，否则将会是nil。
if let oldValue = airports.updateValue("Dublin internation", forKey: "DUB") {
    println("The old value for DUB was \(oldValue)")
}
// prints "The old value for DUB was Dublin.”

println(airports["DUB"])


// 我们也可以使用下标语法来在字典中检索特定键对应的值。由于使用一个没有值的键这种情况是有可能发生的，可选 类型返回这个键存在的相关值，否则就返回nil：
    //使用下标语法来在字典中检索特定键对应的值

if let airportName = airports["DUB"] {
    println("The name of the airport is \(airportName).")
} else {
    println("That airport is not in the airports dictionary.")
}

// prints "The name of the airport is Dublin International.”


//我们还可以使用下标语法来通过给某个键对应值赋值为nil来从字典里一处一个键值对
airports["APL"] = "Apple International"
//“// "Apple International" is not the real airport for APL, so delete it” 赋给一对新值然后删除它

airports["APL"] = nil
// APL has now been removed from the dictionary”


// 另外,￼removeValueForKey 方法也可以用来在字典中移除键值对。这个方法在键值对存在 的情况下会移除该键值对并且返回被移除的 value 或者在没有值的情况下返回 nil:

if let removedValue = airports.removeValueForKey("DUB") {
    println("The removed airport's name is \(removedValue).")
} else {
    println("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin International.”




// 6.4. Iterating Over a Dictionary 字典遍历
  // 我们可以使用for-in循环来遍历某个字典中的键值对。每一个字典中的数据项都由(key, value)元组形式返回，并且我们可以使用暂时性常量或者变量来分解这些元组：


for (airportCode, airportName) in airports {
    println("\(airportCode): \(airportName)")
}
// TYO: Tokyo
// LHR: London Heathrow

// for-in循环请参见For 循环。


// 我们也可以通过访问他的keys或者values属性（都是可遍历集合）检索一个字典的键或者值：
for airportCode in airports.keys {
    println("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: TYO”

for airportName in airports.values {
    println("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Tokyo”


//￼如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受 Array 实例 API 的参 数,可以直接使用 keys 或者 values 属性直接构造一个新数组:
let airportCodes = [String](airports.keys)
//airportCodes is ["LHR", "TYO"]

let airportNames = [String](airports.values)
//airportNames is ["London Heathrow", "Tokyo"]

//注意： Swift 的字典类型是无序集合类型。其中字典键，值，键值对在遍历的时候会重新排列，而且其中顺序是不固定的。



// 6.5. Creating an Empty Dictionary 创建一个空字典
//我们可以像数组一样使用构造语法创建一个空字典：
var namesOfIntegers = [Int: String]()
// namesOfIntegers is an empty [Int: String] dictionary

// 这个例子创建了一个Int, String类型的空字典来储存英语对整数的命名。他的键是Int型，值是String型。

//如果上下文已经提供了信息类型,我们可以使用空字典字面语句来创建一个空字典,记作[:](中括号中放一个冒号)
namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair”

namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]”

// 注意： 在后台，Swift 的数组和字典都是由泛型集合来实现的，想了解更多泛型和集合信息请参见泛型。


// 6.6. Hash Values for Dictionary Key Types
 // 字典的key type一定是可哈希的，这样可以保证它是有哈希值得。哈希值是Int值的话，那么所有字典成员都可以比较是否相等，例如 a == b,就是a.hasValue == b.hasValue 的比较。
// 所有的 Swift 基本类型（例如String，Int， Double和Bool）都是默认可哈希的，并且所有这些类型都可以在字典中当做键使用。未关联值的枚举成员（参见枚举）也是默认可哈希的。


// 注意，你也可以使用你自己定制类型作为字典key type，使它们遵守Swift标准库的Hasable协议。 遵循Hasable协议的Type一定要提供可获取的Int属性叫hashValue，并且也要提供相等（==）运算符的实现。hashValue属性返回的值不要求跟相同程序的不同执行或者不同程序的一样。更多有关conforming to protocols的细节, 请参考Protocols。

// 我的testing
let locationTest = ["L1": "London", "L2": "Paris"]

let locationTest2 = ["L1": "London", "L2": "Paris"]

if locationTest["L1"] == locationTest2["L1"] {
    println("They are the same.")
}

for (locationCode1, locationName1) in locationTest {
    for(locationCode2,locationName2) in locationTest2 {
        if locationCode1 == locationCode2 || locationName1 == locationName2 {
            println("They have a same item.")
        }
    }
}















