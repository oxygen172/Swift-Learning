// Playground - noun: a place where people can play

import UIKit

// 1. Initialization 构造过程
 /*
a. 构造过程是为了使用某个类、结构体或枚举类型的实例而进行的准备过程。这个过程包含了为实例中的每个属性设置初始值和为其执行必要的准备和初始化任务。

b. 构造过程是通过定义构造器(Initializers)来实现的,这些构造器可以看做是用来创建特定类型实例的特殊方法。与 Objective-C 中的构造器不同,Swift的构造器无需返回值,它们的主要任务是保证新实例在第一次使用前完成正确的初始化。

c. 类实例也可以通过定义析构器(deinitializer)在类实例释放之前执行特定的清除工作。更多信息请参看反初始化， Deinitialization.

*/


// 2. Setting Initial Values for Stored Properties 存储型属性的初始赋值

/*
a. 类和结构体在实例创建时,必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。

b. 你可以在构造器中为存储型属性赋初值,也可以在定义属性时为其设置默认值。

注意:当你为存储型属性设置默认值或者在构造器中为其赋值时,它们的值是被直接设置的,不会触发任何属性观测器(property observers)。
*/



// 2.1 Initializers 构造器
  //构造器在创建某特定类型的新实例时调用。它的最简形式类似于一个不带任何参数的实例方法,以关键字 init 命名。
/*
init() {
    // perform some initialization here
}
*/

// 下面例子中定义了一个用来保存华氏温度的结构体Fahrenheit，它拥有一个Double类型的存储型属性temperature：
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
println("The default temperature is \(f.temperature)º Fahrenheit")
// prints "The default temperature is 32.0° Fahrenheit

// 这个结构体定义了一个不带参数的构造器 init,并在里面将存储型属性 temperature 的值初始化为 32.0(华摄氏度下水的冰点)。



// 2.2 Default Property Values 默认属性值
  // 如前所述,你可以在构造器中为存储型属性设置初始值;同样,你也可以在属性声明时为其设置默认值。

// 注意:如果一个属性总是使用同一个初始值,可以为其设置一个默认值。无论定义默认值还是在构造器中赋值,最终它们实现的效果是一样的,只不过默认值跟属性构造过程结合的更紧密。使用默认值能让你的构造器更简洁、更清晰,且能通过默认值自动推导出属性的类型;同时,它也能让你充分利用默认构造器、构造器继承，如下面章节所述。

// 你可以使用更简单的方式在定义结构体 Fahrenheit 时为属性 temperature 设置默认值
struct Fahrenheit2 {
    var temperature = 32.0
    
}



// 3. Customizing Initialization 定制化构造过程
  // 你可以通过输入参数和可选属性类型来定制构造过程,也可以在构造过程中修改常量属性，如下面所描述。


// 3.1 Initialization Parameters 构造参数
  // 你可以在定义构造器时提供构造参数,为其提供定制化构造所需值的类型和名字。构造器参数的功能和语法跟函数和方法参数相同。

// 下面例子中定义了一个包含摄氏度温度的结构体Celsius。它定义了两个不同的构造器：init(fromFahrenheit:)和init(fromKelvin:)，二者分别通过接受不同刻度表示的温度值来创建新的实例：
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        // fromFahrenheit 是外部参数名，fahrenheit是本地参数名
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        // fromKelvin 是外部参数名， kelvin是本地参数名
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0

// 第一个构造器拥有一个构造参数，其外部名字为fromFahrenheit，内部名字为fahrenheit；第二个构造器也拥有一个构造参数，其外部名字为fromKelvin，内部名字为kelvin。这两个构造器都将唯一的参数值转换成摄氏温度值，并保存在属性temperatureInCelsius中。



// 3.2 Local and External Parameter Names 内部和外部参数名
  // 跟函数和方法参数相同,构造参数也存在一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。

// 然而,构造器并不像函数和方法那样在括号前有一个可辨别的名字。所以在调用构造器时,主要通过构造器中的参数名和类型来确定需要调用的构造器。正因为参数如此重要, 如果你在定义构造器时没有提供参数的外部名字,Swift 会为每个构造器的参数自动生成一个跟内部名字相同的外部名,就相当于在每个构造参数之前加了一个哈希符号。

// 以下例子中定义了一个结构体Color，它包含了三个常量：red、green和blue。这些属性可以存储0.0到1.0之间的值，用来指示颜色中红、绿、蓝成分的含量。

// Color提供了一个构造器，其中包含三个Double类型的构造参数,对应红，绿，蓝三种元素。 Color又提供第二个构造器，只有一个white参数，用来给三个颜色元素配置相同的颜色。

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        //swift 会为每个构造器的参数自动生成一个跟内部名字相同的外部名
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red    = white
        green  = white
        blue   = white
    }
}
// 两个构造器都可以用来创建一个新的Color实例，它们都是通过提供各个构造器参数名传值来创建的。

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
// 带外部参数名才能调用构造器

// ￼注意：如果不通过外部参数名字传值,你是没法调用这些构造器的。只要构造器定义了某个外部参数名,你就必须使用它,忽略它将导致编译错误。

//let veryGreen = Color(0.0, 1.0, 0.0)
// this reports a compile-time error - external names are required



// 3.3 Initializer Parameters Without External Names 没有外部参数名的构造器

// 如果你不希望为构造器的某个参数提供外部名字,你可以使用下划线_来显示描述 它的外部名,以此覆盖上面所说的默认行为。

// 下面例子是Celsius的扩展版，带有一个新的构造器来创建一个基于本来就是摄氏带Double值的Celsius实例

