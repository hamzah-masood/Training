import UIKit

var str = "Hello, playground"


var k: Int

struct HugeNumber {
  var array: [Int] = []
  var lastDigit: Int
  
  init(k: Int) {
    var currentNumber = k
    repeat {
      lastDigit = currentNumber % 10
      array.append(lastDigit)
      currentNumber = currentNumber/10
      
    }while currentNumber != 0
      
  }
  
}

func factorial(k: Int) {
  var sum: Int = 1
  //var result = [1]
  
  for i in 1...k {
    sum = sum * i
//    result = result.map{ $0 * 1}
   // sum = HugeNumber(k: sum)
  }
  print(sum)
}

factorial(k: 20)

