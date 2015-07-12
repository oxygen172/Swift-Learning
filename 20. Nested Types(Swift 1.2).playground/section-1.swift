// Playground - noun: a place where people can play

import UIKit

// 1. Nested Types 类型嵌套
/*
枚举类型常被用于实现特定类或结构体的功能。同样地,也能够在有多种变量类型的环境 中方便地定义通用类或结构体。为了实现这种功能,Swift 允许你定义类型嵌套,可以在枚 举类型、类和结构体中定义支持嵌套的类型。

要在一个类型中嵌套另一个类型,将需要嵌套的类型的定义写在被嵌套类型的区域{}内,而且可以根据需要定义多级嵌套。
*/


// 2. Nested Types in Action 类型嵌套实例
// 下面这个例子定义了一个结构体 BlackjackCard,用来模拟 BlackjackCard(游戏:二十一点)中的扑克牌点数。BlackjackCard 结构体包含 2 个嵌套定义的枚举类型 Suit 和 Rank。

// 在 BlackjackCard 规则中,Ace 牌可以表示 1 或者 11,Ace 牌的这一特征用一个嵌套在枚 举型 Rank 中的结构体 Values 来表示。

struct BlackjackCard {
    
    //nested Suit enumeration
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }// 枚举型的 Suit 用来描述扑克牌的四种花色,并分别用一个 Character 类型的值代表花色符 号。

    
    // nested Rank enumeration 
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        // 枚举型的 Rank 用来描述扑克牌从 Ace~10,J,Q,K,13 张牌,并分别用一个 Int 类型的值表示 牌的面值(这个 Int 类型的值不适用于 Ace,J,Q,K 的牌)。

        struct Values {
            let first: Int, second: Int?
        } // 枚举型 Rank 在自己内部定义了一个嵌套结构体 Values。这个结构体包含两个变量,只有 Ace 有两个数值,其余牌都只有一个数值。结构体 Values 中定义了两个属性:

        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)

            }
            
        }// Rank 还定义了一个计算属性 values,这个计算属性会根据牌的面值,用适当的数值去初始化 Values 实例,并赋值给 values。对于 J,Q,K,Ace 会使用特殊数值,对于数字面值的牌使用 Int 类型的值。
    }


    // BlackjackCard properties and methods

    let rank: Rank, suit: Suit
     // BlackjackCard 结构体自身有两个属性—rank 与 suit

    var description: String {  // 计算属性
        var output = "suit is \(suit.rawValue),"
            output += " value is \(rank.values.first)"
            if let second = rank.values.second {
                output += " or \(second)"
        }
        return output
    } // description 属性使用 rank 和 suit 中的内容来构建对这张扑克牌名字和数值的 描述,并且使用可选类型来检查是否存在第二个值,若存在,则在原有的描述中增加对第 二数值的描述。
}


//因为 BlackjackCard 是一个没有自定义构造函数的结构体,正如《Memberwise Initializers for Structure Types》中所描述的,BlackjackCard 结构体有默认的成员构造函数,所以你可以使用默认的 initializer 去初始化新的常量 theAceOfSpades:

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
println("theAceOfSpades: \(theAceOfSpades.description)")
//  prints "theAceOfSpades: suit is ♠, value is 1 or 11"

// 尽管 Rank 和 Suit 嵌套在 BlackjackCard 中,但仍可被引用,所以在初始化实例时能够通过枚举类型中的成员名称(.Ace 和 .Spades)单独引用。在上面的例子中,description 属性能正确地输出 theAceOfSpades 有 1 和 11 两个值。




// 3. Referring to Nesting Types 类型嵌套的引用
/* 
//在外部对嵌套类型的引用,是以被嵌套类型的名字为前缀,加上所要引用的属性名:


let heartsSymbol = BlackjackCard.Suit.Hearts.toRaw()
// heartsSymbol is "♡"

// ￼￼对于上面这个例子,这样做可以使 Suit, Rank, 和 Values 的名字尽可能的简短,因为它们 的名字会自然地由被定义的上下文来限定。

*/













