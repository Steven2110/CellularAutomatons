//
//  CAMainView.swift
//  CellularAutomatons
//
//  Created by Steven Wijaya on 02.03.2023.
//

import SwiftUI

struct CAMainView: View {
    
    @State private var sizeRow: Int = 15
    @State private var sizeCell: Int = 15
    
    @StateObject private var vm: CAViewModel = CAViewModel()
    
    @State private var rule: Int = 0
    
    @State private var timer: Timer? = nil
    @State private var isOnGoing: Bool = false
    
    var body: some View {
        HSplitView {
            VStack(alignment: .leading) {
                HStack {
                    CAPicker(text: "Rows", data: $sizeRow, limit: 50)
                    .onChange(of: sizeRow) { _ in
                        vm.setNewSize(row: sizeRow, cell: sizeCell)
                    }
                    CAPicker(text: "Cells", data: $sizeCell, limit: 20)
                    .onChange(of: sizeCell) { _ in
                        vm.setNewSize(row: sizeRow, cell: sizeCell)
                    }
                }
                CAPicker(text: "Rule", data: $rule, limit: 255)
                HStack {
                    startButton
                    stopButton
                    resetButton
                }
            }
            .padding()
            .frame(minWidth: 300, maxWidth: 300, maxHeight: .infinity)
            ScrollView {
                ForEach(vm.cellularSystem.indices, id: \.self) { i in
                    HStack {
                        CAIndexCell(index: i)
                        ForEach(vm.cellularSystem[i].indices, id: \.self) { j in
                            CACell(state: vm.cellularSystem[i][j].state)
                                .onTapGesture {
                                    if i == 0 { vm.cellularSystem[i][j].toggle() }
                                }
                        }
                    }
                }.padding(20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct CAMainView_Previews: PreviewProvider {
    static var previews: some View {
        CAMainView()
    }
}

extension CAMainView {
    private var startButton: some View {
        Button {
            if timer == nil { vm.setRule(rule) }

            if !isOnGoing {
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    if !vm.isFinalGeneration {
                        vm.evolve()
                    } else {
                        timer?.invalidate()
                        isOnGoing = false
                    }
                }
                isOnGoing = true
            }
        } label: {
            Text("Start")
        }
    }
    
    private var stopButton: some View {
        Button {
            isOnGoing = false
            timer?.invalidate()
        } label: {
            Text("Stop")
        }
    }
    
    private var resetButton: some View {
        Button {
            vm.reset()
            timer = nil
        } label: {
            Text("Reset")
        }
    }
}
