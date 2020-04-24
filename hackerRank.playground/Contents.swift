import UIKit

var str = "Hello, playground"

//StairCase

//var n = 6
//
//for i in 0...n-1 {
//    for j in 0...n-1 {
//        if j < n-1-i {
//            print(" ", terminator:"")
//        }
//        else {
//            print("#", terminator:"")
//        }
//    }
//    print("")
//}

//Min Max
//var numberArray = [1,4,2,3,5]
//
//var newArray = numberArray.sorted()
//
//var min:Int = 0
//var max:Int = 0
//
//for i in 0..<numberArray.count-1 {
//    min += numberArray[i]
//}
//
//for i in 1..<numberArray.count {
//    max += numberArray[i]
//}
//
//print("\(min) \(max)")



//Birthday Candle
//
//var age = 4
//var candleArray = [3,2,1,3]
//print(candleArray.count)
//var blowout = 0
//var newArray = candleArray.sorted()
//
//var highNumber = newArray[age-1]
////print(highNumber)
//
//
//for candles in candleArray {
//    if candles == highNumber {
//        blowout += 1
//    }
//}
//print(blowout)


////Time Conversion
//var time = "07:05:45PM"
//
//var hourArray = time.components(separatedBy: ":")
//var secondArray = Array(time)
//var militaryTime = ""
//
//print(hourArray)
//
//
//    if time.contains("PM") {
//        let hour = Int(hourArray[0]) ?? 0
//
//        let updatedHour = hour + 12
//        print(updatedHour)
//
//        let newHour = String(updatedHour)
//        print("\(newHour):\(hourArray[1]):\(secondArray[6])\(secondArray[7])")
//
//        militaryTime = "\(newHour):\(hourArray[1]):\(secondArray[6])\(secondArray[7])"
//    }
//    else if time.contains("PM") && hourArray[0] == "12" {
//        militaryTime = "12:\(hourArray[1]):\(secondArray[6])\(secondArray[7])"
//    }
//    else if time.contains("AM") && hourArray[0] == "12" {
//        militaryTime = "00:\(hourArray[1]):\(secondArray[6])\(secondArray[7])"
//    }
//    else {
//        militaryTime = "\(hourArray[0]):\(hourArray[1]):\(secondArray[6])\(secondArray[7])"
//    }


//Student Grades
//var studentGrades = [73,67,38,33]
//var updatedGrades: [Int] = []
//
//for grade in studentGrades {
//    if grade < 38 {
//        updatedGrades.append(grade)
//    }
//    else if grade%5 == 3 || grade%5 == 4 {
//        var newGrade = 5 * (grade/5) + 5
//        updatedGrades.append(newGrade)
//    }
//    else {
//        updatedGrades.append(grade)
//    }
//}
//print(updatedGrades)

//Apple and Orange


class Foo {
    lazy var file: String = {
        defer { print("did make file") }
        sleep(3)
        return "Hello World"
    }()
    
    init() {
        print("did make instance of Foo")
    }
    
    func printFile() {
        print("started printing file")
        print(file)
        print("finished printing file")
    }
}


let foo = Foo()

print("trial 1")
foo.printFile()

print("\ntrial 2")
foo.printFile()