struct Celsius_2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = ( fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) { // 没有外部参数名的构造器
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius_2(37.0) // 直接调用没有外部参数名的构造器
// bodyTemperature.temperatureInCelsius is 37.0

// 这个构造器调用了Celsius_2(37.0)带有简洁意图而不需要填写外部参数名。所以如果想调用构造器而没有提供名字的Double值时，就可以像init(_ celsius: Double) 这样写一个构造器。



// 3.4 Optional Property Types 可选属性类型

  // 如果你定制的类型包含一个逻辑上允许取值为空的存储型属性--不管是因为它无法在初始化时赋值,还是因为它可以在之后某个时间点可以赋值为空--你都需要将它定义为可选类型 optional type。可选类型的属性将自动初始化为空 nil,表示这个属性是故意在初始化时设置为空的。

// 下面例子中定义了类SurveyQuestion，它包含一个可选字符串属性response：
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// prints "Do you like cheese?"

cheeseQuestion.response = "Yes, I do like cheese."

// 调查问题在问题提出之后,我们才能得到回答。所以我们将属性回答 response 声明为 String?类型,或者说是可选字符串类型 optional String。当 SurveyQuestion 实例化时,它将自动赋值为空nil,表明该属性在初始化过程中故意暂时没有值。




// 3.5 Assigning Constant Properties During Initialization 构造过程中常量属性的赋值


// 你可以在构造过程中的任意时间点给常量属性赋值，只要在构造过程结束时候常量属性被赋值是为一个明确的值。一旦常量属性被赋值，就不能再修改这个值了。

// 注意： 对于类实例来说，它的常量属性只能在定义它的类的构造过程中修改;不能在子类中修改。

// 你可以修改上面的SurveyQuestion示例，用常量属性替代变量属性text，指明问题内容text在其创建之后不会再被修改。尽管text属性现在是常量，我们仍然可以在其类的构造器中修改它的值：


class SurveyQuestion_2 {
    let text: String  // text 是常量
    var response: String?  //为什么改为 let response: String? 不会报错
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}

let beetsQuestion = SurveyQuestion(text: "How about beets?")
// 尽管 text 属性现在是常量,我们仍然可以在其类的构造过程中赋值,但是之后就不能修改了。
beetsQuestion.ask()
// prints "How about beets"
beetsQuestion.response = "I also like beets.(But not with cheese.)"
// 如果我把 response改为常量属性，没有构造器初始化response，为何可以修改并且不会报错？？？因为它是可选类属性？不是，是因为swift给response提供了默认构造器，所以虽然是常量但是可以在构造初始化中修改它的值。



// 4. Default initializers 默认构造器

  // Swift 将为所有属性已提供默认值的且自身没有定义任何构造器的结构体或基类,提供一个默认的构造器。这个默认构造器将简单的创建一个所有属性值都设置为默认值的实例。

// 下面例子中创建了一个类ShoppingListItem，它封装了购物清单中的某一项的属性：名字（name）、数量（quantity）和购买状态 purchase state。
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()
// 由于 ShoppingListItem 类中的所有属性都有默认值,且它是没有父类的基类,它将自动获得一个可以为所有属性设置默认值的默认构造器(尽管代码中没有显式为 name 属性设置默认值,但由于 name 是可选字符串类型,它将默认设置为 nil)。上面例子中使用默认构造器创造了一个ShoppingListItem类的实例（使用ShoppingListItem()形式的构造器语法），并将其赋值给变量item。





// 4.1 Memberwise Initializers for Structure Types 结构体的逐一成员构造器
  // 除上面提到的默认构造器，结构体类型如果自身没有自定义构造器，他们会自动获得一个逐一成员构造器，即使结构体的存储属性没有默认值也如此。

// 逐一成员构造器是用来初始化结构体新实例里成员属性的快捷方法。我们在调用逐一成员构造器时,通过与成员属性名相同的参数名进行传值来完成对成员属性的初始赋值。

// 下面例子中定义了一个结构体Size，它包含两个属性width和height。Swift 可以根据这两个属性的初始赋值0.0自动推导出它们的类型Double。

// 由于这两个存储型属性都有默认值，结构体Size自动获得了一个逐一成员构造器 init(width:height:)。 你可以用它来为Size创建新的实例：

struct Size_1 {
    var width = 0.0, height = 0.0
} // 由于这两个存储型属性都有默认值,结构体 Size 自动获得了一个逐一成员构造器 init(width:height:)。
  // 其实就是说结构体成员也有默认构造器

let twoByTwo = Size_1(width: 2.0, height: 2.0)




// 5. Initializer Delegation for Value Types 值类型的构造器代理

// ￼构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理,它能减少多个构造器间的代码重复。

/* 构造器代理的实现规则和形式在值类型和类类型中有所不同。
    1. 值类型(结构体和枚举类型)不支持继承,所以构造器代理的过程相对简单,因为它们只能代理任务给本身提供的其它构造器。

    2. 类则不同,它可以继承自其它类(请参考Inheritance 继承),这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化。这些责任在Class Inheritance and Initalization里有描述。

对于值类型,你可以使用 self.init 在自定义的构造器中引用其它的属于相同值类型的构造器。并且你只能在构造器内部调用 self.init。

注意,如果你为某个值类型定义了一个定制的构造器,你将无法访问到默认构造器(如果是结构体,则无法访问逐一对象构造器)。这个限制可以防止你在为值类型定义了一个更复杂的,完成了重要准备构造器之后,别人还是错误的使用了那个自动生成的构造器。

注意:假如你想通过默认构造器、逐一对象构造器以及你自己定制的构造器为值类型创建实例,我们建议你将自己定制的构造器写到扩展(extension)中,而不是跟值类型定义混在一起。

*/


// 下面例子将定义一个结构体 Rect,用来展现几何矩形。这个例子需要两个辅助的结构体 Size 和 Point,它们各自为其所有的属性提供了初始值 0.0


struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}


