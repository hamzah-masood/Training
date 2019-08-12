//
//  FilterClosureProjectTests.swift
//  FilterClosureProjectTests
//
//  Created by MAC on 7/30/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import XCTest
@testable import FilterClosureProject

final class FilterClosureProjectTests: XCTestCase {
  
  func testFilterFunction() {
    let assignment = FilterSortClosureAssignment()
    let emptyArray: [Int] = []
    //No matter what is returned in closure, if empty array is passed in, it should remain empty
    XCTAssertEqual(assignment.filter(array: emptyArray) { _ in true }, emptyArray)
    XCTAssertEqual(assignment.filter(array: emptyArray) { _ in false }, emptyArray)
    
    let testArray = [1, 2, 3, 4, 5, 6]
    //If always passes true, nothing should be filtered
    XCTAssertEqual(assignment.filter(array: testArray) { _ in true }, testArray)
    //If always passes false, everything should be filtered
    XCTAssertEqual(assignment.filter(array: testArray) { _ in false }, [])
    
    let bigTestArray = Array(1...100)
    XCTAssertEqual(assignment.filter(array: bigTestArray) { return $0 % 2 == 0 }, bigTestArray.filter { return $0 % 2 == 0 })
  }
  
  func testSortFunction() {
    let assignment = FilterSortClosureAssignment()
    
    let emptyArray: [Int] = []
    //No matter what is returned in closure, if empty array is passed in, it should remain empty
    XCTAssertEqual(assignment.sort(array: emptyArray) { _, _ in true }, emptyArray)
    XCTAssertEqual(assignment.sort(array: emptyArray) { _, _ in false }, emptyArray)
    
    let testArray = [1, 5, 7, 8, 9, 90, 11]
    XCTAssertEqual(assignment.sort(array: testArray) { $0 > $1 }, testArray.sorted { $0 > $1 })
    XCTAssertEqual(assignment.sort(array: testArray) { $0 < $1}, testArray.sorted { $0 < $1 })
  }
}
