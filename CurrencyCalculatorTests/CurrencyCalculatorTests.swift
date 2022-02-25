//
//  CurrencyCalculatorTests.swift
//  CurrencyCalculatorTests
//
//  Created by Morenikeji on 2/24/22.
//

import XCTest
//@testable import CurrencyCalculator

class CurrencyCalculatorTests: XCTestCase {
    //var sut:ConverterVC!

    static var calculatedValue: Double = 0

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //try super.setUpWithError()
        
        CurrencyCalculatorTests.calculatedValue = computeCurrencyConversion()
        //CurrencyCalculatorTests.calculatedValue = sut.computeCurrencyConversion(value: 4.5678)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
     
        //print("success \(computeCurrencyConversion())")
        print("success \(CurrencyCalculatorTests.calculatedValue)")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //compute currency conversion
    func computeCurrencyConversion() -> Double {
        let actualRate = 463.958
        let baseRate = 2.00

        let computedRate = Double(actualRate * baseRate)

        return computedRate
    }

}