/* 你可以通过以下三种方式为 Rect 创建实例:
    1.使用默认的 0 值来初始化 origin 和 size 属性; 
    2.使用特定的 origin 和 size 实例来初始化;
    3.使用特定的 center 和 size 来初始化。
*/
// 在下面Rect结构体定义中，我们为着三种方式提供了三个自定义的构造器：
struct Rect {
    var origin = Point() // 属性为一个Point实例
    var size = Size()    // 属性为一个Size实例
        
    init() {} // 1.使用默认的 0 值来初始化 origin 和 size 属性;
        
    init(origin: Point, size: Size) {
        //2.使用特定的 origin 和 size 实例来初始化;
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        // 3.使用特定的 center 和 size 来初始化。
        let originX = center.x -  (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
        // 用(或代理给)init(origin:size:)构造器来将新的 origin 和 size 值赋值到对应的属性中
    }
        
}

//第一个 Rect 构造器 init(),在功能上跟没有自定义构造器时自动获得的默认构造器是一样的。这个构造器是一个空函数,使用一对大括号{}来描述,它没有执行任何定制的构造过程。调用这个构造器将返回一个Rect实例,它的 origin 和 size 属性都使用定义时的默认值 Point(x: 0.0, y: 0.0)和 Size(width: 0.0, height: 0.0)
let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)


//第二个 Rect 构造器 init(origin:size:),在功能上跟结构体在没有自定义构造器时获得的逐一成员构造器是一样的。这个构造器只是简单的将 origin 和 size 的参数值赋给对应的存储型属性:
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)



//第三个 Rect 构造器 init(center:size:)稍微复杂一点。它先通过 center 和 size 的值计算出origin 的坐标。然后再调用(或代理给)init(origin:size:)构造器来将新的 origin 和 size 值赋值到对应的属性中:
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)


// 构造器 init(center:size:)可以自己将 origin 和 size 的新值赋值到对应的属性中。然而尽量利用现有的构造器和它所提供的功能来实现 init(center:size:)的功能,是更方便、更清晰和更 直观的方法。

// 注意:如果你想用另外一种不需要自己定义 init()和 init(origin:size:)的方式来实现这个例子,请参考扩展。




// 6. Class Inheritance and Initialization 类的继承和构造过程

// 类里面的所有存储型属性--包括所有继承自父类的属性--都必须在构造过程中设置初始值。

// Swift 提供了两种类型的类构造器来确保所有类实例中存储型属性都能获得初始值,它们分别是指定构造器和便利构造器。




// 6.1 Designated Initializers and Convenience Initializers 指定构造器和便利构造器
/*
1. 指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性,并根据父类链往上调用父类的构造器来实现父类的初始化。
    a. 类一般有几个指定构造器，更普遍的是一个类通常只有一个指定构造器。指定构造器是构造过程的“管道”，通过它可以往上找到父类链。
    b. 每一个类都必须拥有至少一个指定构造器。在某些情况下,许多类通过继承了父类中的指定构造器而满足了这个条件。具体内容请参考后续章节Automatic Initializer Inheritance 自动构造器的继承。

2. 便利构造器是类中比较次要的、辅助型的构造器。你可以定义便利构造器来调用同一个类中的指定构造器,并为其参数提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入的实例。
    a. 你应当只有在必要的时候为类提供便利构造器,比方说某种情况下通过使用便利构造器来快捷调用某个指定构造器,能够节省更多开发时间并让类的构造过程更清、晰明。

*/



// 6.2 Syntax for Designated and Convenience Initializers 指定构造器和便利构造器的语法

/*
1.  类的指定构造器写法跟值类型的简单构造器一样
    init(parameters) {
        statements
    }

2. 便利构造器语法也一样，但是要在init前加上convenience
    convenience init(parameters) {
        statements
    }
*/



// 6.3 Initializer Chaining 构造器链
/*
为了简化指定构造器和便利构造器之间的调用关系,Swift 采用以下三条规则来限制构造器之间的代理调用:

rule 1 : 指定构造器必须调用其直接父类的的指定构造器。

rule 2 : 便利构造器必须调用同一类中定义的其它构造器。

rule 3 : 便利构造器必须最终以调用一个指定构造器结束。

一个更方便记忆的方法是:    指定构造器必须总是向上代理    便利构造器必须总是横向代理

这些规则可以通过下面图例来说明：

如图所示，父类中包含一个指定构造器和两个便利构造器。其中一个便利构造器调用了另外一个便利构造器，而后者又调用了唯一的指定构造器。这满足了上面提到的规则2和3。这个父类没有自己的父类，所以规则1没有用到。

子类中包含两个指定构造器和一个便利构造器。便利构造器必须调用两个指定构造器中的任意一个，因为它只能调用同一个类里的其他构造器。这满足了上面提到的规则2和3。而两个指定构造器必须调用父类中唯一的指定构造器，这满足了规则1。

注意:这些规则不会影响你如何用类去创建实例。任何上图中展示的构造器都可以用来完整创建对应类的实例。这些规则只在实现类的定义时有影响。


下面图例中展示了一种更复杂的类层级结构。它演示了指定构造器是如果在类层级中充当“管道”的作用，在类的构造器链上简化了类之间的内部关系。

*/



