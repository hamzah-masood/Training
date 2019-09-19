//
//  ProblemSolver.swift
//  TestProject
//
//  Created by MAC on 6/4/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

class ProblemSolver {
  var input = ["4",
               "12    5",
               "3    6",
               "17    13",
               "8    6"] {
    didSet {
      currentLine = 0
    }
  }
  
  var currentLine = 0
  
  func solveAllProblems() {
    solveFirstProblem()
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
    solveSecondProblem()
//    input = ["2",
//             "acd",
//             "abc"]
//    input = ["2",
//             "abc",
//             "abcd"]
    input = ["3",
             "abc",
             "abd",
             "ab"]
    solveThirdProblem()
  }
  
  func readLine() -> String? {
    if currentLine < input.endIndex {
      let inputLine = input[currentLine]
      currentLine += 1
      return inputLine
    } else {
      return nil
    }
  }
  /*
   General Notes: This coding challenge is a coding challenge from a REAL interview coding challenge. That challenge uses similar techniques that are used in HackerRank challenges. It has been replicated here as best as we can.
   
   Note that you can directly access the input. However, you should use the readLine() function instead. This will read each line of the input, if there is one left. If there is no next line, it will return nil.
   
   All output should be printed onto the console, using the print function.
   
   Any implementation that accesses the inputs directly will be counted incorrect, even if the solution is correct.
   */
  
  /*
   First Problem:
   The first line of the input will tell you how many lines of input there are following the first line.
   
   Each subsequent line of input will consist of a pair of numbers, separated by space.
   
   Your goal is to find the least common multiple(LCM), and what you have to multiply each of the numbers in the pair to get that multiple.
   
   Input:
   4
   12    5
   3    6
   17    13
   8    6
   
   Output:
   12  5  60  5  12
   3  6  6  2  1
   17  13  221  13  17
   8  6  24  3  4
   */
  func solveFirstProblem() {
    //TODO: Finish Implementation
    let amountOfLines: Int = Int(readLine() ?? "") ?? 0//: Int = Int(input[0]) ?? 0
    var arrayOfNumbers: [String] = []

    for _ in 0...amountOfLines {
      let myInput = readLine()
      let unwrappedInput = myInput ?? ""
      var seperatedString = myInput?.components(separatedBy: "    ")
      let firstNumber = Int(seperatedString?[0] ?? "")
      let secondNumber = Int(seperatedString?[1] ?? "")
      
      let LCM = getLCM(num1: firstNumber ?? 1, num2: secondNumber ?? 1)
      let lowestCommonMultiple = String(LCM)
      
      let firstMultiplier = findMultiplier(num1: firstNumber ?? 1, num2: LCM )
      let secondMultiplier = findMultiplier(num1: secondNumber ?? 1, num2: LCM)
      
      let finalString = "\(unwrappedInput) \(lowestCommonMultiple) \(firstMultiplier) \(secondMultiplier)"
      arrayOfNumbers.append(finalString)
    }
    arrayOfNumbers.removeLast()
    
    for element in arrayOfNumbers {
      print(element)
    }
  }
  
  func getGCD(num1: Int, num2: Int) -> Int {
  if num2 == 0 {
    
    return num1
  } else {
    return getGCD(num1: num2, num2: num1 % num2)
    }
  }

  func getLCM(num1: Int, num2: Int) -> Int {
    return num1 * num2 / getGCD(num1: num1, num2: num2)
  }
  
  func findMultiplier(num1: Int, num2: Int) -> Int {
    
    return num2/num1
  }
  
  /*
   Second Problem
   
   The input will consist of a number of lines that will have pairs of numbers and values. The values will either be the name of a country, or -1
   
   Your goal is to count the number of times each country appears in the list.
   
   Input:
   0    China
   1    Cuba
   2    -1
   3    Cuba
   4    -1
   5    -1
   6    Cuba
   7    Germany
   8    Germany
   9    China
   
   Output:
   China,2
   Cuba,3
   Germany,2
   */
  func solveSecondProblem() {
    //TODO: Finish Implementation
    var dictionaryOfCountries: [Int: String] = [:]
    var arrayOfCountries: [String] = []
    var answerDictionary: [String: Int] = [:]
    
    for i in 0...input.count {
      let myInput = readLine()
      var seperatedString = myInput?.components(separatedBy: "    ")
      let country: String = seperatedString?[1] ?? ""
      dictionaryOfCountries[i] = country
      arrayOfCountries.append(country)
      }
      
      for item in arrayOfCountries {
        answerDictionary[item] = (answerDictionary[item] ?? 0) + 1
      }
      answerDictionary.removeValue(forKey: "-1")
      answerDictionary.removeValue(forKey: "")
    
      for (key, value) in answerDictionary {
        print("\(key), \(value)")
      }

  }
  
  /*
   Third Problem:
   
   The first line of input will be how many lines of inputs you are to consider. The subsequent lines of inputs consist of a single string per line.
   
   Your goal is to find the number of common characters from the beginning. For example, abc and abcd would print out 3, since they both start with abc, which is 3 characters. acd and abc would print out 1. Even though it has 2 characters in common, there is only one common character starting from the beginning, a.
   
   Input:
   abc
   abd
   ab
   
   Output:
   2
   */
  func solveThirdProblem() {


    
    let amountOfLines: Int = Int(readLine() ?? "") ?? 0//: Int = Int(input[0]) ?? 0
    var wordArray: [String] = []
    var finalAnswer = 0
    
    for _ in 0...amountOfLines - 1{
      let myInput = readLine()
      let unwrappedInput = myInput ?? ""
      wordArray.append(unwrappedInput)
    }
    let min = wordArray.min() ?? ""
    var finalword: String = ""
    wordArray.removeAll() {$0 == min}

    for word in wordArray {
      for eachElement in word {
        for index in 0...Array(min).count - 1 {

          if Array(min)[index] == Array(word)[index] {
          if Array(min)[index] == eachElement {
            finalword.append(eachElement)
            break
            }
          }
        }
      }
      finalAnswer = finalword.count
      finalword = ""
    }
    print(finalAnswer)
  }
}
