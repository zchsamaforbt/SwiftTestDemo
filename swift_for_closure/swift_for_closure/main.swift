//
//  main.swift
//  swift_for_closure
//
//  Created by ByteDance on 2023/2/6.
//

import Foundation

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// 对names进行排序

// 1.普通函数实现
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// 2.标准格式闭包实现
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 3.使用类型推荐
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

// 4.单行表达式闭包省略return
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

// 5.参数名称缩写
reversedNames = names.sorted(by: { $0 > $1 } )

// 6.使用重载运算符方法
reversedNames = names.sorted(by: >)

// 7.尾随闭包
reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted { $0 > $1 }

// 值捕获--闭包可以在其被定义的上下文中捕获常量或变量。
// 即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// 两种方式获得的结果并不一样
// 1.
let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
// 2.
print(makeIncrementer(forIncrement: 10)())
print(makeIncrementer(forIncrement: 10)())

// 使用捕获列表将变量作为常量拷贝
func demo() -> () -> Void {
    var value = 42
    print("before closure: \(value)")
    let insideClosure = {
        [constValue = value] in
        print("inside closure: \(constValue)")
    }
    value = 1337
    print("after closure: \(value)")
    return insideClosure
}
demo()()

// 逃逸闭包--@escaping关键字
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } //不能省略self
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x) // 打印出“200”

completionHandlers.first?()
print(instance.x) // 打印出“100”

// 自动闭包--这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// 打印出“5”

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// 打印出“5”

print("Now serving \(customerProvider())!")
// 打印出“Now serving Chris!”
print(customersInLine.count)

// 自动闭包可以作为参数传递，且可以使用@autoclosure关键字，直接传递表达式
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