// 6.4 Two-Phase Initialization 两段式构造过程
 /*

Swift 中类的构造过程包含两个阶段。第一个阶段,每个存储型属性通过引入它们的类的构造器来设置初始值。当每一个存储型属性值被确定后,第二阶段开始,它给每个类一次机会在新实例准备使用之前进一步定制它们的存储型属性。

两段式构造过程的使用让构造过程更安全,同时在整个类层级结构中给予了每个类完全的灵活性。两段式构造过程可以防止属性值在初始化之前被访问;也可以防止属性被另外一个构造器意外地赋予不同的值。

注意：Swift的两段式构造过程跟 Objective-C 中的构造过程类似。最主要的区别在于阶段 1，Objective-C 给每一个属性赋值0或空值（比如说0或nil）。Swift 的构造流程则更加灵活，它允许你设置定制的初始值，并自如应对某些属性不能以0或nil作为合法默认值的情况。

Swift 编译器将执行 4 种有效的安全检查,以确保两段式构造过程能顺利完成:
*/


// 6.4.1 Safety check 1 安全检查1
// 指定构造器必须保证它所在类引入的所有属性都必须先初始化完成,之后才能将其它构造任务向上代理给父类中的构造器。

    // 如上所述,一个对象的内存只有在其所有存储型属性确定之后才能完全初始化。为了满足这一规则,指定构造器必须保证它所在类引入的属性在它往上代理之前先完成初始化。

// 6.4.2 Safety check 2 安全检查2
// 指定构造器必须先向上代理调用父类构造器,然后再为继承的属性设置新值。如果没这么做,指定构造器赋予的新值将被父类中的构造器所覆盖。


// 6.4.3 Safety check 3 安全检查3
// 便利构造器必须先代理调用同一类中的其它构造器,然后再为任意属性赋新值。如果没这么做,便利构造器赋予的新值将被同一类中其它指定构造器所覆盖。


// 6.4.4 Safety check 4 安全检查4
// 构造器在第一阶段构造完成之前,不能调用任何实例方法、不能读取任何实例属性的值, 也不能引用 self 的值。



// 6.4.5 Phase 1 阶段1
/*
1. 某个指定构造器或便利构造器被调用; 
2. 完成新实例内存的分配,但此时内存还没有被初始化;3. 指定构造器确保其所在类引入的所有存储型属性都已赋初值。存储型属性所属的内存完成初始化;4. 指定构造器将调用父类的构造器,完成父类属性的初始化;5. 这个调用父类构造器的过程沿着构造器链一直往上执行,直到到达构造器链的最顶部;6. 当到达了构造器链最顶部,且已确保所有实例包含的存储型属性都已经赋值,这个实例的内存被认为已经完全初始化。此时阶段1完成。

*/


// 6.4.6 Phase 2 阶段2
/*
1. 从顶部构造器链一直往下,每个构造器链中类的指定构造器都有机会进一步定制实例。构造器此时可以访问self、修改它的属性并调用实例方法等等。
2. 最终,任意构造器链中的便利构造器可以有机会定制实例和使用 self。

下图展示了在假定的子类和父类之间构造的阶段1： 

在这个例子中，构造过程从对子类中一个便利构造器的调用开始。这个便利构造器此时没法修改任何属性，它把构造任务代理给同一类中的指定构造器。

如安全检查1所示，指定构造器将确保所有子类的属性都有值。然后它将调用父类的指定构造器，并沿着造器链一直往上完成父类的构建过程。

父类中的指定构造器确保所有父类的属性都有值。由于没有更多的父类需要构建，也就无需继续向上做构建代理。

一旦父类中所有属性都有了初始值，实例的内存被认为是完全初始化，而阶段1也已完成。


以下展示了相同构造过程的阶段2：

父类中的指定构造器现在有机会进一步来定制实例（尽管它没有这种必要）。

一旦父类中的指定构造器完成调用，子类的构指定构造器可以执行更多的定制操作（同样，它也没有这种必要）。

最终，一旦子类的指定构造器完成调用，最开始被调用的便利构造器可以执行更多的定制操作。
*/



// 6.5 Initializer Inheritance and Overriding 构造器的继承和重载

/*
1. 跟 Objective-C 中的子类不同,Swift 中的子类不会默认继承父类的构造器。Swift的这种机制可以防止一个父类的简单构造器被一个更专业的子类继承,并被错误的用来创建子类的实例。

   注意： 父类构造器只有在特定情况下才会被继承，并且是安全和适当的情况下。更多信息请看Automatic Initializer Inheritance.

2. 假如你希望自定义的子类中能实现一个或多个跟父类相同的构造器,也许是为了完成一些定制的构造过程, 你可以在你定制的子类中提供和重载与父类相同的构造器。

3.  a. 如果你想重载的构造器是一个父类的指定构造器,你可以在子类里重载它的实现,并在自定义版本的构造器中调用父类版本的构造器。所以你必须要在子类构造器前加上override，当你想重载默认提供的构造器也必须要加上override，如Default Initializers描述。

    b. 对于被重载的属性、方法或者下标，override 会让Swift去帮你检查父类是否有这个匹配的指定构造器去重载，并且验证重载的构造器的参数。

    注意：当你要重载一个父类的指定构造器，你必须带上override这个字段，即使子类的构造器是便利构造器。

    c. 相反的，如果你想写一个子类构造器匹配父类的便利构造器，根据Initializer Delegation fo Class Types描述的规则，父类的便利构造器是不能被子类直接调用的。所以严格来说，子类是不提供父类构造器的重载。所以你想通过加override来实现修改匹配的父类便利构造器是不能的。
*/


