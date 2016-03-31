//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

/*-1-**********控制流**********/
//闭区间循环
for i in 0 ... 3 {
    print("i = \(i)")
}

print("--------------------")

//半开半闭区间循环
var index = 0
for _ in 0 ..< 2 { //不需要循环变量,用 _ 代替
    print("index = \(index++)")
}

print("--------------------")
//循环数组
let myArr = ["Jim", "Tom", "Cat"]
for value in myArr {//若value不需要,可用 _ 代替,那么这样就没有任何意义了
    print("name = \(value)")
}

print("--------------------")
for (index, value) in myArr.enumerate() {//同时获取下标和元素值
    print("index = \(index) = \(value)")
}
print("--------------------")

//枚举字典
let myDict = ["name":"Eric", "sex":"boy", "age":"25"]
for (key, value) in myDict {//同时获取key和value
    print("\(key): \(value)")
}

print("--------------------")

//循环字符串
let myStr = "business"
for c in myStr.characters {
    print(c)
}

//or
for var i=0; i < myStr.characters.count; i++ {
    if i == myStr.characters.count-1 {
        break
    }
    
    var startIndex = myStr.startIndex.advancedBy(i)
    var endIndex = myStr.startIndex.advancedBy(i+1)
    
//    var subStr = myStr.substringWithRange(Range(startIndex ... endIndex))//or
    var subStr = myStr.substringWithRange(Range(start: startIndex, end: endIndex))
    print("subStr = \(subStr)")
}

print("--------------------")

//switch
//可以有多个参数
//可以是字符串
//可以不需要break
//每个case后面必须有一天语句,否则编译失败
//尾部,加上 default: break
//case 可以使用参数(可位参数设置条件,用where),若都是参数,则不需要deafault:了


//1 - 使用字符串匹配
let indexArr = ["123", "abc"]

for index in indexArr {
    switch (index) {
        case "123":
            print("index1 = \(index)")
            
            //加上该语句,可以继续执行下一句
            //但后面必须有可执行的语句
            //该语句不可在default中使用
            fallthrough
        
    case "1234", "abc4":
        print("index2 = \(index)")
        break //有无都可以
        
    case "xxz", "abc":
        print("index3 = \(index)")
        break //有无都可以
        
        
    default:
        break
    }
}

//2 - 使用区间进行匹配
var price = 100

switch (index) {
case 0 ..< 50:
    print("折扣价 = \(price)")
case 50 ..< 100:
    print("正常价 = \(price)")
case 100 ... 150:
    print("新款价 = \(price)")
    
default:
    break
}

//3 - 使用元组进行匹配
let tuples = (1, 2, 3)

switch (tuples) {
case (_, 2, 1): //不需要元素, 可用 _ 代替
    print("2, 3")
//    fallthrough
    
    //值绑定
case (let index, 1, _):
    print("index = \(index)")
    
case (1, let x, let y) where x > 0 && x < 10: //用where再加一层判断
    print("x = \(x), y = \(y)")
case var (x, y, z):
    print("x = \(x), y = \(y), z = \(z)")
}

print("--------------------")
//控制流中使用continue和break
let needArr = [1, 2, 3, 4, 5];
for (index, value) in needArr.enumerate() {
    
    if index < 2 {
        continue //结束b循本次环,继续下一次循环 //只能用于循环语句,不能用于条件语句
    }
    
    print("\(index) = \(value)")
    
    if index == 3 {
        break //结束整个for循环 //只能结束当前层的for循环层
    }
}

print("--------------------")
//可跳转标签
var dataArr = [Int]()
MARK:
    for var i = 0; i < 5; i++ {
        
        dataArr.append(i)
        if dataArr.count == 20 {
            print(dataArr)
            break
        }
        
        if i == 4 {
            i = -1
            continue MARK
        }
        
        print("i = \(i)")
}
print("--------------------")
