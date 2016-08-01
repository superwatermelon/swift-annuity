//
//  SwiftAnnuityTests.swift
//  SwiftAnnuityTests
//
//  Created by Stuart Wakefield on 05/03/2016.
//  Copyright © 2016 Superwatermelon Limited. All rights reserved.
//

import XCTest
@testable import SwiftAnnuity

class SwiftAnnuityTests: XCTestCase {
    
    func testGetAmountFromPrincipal() {
        
        let annuity = Annuity()
        let principal = NSDecimalNumber(string: "100000")
        let rate = NSDecimalNumber(string: "0.03")
        let term = 25
        
        XCTAssertEqual(roundDownToInt(annuity.amount(principal, rate: rate, term: term, frequency: 1)), 5742)
        
    }
    
    func testGetPrincipalFromAmount() {
        
        let annuity = Annuity()
        let amount = NSDecimalNumber(string: "7500")
        let rate = NSDecimalNumber(string: "0.04")
        let term = 15
        
        XCTAssertEqual(roundDownToInt(annuity.principal(amount, rate: rate, term: term, frequency: 1)), 83387)
        
    }
    
    func testGetAmountFromPrincipalForMonthly() {
        
        let annuity = Annuity()
        let principal = NSDecimalNumber(string: "100000")
        let rate = NSDecimalNumber(string: "0.03")
        let term = 25
        let frequency = 12
        
        XCTAssertEqual(roundDownToInt(annuity.amount(principal, rate: rate, term: term, frequency: frequency)), 474)
        
    }
    
    func testGetPrincipalFromAmountForMonthly() {
        
        let annuity = Annuity()
        let amount = NSDecimalNumber(string: "620")
        let rate = NSDecimalNumber(string: "0.04")
        let term = 15
        let frequency = 12
        
        XCTAssertEqual(roundDownToInt(annuity.principal(amount, rate: rate, term: term, frequency: frequency)), 83819)
        
    }
    
    func roundDownToInt(value: NSDecimalNumber) -> Int {
        return value.decimalNumberByRoundingAccordingToBehavior(
            NSDecimalNumberHandler(
                roundingMode: .RoundDown,
                scale: 0,
                raiseOnExactness: false,
                raiseOnOverflow: false,
                raiseOnUnderflow: false,
                raiseOnDivideByZero: false
            )
        ).integerValue
    }
    
}
