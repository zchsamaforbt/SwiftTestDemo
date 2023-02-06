//
//  function.swift
//  swift_for_function
//
//  Created by ByteDance on 2023/2/5.
//

import Foundation

func function_demo() {
    // 标准形式
    func greet(person: String) -> String {
        return "Hello again, " + person + "!"
    }
    print(greet(person: "Anna"))
    
    // 无参和多参形式
    func sayHelloWorld() -> String {
        return "hello, world"
    }
    
    func greet(person: String, alreadyGreeted: Bool) -> String {
        return greet(person: person)
    }
    
    // 使用元组作为复合返回值
    // 返回值可以是可选类型，在使用时用if let解包
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
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
    if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
        print("min is \(bounds.min) and max is \(bounds.max)")
    }
    
    // 可以在参数名称前指定它的参数标签
    // 默认情况下，函数参数使用参数名称来作为它们的参数标签
    // 不希望使用时可以使用 _ 忽略
    func greet(person: String, from hometown: String) -> String {
        return "Hello \(person)!  Glad you could visit from \(hometown)."
    }
    print(greet(person: "Bill", from: "Cupertino"))
    
    // 通过在变量类型名后面加入（...）的方式来定义可变参数
    func arithmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    print(arithmeticMean(1, 2, 3, 4, 5))
    
    // swift5.4之后，可以接受多个可变参数
    // 可变参数后面的下一个参数应该有一个参数标签
    func showGameInfo(_ players: String..., points: Int..., fouls: Int...) {
        for i in 0..<players.count {
            print("""
                Player \(players[i])
                scored \(i < points.count ? points[i] : 0) points
                and commited \(i < fouls.count ? fouls[i] : 0) fouls.
                """)
        }
    }
     
    print(showGameInfo("John", "Tom", "Max", "Ben", "Matt",
                 points: 8, 4, 0, 4,
                 fouls: 3, 2))
    
    // 输入输出参数，使用inout关键字
    // 只能传递变量给输入输出参数
    // 输入输出参数，可以在函数内改变函数外变量的值
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    var someInt = 3
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
    print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
    
    // 函数作为类型变量来使用
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    // 1.作为变量赋值
    let _: (Int, Int) -> Int = addTwoInts
    
    // 2.作为参数类型
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a, b))")
    }
    printMathResult(addTwoInts, 3, 5)
    
    // 3.作为返回类型
    func chooseStepFunction(backward: Bool) -> (Int, Int) -> Int {
        return backward ? addTwoInts : multiplyTwoInts
    }
    
    // 上面定义的所有函数都是函数function_demo()的内部嵌套函数
    // 默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数调用。
    // 一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用。
}