// 下面例子定义一个基类叫Vehicle。这个基类声明了一个存储属性叫numberOfWheels，默认值为0. numberOfWheels属性被一个计算属性description所调用来创建一个字符串来描述vehicle的特性：
class Vehicle {  // base class
    var numberOfWheels = 0   //存储属性
    var description: String {  // 计算属性
        return "\(numberOfWheels) wheel(s)"
    }// 因为没有自定义构造器，所以这个类会产生一个默认构造器
}

// Vehicle类提供了存储属性的默认值但是没有提供任何自定义构造器。所以，这个类会有一个默认构造器，如Default Initalizers描述一样。 默认构造器（当可用时）是类的一个指定构造器，用来创建一个新的Vehicle实例并且设numberOfWheels为0：

let vehicle = Vehicle()
println("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)

    
// 下面的例子定义了一个Vehicle的子类Bicycle：
class Bicycle: Vehicle { //子类继承Vehicle
        override init() { // 指定构造器，因为跟父类的指定构造器一致，所以要加override来重载
                super.init() // 调用父类构造器以便可以修改从父类继承来的属性numberOfWheels的值
                numberOfWheels = 2
        }
}

// Bicycle子类定义了一个自定义指定构造器-- init()。 这个指定构造器跟Bicycle父类的指定构造器匹配，所以Bicycle版本的构造器前要带上override。

// Bicycle的init()构造器先调用super.init()来调用Bicycle父类（Vehicle）的默认构造器。这确保了在Bicycle去修改numberOfWheels这个继承而来得属性之前是先被Vehicle初始化的。super.init()之后，numberOfWheels的值被赋予新值2。

// 如果你创建一个Bicycle实例， 你可以调用继承而来的description计算属性来查看numberOfWheels属性是怎样被更新的：

let bicycle = Bicycle()
println("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)


// 注意： 子类只能在初始化中修改从父类继承过来的变量属性，而继承过来的常量属性是不允许修改的。

    

// 6.6 Automatic Initializer Inheritance 自动构造器的继承
        
    // 如上所述，子类不会默认继承父类的构造器。但是如果特定条件可以满足,父类构造器是可以被自动继承的。在实践中,这意味着对于许多常见场景你不必重载父类的构造器,并且在尽可能安全的情况下以最小的代价来继承父类的构造器。
    

//假设要为子类中引入的任意新属性提供默认值,请遵守以下 2 个规则:
    
// 6.6.1 Rule 1 规则1
//如果子类没有定义任何指定构造器,它将自动继承所有父类的指定构造器。


// 6.6.2 Rule 2 规则2
//如果子类提供了所有父类指定构造器的实现--不管是通过规则1继承过来的,还是通过自定义实现的--它将自动继承所有父类的便利构造器。
        
// 以上规则在子类有更多的便利构造器的情况下还是适用的。

    //注意:子类可以通过部分满足规则2的方式,使用子类便利构造器来实现父类的指定构造器。


// 6.7 Designated and Convenience Initializers in Action 指定构造器和便利构造器实战

// 接下来的例子将在实战中展示指定构造器、便利构造器和自动构造器的继承。它定义了包含三个类Food、RecipeIngredient以及ShoppingListItem的类层次结构，并将演示它们的构造器是如何相互作用的。
        
// 类层次中的基类是Food，它是一个简单的用来封装食物名字的类。Food类引入了一个叫做name的String类型属性，并且提供了两个构造器来创建Food实例：
        
class Food {
    var name: String
    init(name: String) {  //指定构造器，参数是name
        self.name = name
    }
    convenience init() {  //便利构造器，但是没有参数的
    self.init(name:"[Unnamed]") //调用指定构造器来修改name属性
    }
}

// 下图中展示了Food的构造器链：

// 类没有提供一个默认的逐一成员构造器，所以Food类提供了一个接受单一参数name的指定构造器。这个构造器可以使用一个特定的名字来创建新的Food实例：

let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"


//Food 类中的构造器 init(name: String)被定义为一个指定构造器,因为它能确保所有新Food 实例的中存储型属性都被初始化。Food 类没有父类,所以 init(name: String)构造器不需要调用 super.init()来完成构造。

//Food 类同样提供了一个没有参数的便利构造器 init()。这个 init()构造器为新食物提供了一个默认的占位名字,通过代理调用同一类中定义的指定构造器 init(name: String)并给参数 name 传值[Unnamed]来实现:

let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"



// 类层级中的第二个类是 Food 的子类 RecipeIngredient。RecipeIngredient 类构建了食谱中的一味调味剂。它引入了 Int 类型的数量属性 quantity(以及从 Food 继承过来的 name 属 性),并且定义了两个构造器来创建 RecipeIngredient实例:

class RecipeIngredient: Food {
        var quantity: Int
        init(name: String, quantity: Int) { // 指定构造器
            self.quantity = quantity
            super.init(name: name)
        }
        override convenience init(name: String) { //便利构造器 ???????override 怎么在前面？？？应该在后面才对啊
            self.init(name: name, quantity: 1)
        }
}

// 下图中展示了RecipeIngredient类的构造器链：-----------

// RecipeIngredient类拥有一个指定构造器 init(name: String, quantity: Int),它可以用来产生新 RecipeIngredient 实例的所有属性值。这个构造器一开始先将传入的 quantity 参数赋值 给 quantity 属性,这个属性也是唯一在 RecipeIngredient 中新引入的属性。随后,构造器将任务向上代理给父类 Food 的 init(name: String)。这个过程满足两段式构造过程中的安全检查 1。

// RecipeIngredient 也定义了一个便利构造器 init(name: String),它只通过 name 来创建 RecipeIngredient 的实例。这个便利构造器假设任意 RecipeIngredient 实例的 quantity 为1,所以不需要显示指明数量即可创建出实例。这个便利构造器的定义可以让创建实例更加方便和快捷,并且避免了使用重复的代码来创建多个 quantity 为 1 的 RecipeIngredient 实例。这个便利构造器只是简单的将任务代理给了同一类里提供的指定构造器。

// 注意: RecipeIngredient 的便利构造器 init(name: String)使用了跟 Food 中指定构造器 init(name: String)相同的参数。尽管 RecipeIngredient 这个构造器是便利构造器,RecipeIngredient 依然提供了对所有父类指定构造器的实现。因此,RecipeIngredient 也能自动继承了所有父类的便利构造器。

// 在这个例子中，RecipeIngredient的父类是Food，它有一个便利构造器init()。这个构造器因此也被RecipeIngredient继承。这个继承的init()函数版本跟Food提供的版本是一样的，除了它是将任务代理给RecipeIngredient版本的init(name: String)而不是Food提供的版本。

// 所有的这三种构造器都可以用来创建新的RecipeIngredient实例：
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Egg", quantity: 6)



// 类层级中第三个也是最后一个类是 RecipeIngredient 的子类,叫做ShoppingListItem。这个类构建了购物单中出现的某一种调味料。

// 购物单中的每一项总是从unpurchased未购买状态开始的。为了展现这一事实，ShoppingListItem引入了一个布尔类型的属性purchased，它的默认值是false。ShoppingListItem还添加了一个计算型属性description，它提供了关于ShoppingListItem实例的一些文字描述：
class ShoppingListItem2: RecipeIngredient {
            var purchased = false
            var description: String {
                var output = "\(quantity) x \(name)"
                output += purchased ? "✔︎" : "✘"
                return output
            }
            
}
// 注意:ShoppingListItem2 没有定义构造器来为 purchased 提供初始化值,这是因为任何添加到购物单的项的初始状态总是未购买。

// 由于它为自己引入的所有属性都提供了默认值，并且自己没有定义任何构造器，ShoppingListItem将自动继承所有父类中的指定构造器和便利构造器。

// 下图种展示了所有三个类的构造器链：---------


// 你可以使用全部三个继承来的构造器来创建ShoppingListItem的新实例：
var breakfastList = [  // 数组
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6), //为什么要逗号？？应该可以去掉
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true

for item in breakfastList {
                    println(item.description)
}

                
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘

// 如上所述，例子中通过字面量方式创建了一个新数组breakfastList，它包含了三个新的ShoppingListItem实例，因此数组的类型也能自动推导为ShoppingListItem[]。在数组创建完之后，数组中第一个ShoppingListItem实例的名字从[Unnamed]修改为Orange juice，并标记为已购买。接下来通过遍历数组每个元素并打印它们的描述值，展示了所有项当前的默认状态都已按照预期完成了赋值。




// 7. Failable Initializers  可失败构造器

  // 有时候捕获你定义一个类、结构体、枚举时候构造化时失败是有用的。失败有可能是无效的参数值，或者必须的外部资源缺失了，又或者是其他某些条件导致初始化失败。

// 为了应对初始化时会失败的情况，我们定义一个或多个可失败构造器，作为一个类、结构体、枚举的声明一部分。 创建一个可失败构造器要在init关键字后添加一个问号？来指明。

// 注意： 你定义一个可失败构造器和一个不是可失败构造器时候，不能用相同的参数类型和名字。

// 可失败构造器构造化时通常创建一个可选的值类型。在可失败构造器里写上return nil来指明某个点可能会触发构造化失败。

// 注意： 严格来说，构造器不会返回值。相反， 他们的角色是确保self在构造化结束时候是完全正确地初始化。尽管加上return nil来触发初始化失败，但是不能用return这个关键字来指明初始化成功。

// 下面的例子定义了一个结构体叫Animal, 带有一个字符串常量的属性叫speices。这个构造器也定义了一个可失败构造器，带一个单参数叫speices。构造器会检查是否传进构造器的species值是够是空字符串。如果是空字符串就会触发初始化失败。相反初始化成功。

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
// 通过可失败构造器可以检查初始化一个Animal实例是否成功

let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal 

if let giraffe = someCreature {
    println("An animal was initialized with a species of \(giraffe.species)")
}
// prints "An animal was initialized with a species of Giraffe"

// 当你传入一个空字符串给可失败构造器的species参数，就会触发初始化失败：

let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
        println("The anonymous creature could not be initialized")
    }
// prints "The anonymous creature could not be initialized"
    
// 注意： 检查是否是一个空字符串值（例如""）跟检查nil来指明是否是一个可选的字符串类型值是不一样的。如上例子，一个animal带上一个空的字符串来作为species属性的值是不合适的。为了塑造这种限制模型，当发现空字符串，可失败构造器就会触发初始化失败。



// 7.1 Failable Initializers for Enumerations 枚举的可失败构造器

  // 你可以用可失败构造器来选择一个基于一个或多个参数匹配的相关枚举成员。如果提供的参数跟枚举成员不匹配，初始化就会失败。
    
//  下面定义了一个枚举叫TemperatureUnit，带有三个可能值（Kelvin，Celsius，Fahrenheit）. 可失败构造器是通过Character所代表的温度符号来查找一个对应的枚举成员。
    
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
    switch symbol {
        case "K":
        self = .Kelvin
        case "C":
        self = .Celsius
        case "F":
    self = .Fahrenheit
        default:
    return nil
    }
    }
}

