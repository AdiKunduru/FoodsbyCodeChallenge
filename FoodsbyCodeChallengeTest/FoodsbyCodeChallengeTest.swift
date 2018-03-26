//
//  FoodsbyCodeChallengeTest.swift
//  FoodsbyCodeChallengeTest
//
//  Created by Aditya Nelakonda on 3/25/18.
//  Copyright © 2018 Aditya Nelakonda. All rights reserved.
//

import XCTest
@testable import FoodsbyCodeChallenge

class FoodsbyCodeChallengeTest: XCTestCase {
    
    var food = Foodbsy()
    let vc = ViewController()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        food.loadData()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
       let index = vc.menu.selectedSegmentIndex
        XCTAssert(index != 0, "The Menu does not have a selected Index")
        
        let rows = vc.deliveryTable.numberOfRows(inSection: 1)
        XCTAssert(rows > 0, "The table does not have data")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
           
            food.sortData(compareDay: "Monday")
         
            food.sortData(compareDay: "Tuesday")
        
            food.sortData(compareDay: "Wednesday")
        
            food.sortData(compareDay: "Thursday")
       
            food.sortData(compareDay: "Friday")
    
            food.sortData(compareDay: "Saturday")
     
            food.sortData(compareDay: "Sunday")
     
        }
    }
    
}
