//
//  SwiftAnnuity.swift
//  SwiftAnnuity
//
//  Created by Stuart Wakefield on 05/03/2016.
//  Copyright © 2016 Superwatermelon Limited. All rights reserved.
//

import Foundation
import SwiftDecimalNumber

extension Int {
    
    func toDecimalNumber() -> NSDecimalNumber {
        return NSDecimalNumber(decimal: NSNumber(value: self as Int).decimalValue)
    }
    
}

class AnnuityPrincipalFromPayment: AnnuityPrincipal {
    
    private let payment: NSDecimalNumber
    private let rate: NSDecimalNumber
    private let term: Int
    private let frequency: Int
    
    lazy var value: NSDecimalNumber = {
        return SwiftAnnuity.getPrincipal(
            payment: self.payment,
            rate: self.rate,
            term: self.term,
            frequency: self.frequency
        )
    }()
    
    init(payment: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int = 1) {
        self.payment = payment
        self.rate = rate
        self.term = term
        self.frequency = frequency
    }
    
}

class AnnuityPrincipalFromTotal: AnnuityPrincipal {
    
    private let total: NSDecimalNumber
    private let rate: NSDecimalNumber
    private let term: Int
    private let frequency: Int
    
    lazy var value: NSDecimalNumber = {
        return SwiftAnnuity.getPrincipal(
            total: self.total,
            rate: self.rate,
            term: self.term,
            frequency: self.frequency
        )
    }()
    
    init(total: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int = 1) {
        self.total = total
        self.rate = rate
        self.term = term
        self.frequency = frequency
    }
    
}

class AnnuityPrincipalValue: AnnuityPrincipal {
    
    let value: NSDecimalNumber
    
    init(value: NSDecimalNumber) {
        self.value = value
    }
    
}

class AnnuityPaymentFromPrincipal: AnnuityPayment {
    
    private let principal: NSDecimalNumber
    private let rate: NSDecimalNumber
    private let term: Int
    private let frequency: Int
    
    lazy var value: NSDecimalNumber = {
        return SwiftAnnuity.getPayment(
            principal: self.principal,
            rate: self.rate,
            term: self.term,
            frequency: self.frequency
        )
    }()
    
    init(principal: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int) {
        self.principal = principal
        self.rate = rate
        self.term = term
        self.frequency = frequency
    }
    
}

class AnnuityPaymentFromTotal: AnnuityPayment {
    
    private let total: NSDecimalNumber
    private let term: Int
    private let frequency: Int
    
    lazy var value: NSDecimalNumber = {
        return SwiftAnnuity.getPayment(
            total: self.total,
            term: self.term,
            frequency: self.frequency
        )
    }()
    
    init(total: NSDecimalNumber, term: Int, frequency: Int) {
        self.total = total
        self.term = term
        self.frequency = frequency
    }
    
}

class AnnuityPaymentValue: AnnuityPayment {
    
    let value: NSDecimalNumber
    
    init(value: NSDecimalNumber) {
        self.value = value
    }
    
}

class AnnuityTotalFromPayment: AnnuityTotal {
    
    private let payment: NSDecimalNumber
    private let term: Int
    private let frequency: Int
    
    lazy var value: NSDecimalNumber = {
        return SwiftAnnuity.getTotal(
            payment: self.payment,
            term: self.term,
            frequency: self.frequency
        )
    }()
    
    init(payment: NSDecimalNumber, term: Int, frequency: Int) {
        self.payment = payment
        self.term = term
        self.frequency = frequency
    }
    
}

class AnnuityTotalFromPrincipal: AnnuityTotal {
    
    private let principal: NSDecimalNumber
    private let rate: NSDecimalNumber
    private let term: Int
    private let frequency: Int
    
    lazy var value: NSDecimalNumber = {
        return SwiftAnnuity.getTotal(
            principal: self.principal,
            rate: self.rate,
            term: self.term,
            frequency: self.frequency
        )
    }()
    
    init(principal: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int) {
        self.principal = principal
        self.rate = rate
        self.term = term
        self.frequency = frequency
    }
    
}

class AnnuityTotalValue: AnnuityTotal {
    
    let value: NSDecimalNumber
    
    init(value: NSDecimalNumber) {
        self.value = value
    }
    
}

protocol AnnuityPrincipal {
    var value: NSDecimalNumber { get }
}

protocol AnnuityPayment {
    var value: NSDecimalNumber { get }
}

protocol AnnuityTotal {
    var value: NSDecimalNumber { get }
}

