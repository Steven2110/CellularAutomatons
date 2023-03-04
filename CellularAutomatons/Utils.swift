//
//  Utils.swift
//  CellularAutomatons
//
//  Created by Steven Wijaya on 02.03.2023.
//

import Foundation

func getRule(number: Int) -> String {
    var binary: String = String(number, radix: 2)
    // To add additional zeros for 8 bits binary number
    for _ in 0..<(8 - binary.count) {
        binary = "0" + binary
    }
    
    return binary
}

func generateRuleDictionary(rule: Int) -> [String: Character] {
    let ruleBinary = getRule(number: rule)
    
    let ruleDict: [String: Character] = [
        "111": ruleBinary[ruleBinary.startIndex],
        "110": ruleBinary[ruleBinary.index(ruleBinary.startIndex, offsetBy: 1)],
        "101": ruleBinary[ruleBinary.index(ruleBinary.startIndex, offsetBy: 2)],
        "100": ruleBinary[ruleBinary.index(ruleBinary.startIndex, offsetBy: 3)],
        "011": ruleBinary[ruleBinary.index(ruleBinary.startIndex, offsetBy: 4)],
        "010": ruleBinary[ruleBinary.index(ruleBinary.startIndex, offsetBy: 5)],
        "001": ruleBinary[ruleBinary.index(ruleBinary.startIndex, offsetBy: 6)],
        "000": ruleBinary[ruleBinary.index(ruleBinary.startIndex, offsetBy: 7)]
    ]
    
    return ruleDict
}