// 通过这个可失败构造器，选择一个带有3种可能状态的枚举成员时就会触发初始化，如果参数跟这三种状态都不匹配就会导致初始化失败。

let fahrenheiUnit = TemperatureUnit(symbol: "F")
if fahrenheiUnit != nil {
        println("This is a defined temperature unit, so initialization succeeded.")
    }
    // prints "This is a defined temperature unit, so initialization succeeded."
    
let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
        println("This is not a defined temperature unit, so initialization failed.")
    }
    // prints "This is not a defined temperature unit, so initialization failed."
    

// 7.2 Failable Initializers for Enumerations with Raw Values 带上原始值的枚举可失败构造器.
    
  // 带有原始值的枚举自动会带上一个可失败构造器-- init?(rawValue:)，参数rawValue是对应的枚举类型，如果有枚举成员匹配就会选上这个枚举成员，相反，找不到匹配项就会触发初始化失败。
    
//  如上面的TemperatureUnit例子，你可以利用原始值类型的Character和init?(rawValue:)来重写代码。
    
enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")

if fahrenheitUnit2 != nil {
    println("This is a defined temperature unit, so initialization succeeded.")
}
// prints "This is a defined temperature unit, so initialization succeeded."

let unkownUnit2 = TemperatureUnit2(rawValue: "X")
if unkownUnit2 == nil {
    println("This is not a defined temperature unit, so initialization failed.")
}
// prints "This is not a defined temperature unit, so initialization failed."

            


