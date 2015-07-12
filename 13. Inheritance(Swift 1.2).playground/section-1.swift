// Playground - noun: a place where people can play

import UIKit

// 1. Inheritance 继承

   // 一个类可以继承(inherit)另一个类的方法(methods),属性(property)和其它特性。
// 一个类继承其它类时,继承类叫子类(subclass),被继承类叫超类(或父类,superclass)。

// 在 Swift 中,类可以调用和访问超类的方法,属性和附属脚本(subscripts),并且可以重写(override)这些方法,属性和附属脚本来优化或修改它们的行为。
// Swift 会检查你的重写定义在超类中是否有匹配的定义,以此确保你的重写行为是正确的。

//可以为类中继承来的属性添加属性观察器(property observer),这样一来,当属性值改变时,类就会被通知到。可以为任何属性添加属性观察器,无论它原本被定义为存储型属性 (stored property)还是计算型属性(computed property)。




// 2. Defining a Base Class 定义一个基类

  // 不继承于其它类的类,称之为基类(base calss)。
// 注意： Swift 中的类并不是从一个通用的基类继承而来。如果你不为你定义的类指定一个超类的话,这个类就自动成为基类。

// 下面的例子定义了一个叫Vehicle的基类。这个基类声明了一个存储属性叫currentSpeed, 默认值为0.0（并被推断为Double属性）。这个currentSpeed属性值在一个只读的计算属性叫description中使用，这个属性返回一个String类型的，对车辆特征的描述：
//  这Vehicle基类又定义了一个方法叫makeNoise。这个方法在这个基类里没有做任何事情，但是可以在Vehicle的子类里定制修改：
class Vehicle {
    var currentSpeed = 0.0  // 存储属性
    var description: String { // 计算属性
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

// 使用构造器语法创建一个Vehicle实例，就是在TypeName后加上空括号：
let someVehicle = Vehicle() //创建一个实例

// 已经创建了一个新的Vehile实例，你可以访问它的description属性来输出一句话来描述汽车现在的速度：
println("Vehicle: \(someVehicle.description)")
// Vehicle: traveling at 0.0 miles per hour

// Vehicle这类只定义了任意汽车的共同特性，但是没有多大用处。如果你想使它更使用，那你需要修改它来描述更具体的各种汽车。



// 3. Subclassing  子类生成

  // 子类生成(Subclassing)指的是在一个已有类的基础上创建一个新的类。子类继承超类的特性,并且可以优化或改变它。你还可以为子类添加新的特性。
// 为了指明某个类的超类,将超类名写在子类名的后面,用冒号分隔:
/*
    class SomeClass: SomeSuperclass {
        //subclass definition goes here
}
*/

// 下面例子基于Vehicle父类来定义一个子类叫Bicycle：
class Bicycle: Vehicle { //定义一个新的类叫 Bicycle,它继承了 Vehicle 的属性
    var hasBasket = false // 子类新定义一个存储属性
}

// 新的Bicycle类会自动获得Vehicle的所有特性， 例如currentSpeed和description属性，还有makeNoise方法。
// 除了继承过来的属性之外，Bicycle类还定义了一个新的属性叫hasBasket， 其默认值为false（可以推断这个属性为Bool类型）。

// 默认情况下，任何新建的Bicycle实例都没有篮子。你可以在实例创建之后设置hasBasket为true。

let bicycle = Bicycle() // 创建一个Bicycle实例
bicycle.hasBasket = true

// 你也可以为Bicycle实例修改其继承过来的currentSpeed属性的值：

bicycle.currentSpeed = 15.0
println("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour


// 子类还可以继续被其它类继承。下面的例子创建了一个Bicycle的子类为双人自行车，叫tandem：
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

// Tandem从Bicycle继承所有属性和方法，而这些属性和方法是Bicycle从Vehicle继承而来的。Tandem子类也添加了一个存储属性叫currentNumberOfPassengers，默认值为0.

// 如果你创建了一个Tandem实例，你可以使用其任何的新的和继承过来的属性，并且可以获取继承自Vehicle来的只读description属性：

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
println("Tandem: \(tandem.description)")
//Tandem: traveling at 22.0 miles per hour


// 4. 重写 Overriding

  // 子类可以为继承来的实例方法(instance method),类方法(class method),实例属性(instance property),或附属脚本(subscript)提供自己定制的实现(implementation)，否则就继承来自父类的。 我们把这种行为叫重写(overriding)。

// 如果要重写某个特性,你需要在重写定义的前面加上 override 关键字。这么做,你就表明了你是想提供一个重写版本,而非错误地提供了一个相同的定义。意外的重写行为可能会导致不可预知的错误,任何缺少override关键字的重写都会在编译时被诊断为错误。

// override 关键字会提醒 Swift 编译器去检查该类的超类(或其中一个父类)是否有匹配重写版本的声明。这个检查可以确保你的重写定义是正确的。




// 4.1 访问超类的方法，属性及附属脚本 Accessing Superclass Methods, Properties, and Subscripts

/* 当你在子类中重写超类的方法,属性或附属脚本时,有时在你的重写版本中使用已经存在的超类实现会大有裨益。比如,你可以优化已有实现的行为,或在一个继承来的变量中存储一个修改过的值。

在合适的地方,你可以通过使用 super 前缀来访问超类版本的方法,属性或附属脚本:

    a. 在方法 someMethod 的重写实现中,可以通过super.someMethod()来调用超类版本的someMethod 方法。

    b. 在属性 someProperty 的 getter 或 setter 的重写实现中,可以通过 super.someProperty 来访问超类版本的 someProperty 属性。

    c. 在附属脚本的重写实现中,可以通过 super[someIndex]来访问超类版本中的相同附属脚本
*/


// 4.2 重写方法 Overriding Methods

  //在子类中,你可以重写继承来的实例方法或类方法,提供一个定制或替代的方法实现。

//  下面例子定义了一个Vehicle的新子类叫Train， 它重写了Train从Vehicle继承而来的makeNoise方法：

class Train: Vehicle {
    override func makeNoise() {
         println("Choo Choo")
    }
}

// 如果你创一个Train的实例并调用它的makeNoise方法，你会发现Train子类版本的方法被调用：
let train = Train()  // 创建一个实例
train.makeNoise()   // 调用makeNoise方法
//prints "Choo Choo"



// 4.3 重写属性 Overriding Properties
// 你可以重写继承来的实例属性或类属性,提供自己定制的 getter 和 setter,或添加属性观察器使重写的属性观察属性值什么时候发生改变。




// 4.4 重写属性的Getter和Setter - Overriding Property Getters and Setters

// 你可以提供定制的 getter(或 setter)来重写任意继承来的属性,无论继承来的属性是存储型的还是计算型的属性。子类并不知道继承来的属性是存储型的还是计算型的,它只知道继承来的属性会有一个名字和类型。你在重写一个属性时,必需将它的名字和类型都写出来。 这样才能使编译器去检查你重写的属性是与超类中同名同类型的属性相匹配的。

// 你可以将一个继承来的只读属性重写为一个读写属性,只需要你在重写版本的属性里提供 getter 和 setter 即可。但是,你不可以将一个继承来的读写属性重写为一个只读属性。

// 注意:如果你在重写属性中提供了 setter,那么你也一定要提供 getter。如果你不想在重写版本中的 getter 里修改继承来的属性值,你可以直接返回 super.someProperty 来返回继承来的值。

// 下面的例子定义了一个新的类叫Car，是Vehicle的子类。 Car类有一个新的存储属性叫gear，其默认值是1。Car类并且重写了继承自Vehicle的description属性，用来提供一个自定义描述来描述现在的挂档：

class Car: Vehicle {
    var gear = 1
    override var description: String { // 重写description属性
        return super.description + " in gear \(gear)"
    }
}

// 重写description先通过super.description调用，返回了Vehicle类的description属性。Car类版本的description加上一些额外的文本来描述现在挂档。
// 如果你创建一个Car类实例， 并设gear和currentSpeed值，你可以看见它的description属性返回Car类定制的描述：
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
println("Car: \(car.description)")

//Car: traveling at 25.0 miles per hour in gear 3



// 4.5 重写属性观察器 Overriding Property Observers

  // 你可以在属性重写中为一个继承来的属性添加属性观察器。这样一来,当继承来的属性值发生改变时,你就会被通知到,无论那个属性原本是如何实现的。 更多信息请看Property Observsers 章节。

// 注意:你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的,所以,为它们提供 willSet 或 didSet 实现是不恰当。

// 此外还要注意,你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化,并且你已经为那个属性提供了定制的 setter,那么你在 setter 中就可以观察到任何值变化了。

// 下面例子定义了一个新的类叫AutomaticCar， 是Car的一个子类。AutomaticCar类代表了自动变速箱的车， 会基于现行速度自动选择一个合适的挡：

class AutomaticCar: Car { // AutomaticCar 表示自动挡 汽车,它可以根据当前的速度自动选择合适的挡位。
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

//  任何时候你设定AutomaticCar实例的currentSpeed属性，属性的didSet属性观察器会合理设定实例的挂档属性。具体来说，属性观察期会用currentSpeed值除以10然后取整加1来选择一个挡。 速度为10 的挡是1， 而速度为35，挡为4.

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
println("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4


// 5. 防止重写 Preventing Overrides

// ￼你可以通过把方法,属性或附属脚本标记为 final 来防止它们被重写,只需要在声明关键字前加上final 特性即可。(例如:final var, final func, final class func, 以及 final subscript)

//如果你重写了 final了的方法,属性或附属脚本,在编译时会报错。在扩展中,你添加到类里的方法,属性或附属脚本也可以在扩展的定义里标记为 final。

//你可以通过在关键字 class 前添加final 特性(final class)来将整个类标记为 final 的,这样的类是不可被继承的,否则会报编译错误。
















