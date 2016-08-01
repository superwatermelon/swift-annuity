//
//  SwiftAnnuity.swift
//  SwiftAnnuity
//
//  Created by Stuart Wakefield on 05/03/2016.
//  Copyright © 2016 Superwatermelon Limited. All rights reserved.
//

import Foundation
import SwiftDecimalNumber

class Annuity {
    
    func amount(principal: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        return principal * rateOverTerm(rate, term: term, frequency: frequency)
    }
    
    func principal(amount: NSDecimalNumber, rate: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        return amount / rateOverTerm(rate, term: term, frequency: frequency)
    }
    
    func rateOverTerm(rate: NSDecimalNumber, term: Int, frequency: Int) -> NSDecimalNumber {
        
        let r = rate / NSDecimalNumber(decimal: NSNumber(integer: frequency).decimalValue)
        let t = term * frequency
        
        return ((r * (1 + r) ** t) / ((1 + r) ** t - 1))
    }
    
}