// 7.3 Failable Initializers for Classes 类的可失败构造器
    
  // 可失败构造器对于值类型（结构体或枚举）来说， 它可以在构造器初始化时中任何点都可以触发初始化失败。 如上例的Animal结构体，构造器在初始化早期触发初始化失败，甚至在species属性被赋值之前。

// 不过对类来说，可失败构造器只有在这个类声明的全部的存储属性都被设定初始值并且任何构造器代理都已经发生了之后，才可以触发初始化失败。 

// 下面例子展示了怎么使用隐式解释可选属性来满足一个类的可失败构造器要求：

class Product {
    let name: String!
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    
    }
}

// Product类的定义跟Animal结构体的定义很类似。Product类有一个常量name属性，它不允许接受任何空字符串值。为了确保这个需求，使用可失败构造器来确保这个属性的值在初始化成功前是不是空的。

// 但是，Produce是类，而不是结构体。 这就意味着跟Animal不一样，初始化失败之前，Product类的任何可失败构造器都必须提供初始值给name属性。

// 如上例子，name属性在Product类里是被定义为隐式解析可选的字符串类型String！。因为它是可选类型，所以name在初始化中被赋值之前就有默认nil。 各个默认值nil意味着Product类声明的所有属性都有初始值。所以，如果传进来的是空字符串的话，那个Poduct类的可失败构造器在构造器之前就可以触发初始化失败，甚至在初始化给name赋值之前。

// 因为name属性是一个常量，所以初始化成功之后你可以肯定它一直包含一个非nil值。即使你当初定义的是一个隐式解析可选类型，但是你可以肯定的是这个隐式解析值一直都是有值得，不需要检验它是否是nil：

if let bowTie = Product(name: "bow tie") {
    // no need to check if bowTie.name == nil
    println("The product's name is \(bowTie.name)")
}
// prints "The product's name is bow tie"



// 7.4 Propagation of Initialization Failure 初始化失败的传递
        
  // 类、结构体或枚举的可失败构造器可以代理同一个类、结构体或枚举中的另外一个可失败构造器。同样地，子类的可失败构造器也可以向上代理父类的可失败构造器。
        
// 不论哪种情况，如果你代理的另外一个构造器初始化失败，那么整个初始化过程就会立刻失败，并且没有更多的初始化代码被执行。

// 注意： 可失败构造器也可以代理一个不可失败构造器。如果你需要添加一个潜在的失败状态到现有的初始化过程就使用上述方法,否则如果不使用就会失败。

// 下面里定义了一个Product的子类叫CartItem。 CartItem类模拟在线购物车的一个物品，它还引入了一个存储常量属性quantity来确保这个属性一直有值，至少为1.

class CartItem: Product {
    let quantity: Int!
    init?(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 { return nil }
    
    }
}

// quantity属性是一个隐式解析整形类型Int！。 正如Product类的name属性一样，在被初始化赋值之前，quantity属性也有一个默认值nil。

// CartItem的可失败构造器向上代理父类Product的构造器init(name:)。这满足了需求：在触发构造器失败之前，可失败构造器必须先执行构造器代理。

// 如果父类的初始化失败是因为name的空值，那么整个初始化过程立刻失败，并且没有更多的初始化代码执行。如果父类的初始化成功，那么CartItem构造器就会验证quantity是否被赋予1 或更高的值。

