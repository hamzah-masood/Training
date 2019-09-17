import UIKit

input = ["0    China",
         "1    Cuba",
         "2    -1",
         "3    Cuba",
         "4    -1",
         "5    -1",
         "6    Cuba",
         "7    Germany",
         "8    Germany",
         "9    China"]
//input = ["3",
//         "abc",
//         "abd",
//         "ab"]


func readLine() -> String? {
  if currentLine < input.endIndex {
    let inputLine = input[currentLine]
    currentLine += 1
    return inputLine
  } else {
    return nil
  }
}

let myOutput = readLine()
