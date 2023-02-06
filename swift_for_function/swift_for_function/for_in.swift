//
//  for_in.swift
//  swift_for_function
//
//  Created by ByteDance on 2023/1/30.
//

import Foundation

/*
 for-in 使用demo
*/
func testForIn() -> Void {
    // 基础语法
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for name in names {
        print("Hello, \(name)!")
    }

    // 显示使用元组来承接遍历变量
    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
    for (animalName, legCount) in numberOfLegs {
        print("\(animalName)s have \(legCount) legs")
    }

    // 隐式使用元组来承接遍历变量
    for animal in numberOfLegs {
        print("\(animal.key)s have \(animal.value) legs")
    }

    // enumerate()获得index
    for (index, animal) in numberOfLegs.enumerated() {
        print("\(index): '\(animal)'")
    }

    // 倒叙遍历
    for (animalName, legCount) in numberOfLegs.reversed() {
        print("\(animalName)s have \(legCount) legs")
    }

    // 范围遍历--闭区间
    for index in 1...5 {
        print("\(index) times 5 is \(index * 5)")
    }

    // 范围遍历--忽略遍历变量
    let base = 3
    let power = 10
    var answer = 1
    for _ in 1...power {
        answer *= base
    }
    print("\(base) to the power of \(power) is \(answer)")

    // stride(from:to:by)--开区间遍历
    let minutes = 10
    let minuteInterval = 5
    for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
        // 每5分钟渲染一个刻度线（0, 5）
        print("\(tickMark)")
    }

    // stride(from:through:by:)--闭区间遍历
    let hours = 12
    let hourInterval = 3
    for tickMark in stride(from: 3, through: hours, by: hourInterval) {
        // 每3小时渲染一个刻度线（3, 6, 9, 12）
        print("\(tickMark)")
    }
}
