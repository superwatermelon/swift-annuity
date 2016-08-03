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
    
    func testGetPaymentFromPrincipal() {
        
        
        let principal = NSDecimalNumber(string: "100000")
        let rate = NSDecimalNumber(string: "0.03")
        let term = 25
        let annuity = SwiftAnnuity(
            principal: principal,
            rate: rate,
            term: term
        )
        
        // Basic sanity checks
        XCTAssertEqual(annuity.principal, principal)
        XCTAssertEqual(annuity.rate, rate)
        XCTAssertEqual(annuity.term, term)
        XCTAssertEqual(annuity.frequency, 1)
        XCTAssertEqual(annuity.paymentCount, term)
        
        XCTAssertEqual(roundDownToInt(annuity.total), 143569)
        
    }
    
    func testGetTotalFromPrincipal() {
        
        let principal = NSDecimalNumber(string: "100000")
        let rate = NSDecimalNumber(string: "0.03")
        let term = 25
        let annuity = SwiftAnnuity(
            principal: principal,
            rate: rate,
            term: term
        )
        
        // Basic sanity checks
        XCTAssertEqual(annuity.principal, principal)
        XCTAssertEqual(annuity.rate, rate)
        XCTAssertEqual(annuity.term, term)
        XCTAssertEqual(annuity.frequency, 1)
        XCTAssertEqual(annuity.paymentCount, term)
        
        XCTAssertEqual(roundDownToInt(annuity.payment), 5742)
        
    }
    
    func testGetTotalFromPayment() {
        
        let payment = NSDecimalNumber(string: "7500")
        let rate = NSDecimalNumber(string: "0.04")
        let term = 15
        let annuity = SwiftAnnuity(
            payment: payment,
            rate: rate,
            term: term
        )
        
        // Basic sanity checks
        XCTAssertEqual(annuity.payment, payment)
        XCTAssertEqual(annuity.rate, rate)
        XCTAssertEqual(annuity.term, term)
        XCTAssertEqual(annuity.frequency, 1)
        XCTAssertEqual(annuity.paymentCount, term)

        XCTAssertEqual(annuity.total, NSDecimalNumber(string: "112500"))
        
    }
    
    func testGetPrincipalFromPayment() {
        
        let payment = NSDecimalNumber(string: "7500")
        let rate = NSDecimalNumber(string: "0.04")
        let term = 15
        let annuity = SwiftAnnuity(
            payment: payment,
            rate: rate,
            term: term
        )
        
        // Basic sanity checks
        XCTAssertEqual(annuity.payment, payment)
        XCTAssertEqual(annuity.rate, rate)
        XCTAssertEqual(annuity.term, term)
        XCTAssertEqual(annuity.frequency, 1)
        XCTAssertEqual(annuity.paymentCount, term)
        
        XCTAssertEqual(roundDownToInt(annuity.principal), 83387)
        
    }
    
    func testGetPrincipalFromTotal() {
        
        let total = NSDecimalNumber(string: "600000")
        let rate = NSDecimalNumber(string: "0.05")
        let term = 15
        let annuity = SwiftAnnuity(
            total: total,
            rate: rate,
            term: term
        )
        
        // Basic sanity checks
        XCTAssertEqual(annuity.total, total)
        XCTAssertEqual(annuity.rate, rate)
        XCTAssertEqual(annuity.term, term)
        XCTAssertEqual(annuity.frequency, 1)
        XCTAssertEqual(annuity.paymentCount, term)
        
        XCTAssertEqual(roundDownToInt(annuity.principal), 415186)
        
    }
    
    func testGetPaymentFromTotal() {
        
        let total = NSDecimalNumber(string: "600000")
        let rate = NSDecimalNumber(string: "0.05")
        let term = 15
        let annuity = SwiftAnnuity(
            total: total,
            rate: rate,
            term: term
        )
        
        // Basic sanity checks
        XCTAssertEqual(annuity.total, total)
        XCTAssertEqual(annuity.rate, rate)
        XCTAssertEqual(annuity.term, term)
        XCTAssertEqual(annuity.frequency, 1)
        XCTAssertEqual(annuity.paymentCount, term)
        
        XCTAssertEqual(roundDownToInt(annuity.payment), 40000)
        
    }
    
    func testGetAmountFromPrincipalForMonthly() {
        
        let principal = NSDecimalNumber(string: "100000")
        let rate = NSDecimalNumber(string: "0.03")
        let term = 25
        let frequency = 12
        let annuity = SwiftAnnuity(
            principal: principal,
            rate: rate,
            term: term,
            frequency: frequency
        )
        
        // Basic sanity checks
        XCTAssertEqual(annuity.principal, principal)
        XCTAssertEqual(annuity.rate, rate)
        XCTAssertEqual(annuity.term, term)
        XCTAssertEqual(annuity.frequency, frequency)
        XCTAssertEqual(annuity.paymentCount, 300)
        
        XCTAssertEqual(roundDownToInt(annuity.payment), 474)
        
    }
    
    func testGetPrincipalFromPaymentForMonthly() {
        
        let payment = NSDecimalNumber(string: "620")
        let rate = NSDecimalNumber(string: "0.04")
        let term = 15
        let frequency = 12
        let annuity = SwiftAnnuity(
            payment: payment,
            rate: rate,
            term: term,
            frequency: frequency
        )
        
        // Basic sanity checks
        XCTAssertEqual(annuity.payment, payment)
        XCTAssertEqual(annuity.rate, rate)
        XCTAssertEqual(annuity.term, term)
        XCTAssertEqual(annuity.frequency, frequency)
        XCTAssertEqual(annuity.paymentCount, 180)
        
        XCTAssertEqual(roundDownToInt(annuity.principal), 83819)
        
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
