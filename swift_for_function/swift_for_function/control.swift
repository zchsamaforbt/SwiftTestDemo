//
//  control.swift
//  swift_for_function
//
//  Created by ByteDance on 2023/2/4.
//

import Foundation

// Swift control
// continue
// break
// fallthrough
// guard
// defer

func control() {
    // continue和break基础使用和其他语言相同
    let puzzleInput = "great minds think alike"
    var puzzleOutput = ""
    for character in puzzleInput {
        switch character {
        case "a", "e", "i", "o", "u", " ":
            continue
        case "r":
            break
        default:
            puzzleOutput.append(character)
        }
    }
    print(puzzleOutput)
    
    // 循环语句或者条件语句可以加标签，break或者continue时可以指定对应statement
    outer: for i in 1...4 {
        for k in i...4 {
            if k == 3 {
                continue outer // 重新开始主循环
            }
            if i == 3 {
                break outer // 会直接退出主循环
            }
        }
    }
    
    // fallthrough 关键字不会检查它下一个将会落入执行的 case 中的匹配条件,直接继续执行下一分支
    let integerToDescribe = 5
    var description = "The number \(integerToDescribe) is"
    switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += " a prime number, and also"
        fallthrough
    default:
        description += " an integer."
    }
    print(description)
    
    // 可以使用 guard 语句来要求条件必须为真，以执行 guard 语句后的代码。
    // 不同于 if 语句，一个 guard 语句总是有一个 else 从句，如果条件不为真则执行 else 从句中的代码。
    func greet(person: [String: String]) {
        guard let name = person["name"] else {
            return
        }

        print("Hello \(name)!")

        guard let location = person["location"] else {
            print("I hope the weather is nice near you.")
            return
        }

        print("I hope the weather is nice in \(location).")
    }

    greet(person: ["name": "John"])
    greet(person: ["name": "Jane", "location": "Cupertino"])
    
    // 用来定义以任何方式（抛错误、return等）离开代码块前必须要执行的代码，这块代码将延迟至当前作用域结束之前执行。
    // 可以嵌套，先进后出
    let isAdd = true
    func test() {
        print("run test 1")
        
        defer {
            print("run defer 5")
        }
        
        // defer可以嵌套
        defer {
            // 执行这一层作用域时同样也是以先进后出的顺序去执行里面的子defer
            defer {
                print("run defer 4")
            }
            
            defer {
                print("run defer 3")
            }
            
            print("run defer 2")
        }

        // defer可以被阻拦添加
        guard isAdd else { return }
        
        defer {
            print("run defer 1")
        }
        
        print("run test 2")
    }
    test()
}