public class SwiftAnnuity {
    
    private let _principal: AnnuityPrincipal
    private let _payment: AnnuityPayment
    private let _total: AnnuityTotal
    
    public let frequency: Int
    public let rate: NSDecimalNumber
    public let term: Int
    
    public lazy var principal: NSDecimalNumber = {
        return self._principal.value
    }()
    
    public lazy var payment: NSDecimalNumber = {
        return self._payment.value
    }()
    
    public lazy var total: NSDecimalNumber = {
        return self._total.value
    }()
    
    public lazy var paymentCount: Int = {
        return self.frequency * self.term
    }()
    
    init(principal: AnnuityPrincipal, payment: AnnuityPayment, total: AnnuityTotal, rate: NSDecimalNumber, term: Int, frequency: Int = 1) {
        
        self.rate = rate
        self.term = term
        self.frequency = frequency
        
        self._payment = payment
        self._principal = principal
        self._total = total
        
    }
    
    public convenience init(principal: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int = 1) {
        
        self.init(
            principal: AnnuityPrincipalValue(value: principal),
            payment: AnnuityPaymentFromPrincipal(
                principal: principal,
                rate: rate,
                term: term,
                frequency: frequency
            ),
            total: AnnuityTotalFromPrincipal(
                principal: principal,
                rate: rate,
                term: term,
                frequency: frequency
            ),
            rate: rate,
            term: term,
            frequency: frequency
        )
        
    }
    
    public convenience init(total: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int = 1) {
        
        self.init(
            principal: AnnuityPrincipalFromTotal(
                total: total,
                rate: rate,
                term: term,
                frequency: frequency
            ),
            payment: AnnuityPaymentFromTotal(
                total: total,
                term: term,
                frequency: frequency
            ),
            total: AnnuityTotalValue(value: total),
            rate: rate,
            term: term,
            frequency: frequency
        )
        
    }
    
    public convenience init(payment: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int = 1) {
        
        self.init(
            principal: AnnuityPrincipalFromPayment(
                payment: payment,
                rate: rate,
                term: term,
                frequency: frequency
            ),
            payment: AnnuityPaymentValue(value: payment),
            total: AnnuityTotalFromPayment(
                payment: payment,
                term: term,
                frequency: frequency
            ),
            rate: rate,
            term: term,
            frequency: frequency
        )

    }
    
    // Static methods
    
    /* All of the calculations for this module are provided below
     * everything else in this module is an object wrapper for the
     * values and lazy calculation. */
    
    static func getPayment(principal: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        
        let r = getRateOverTerm(
            rate: rate,
            term: term,
            frequency: frequency
        )
        
        return principal * r
    }
    
    static func getPayment(total: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        
        let count = getPaymentCount(
            term: term,
            frequency: frequency
        ).toDecimalNumber()
        
        return total / count
    }
    
    static func getTotal(principal: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        
        let payment = getPayment(
            principal: principal,
            rate: rate,
            term: term,
            frequency: frequency
        )
        let count = getPaymentCount(
            term: term,
            frequency: frequency
        ).toDecimalNumber()
        
        return getTotal(payment: payment, count: count)
    }
    
    static func getTotal(payment: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        return getTotal(
            payment: payment,
            count: getPaymentCount(
                term: term,
                frequency: frequency
            )
        )
    }
    
    static func getTotal(payment: NSDecimalNumber, count: Int) -> NSDecimalNumber {
        return getTotal(
            payment: payment,
            count: count.toDecimalNumber()
        )
    }
    
    static func getTotal(payment: NSDecimalNumber, count: NSDecimalNumber) -> NSDecimalNumber {
        return payment * count
    }
    
    static func getPrincipal(payment: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        
        let r = getRateOverTerm(
            rate: rate,
            term: term,
            frequency: frequency
        )
        
        return payment / r
    }
    
    static func getPrincipal(total: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        
        let payment = getPayment(total: total, term: term, frequency: frequency)
        
        return getPrincipal(payment: payment, rate: rate, term: term, frequency: frequency)
    }
    
    static func getRateOverTerm(rate: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        
        let r = (rate as NSDecimalNumber) / (frequency.toDecimalNumber() as NSDecimalNumber)
        let t = getPaymentCount(
            term: term,
            frequency: frequency
        )
        
        return (r * (1 + r) ** t) / ((1 + r) ** t - 1)
    }
    
    static func getPaymentCount(term: Int, frequency: Int) -> Int {
        return term * frequency
    }
    
}