// 如果你创建一个CartItem实例，实例中name是非空的，quantity是1或更多，那初始化就成功。

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    println("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// prints "Item: sock, quantity: 2"

// 如果你创建的CartItem实例是quantity为0的话，那么CartItem构造器就会触发初始化失败。

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    println("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
        } else {
            println("Unable to initialize zero shirts")
        }
// prints "Unable to initialize zero shirts"
        
// 同样的，如果你创建一个CartItem实例是带上空的name，父类Product的构造器就会触发初始化失败。
if let oneUnamed = CartItem(name: "", quantity: 1) {
    println("Item: \(oneUnamed.name), quantity: \(oneUnamed.quantity) ")
} else {
    println("Unable to initialize one unnamed product")
}
// prints "Unable to initialize one unnamed product"



// 7.5 Overriding a Failable Initializer 重载一个可失败构造器

  // 你可以在一个子类里重写一个父类的可失败构造器，就跟其他构造器一样。或者，你可以用一个子类的非可失败构造器来重写父类的可失败构造器。这可以让你定义一个子类以免初始化失败，即使父类的初始化是允许失败的。

// 注意：如果你重写一个可失败的父类构造器但是它的子类定义的是不可失败的构造器，那么子类构造器就不能向上代理父类的构造器。一个不可失败的构造器不能代理一个可失败的构造器。

// 注意： 你可以用一个不可失败的构造器来重写一个可失败的构造器，但是反过来就不行。

// 下面例子定义了一个类叫Document，这个类构建一个文件，这个文件实例的names属性值要么是非空字符串值要么是nil，但不能为空字符串：

class Document {
    var name: String?
    // this initialized creates a document with a nil name value
    init() {}
    // this initializer creates a document with a non-empty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

// 下面这个例子定义一个Document的子类叫 AutomaticallyNamedDocument。 这个AutomaticallyNamedDocument子类重写Document定义的两个被代理的构造器。这些重写保证了AutomaticallyNamedDocument的实例在初始化时有没有name值或者空字符串传给了init(name:)构造器，那么就给name初始化值为[Untitled]:

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
    } else {
            self.name = name
        }
    }
 }

// AutomaticallyNamedDocument用一个不可失败的构造器init(name:) 重写了自己父类的可失败构造器init?(name: String)。相比AutomaticallyNamedDocument的父类，因为AutomaticallyNamedDocument用了别的方式，并且它的构造器不会初始化失败，所以它提供的是一个不可失败版本的构造器。



// 7.6 The init! Failable Initializer   init!的可失败构造器

  // 通常定义一个可失败构造器时在init关键字后放一个问号(init?)，它就会创建的一个可选合适类型的实例。或者， 你可以定义一个可失败构造器来创建一个合适的隐式解析可选类型的实例，如果要这样做那就要在init关键字后面添上！而不是？。

// 你可以用init?来代理init！，反过来也可以。

// 你也可以用init！来重写init? 反过来也可以。

// 你也可以用init来代理init!, 即使这样做会触发一个断言，如果init！构造器触发初始化失败。



// 8. Required Initializers 必须的构造器

  // 在定义一个类构造器前带上required 这个修改符，标明这个类的每个子类都必须实现这个构造器。

class SomeClass {
    required init() {
    // initializer implementation goes here.
    }
}


// 在子类定义一个必须的构造器时，你也必须要要加上required，来指明子类继承链上也要满足这个构造器需求。

// 不能在一个必须的指定构造器前添加override来重载。

class SomeSubclass: SomeClass {
    required init() {
    // subclass implementation of the required initializer goes here.
    }
}

// 注意： 如果你继承而来的构造器满足了要求，那你不需要明确提供required initializer




// 9. Setting a default Property Value with a Closure or Function 通过闭包和函数设置属性的默认值

  // 如果某个存储型属性的默认值需要特别的定制或准备,你就可以使用闭包或全局函数来为其属性某供定制的默认值。每当某个属性所属的新类型实例创建时,对应的闭包或函数会被调用,而它们的返回值会当做默认值赋值给这个属性。

// 这种类型的闭包或函数一般会创建一个跟属性类型相同的临时变量,然后修改它的值以满足预期的初始状态,最后将这个临时变量的值作为属性的默认值进行返回。

// 下面列举了闭包如何提供默认值的代码概要：
/*
class SomeClass2 {
        let someProperty: SomeType = {
                // create a default value for someProperty inside this closure -- 在这个闭包中给 someProperty 创建一个默认值
                // someValue must be of the same type as SomeType
                return someValue --  someValue 必须和 SomeType 类型相同
        }()
}

*/
// 注意闭包结尾的大括号后面接了一对空的小括号。这是用来告诉 Swift 需要立刻执行此闭 包。如果你忽略了这对括号,相当于是将闭包本身作为值赋值给了属性,而不是将闭包的返回值赋值给属性。


// 注意:如果你使用闭包来初始化属性的值,请记住在闭包执行时,实例的其它部分都还没有初始化。这意味着你不能够在闭包里访问其它的属性,就算这个属性有默认值也不允许。同样,你也不能使用隐式的 self 属性,或者调用其它的实例方法。

// 下面例子中定义了一个结构体Checkerboard，它构建了西洋跳棋游戏的棋盘：

// 西洋跳棋游戏在一副黑白格交替的 10x10 的棋盘中进行。为了呈现这副游戏棋盘，Checkerboard结构体定义了一个属性boardColors，它是一个包含 100 个布尔值的数组。数组中的某元素布尔值为true表示对应的是一个黑格，布尔值为false表示对应的是一个白格。数组中第一个元素代表棋盘上左上角的格子，最后一个元素代表棋盘上右下角的格子。

// boardColor数组是通过一个闭包来初始化和组装颜色值的：
struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
               temporaryBoard.append(isBlack)
               isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }() // 闭包定义
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

// 每当一个新的Checkerboard实例创建时，对应的赋值闭包会执行，一系列颜色值会被计算出来作为默认值赋值给boardColors。上面例子中描述的闭包将计算出棋盘中每个格子合适的颜色，将这些颜色值保存到一个临时数组temporaryBoard中，并在构建完成时将此数组作为闭包返回值返回。这个返回的值将保存到boardColors中，并可以通squareIsBlackAtRow这个工具函数来查询。

let board = Checkerboard()
println(board.squareIsBlackAtRow(0, column: 1))
// prints "true"
println(board.squareIsBlackAtRow(9, column: 9))
// prints "false"
        
















