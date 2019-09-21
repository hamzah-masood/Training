//
//  FilterSortClosureAssignment.swift
//  FilterClosureProject
//
//  Created by MAC on 7/30/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct FilterSortClosureAssignment {
    func sort(array: [Int], sortClosure: ( Int, Int) -> Bool ) -> [Int]{
 
        
       
        
        var arrayTest: [Int] = array
        //var arrayTest2: [Int] = []
      
        var temp: Int = 0
    
        
         guard !array.isEmpty else{return []}
        
        //arrayTest[j] < arrayTest[j-1]
        for i in 0..<arrayTest.count - 1 {
            for j in i + 1..<arrayTest.count {
                if sortClosure(arrayTest[j] , arrayTest[i]){
                    temp = arrayTest[i]
                    arrayTest[i] = arrayTest[j]
                    arrayTest[j] = temp
                    
                }
            
        }
        
    }

    return arrayTest
        
        
  }
  
  func filter(array: [Int], filterClosure: (Int) -> Bool) -> [Int] {
    //TODO: Students fill out this function
    var arrayTest: [Int] = []
    
    for element in array{
        if filterClosure(element){
            arrayTest.append(element)
        }
    }
    
    return arrayTest

  }
  
  func test() {
    //Students may run tests here to make sure that theit functions work as expected.
    print(sort(array: [10,12,4,121,42,1,5]) {$0 > $1})
    

  }
}
