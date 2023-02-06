//
//  switch_test.swift
//  swift_for_function
//
//  Created by ByteDance on 2023/1/30.
//

import Foundation

func switchTest() {
    // 基础用法
    let someCharacter: Character = "z"
    switch someCharacter {
    case "a":
        print("The first letter of the alphabet")
    case "z":
        print("The last letter of the alphabet")
    default:
        print("Some other character")
    }
    
    // 使用区间运算符
    let approximateCount = 8
    let naturalCount: String
    switch approximateCount {
    case 0:
        naturalCount = "no"
    case 1..<5:
        naturalCount = "a few"
    case 5..<12:
        naturalCount = "several"
    case 12..<100:
        naturalCount = "dozens of"
    case 100..<1000:
        naturalCount = "hundreds of"
    default:
        naturalCount = "many"
    }
    print("There are \(naturalCount).")
    
    // 元组中的元素可以是值，也可以是区间。另外，使用下划线（_）来匹配所有可能的值。
    let somePoint = (1, 1)
    switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")
    case (_, 0):
        print("\(somePoint) is on the x-axis")
    case (0, _):
        print("\(somePoint) is on the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")
    default:
        print("\(somePoint) is outside of the box")
    }
    
    // case 分支允许将匹配的值声明为临时常量或变量, 称为值绑定
    // 这里省略了default，因为已经完备
    let anotherPoint = (2, 0)
    switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let (x, y):
        print("somewhere else at (\(x), \(y))")
    }
    
    // 使用 where 语句来判断额外的条件
    // 一个分支可以写多个匹配条件
    let yetAnotherPoint = (1, -1)
    switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) from the origin")
    }
    
}
