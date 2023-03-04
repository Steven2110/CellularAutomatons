//
//  CAViewModel.swift
//  CellularAutomatons
//
//  Created by Steven Wijaya on 02.03.2023.
//

import Foundation

final class CAViewModel: ObservableObject {
    @Published var cellularSystem: [[Cell]] = [[Cell]]()
    @Published var isFinalGeneration: Bool = false
    
    private var ruleDict: [String: Character] = generateRuleDictionary(rule: 0)
    private var generationNumber: Int = 0
    
    init() {
        for _ in 0..<15 {
            var rows: [Cell] = [Cell]()
            for _ in 0..<15 {
                rows.append(Cell())
            }
            cellularSystem.append(rows)
        }
    }
    
    func setNewSize(row: Int, cell: Int) {
        cellularSystem.removeAll()
        for _ in 0..<row {
            var rows: [Cell] = [Cell]()
            for _ in 0..<cell {
                rows.append(Cell())
            }
            cellularSystem.append(rows)
        }
    }
    
    func setRule(_ rule: Int) {
        ruleDict = generateRuleDictionary(rule: rule)
    }
    
    func evolve() {
        if generationNumber == cellularSystem.count - 1 {
            isFinalGeneration = true
            return
        }
        
        let previousGeneration: [Cell] = cellularSystem[generationNumber]
        
        var currentGeneration: [Cell] = [Cell]()
        
        for i in 0..<previousGeneration.count {
            var neighbourCell: String
            if i == 0 {
                let cellCount: Int = previousGeneration.count
                neighbourCell = "\(previousGeneration[cellCount - 1].state)\(previousGeneration[i].state)\(previousGeneration[i + 1].state)"
            } else if i == previousGeneration.count - 1 {
                neighbourCell = "\(previousGeneration[i - 1].state)\(previousGeneration[i].state)\(previousGeneration[0].state)"
            } else {
                neighbourCell = "\(previousGeneration[i - 1].state)\(previousGeneration[i].state)\(previousGeneration[i + 1].state)"
            }
            let currentCellState: Character = ruleDict[neighbourCell]!
            currentGeneration.append(Cell(state: Int(String(currentCellState))!))
        }
        
        generationNumber += 1
        cellularSystem[generationNumber] = currentGeneration
    }
    
    func reset() {
        let row: Int = cellularSystem.count
        let cell: Int = cellularSystem[0].count
        
        cellularSystem.removeAll()
        
        for _ in 0..<row {
            var rows: [Cell] = [Cell]()
            for _ in 0..<cell {
                rows.append(Cell())
            }
            cellularSystem.append(rows)
        }
        
        generationNumber = 0
        
        isFinalGeneration = false
    }
}
