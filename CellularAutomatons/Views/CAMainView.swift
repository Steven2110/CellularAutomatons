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
    
    @State private var cellularBox: [[Cell]] = [
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
    ]
    
    @State private var timer: Timer? = nil
    @State private var isOnGoing: Bool = false
    
    var body: some View {
        HSplitView {
            VStack(alignment: .leading) {
                HStack {
                    Picker("Rows", selection: $sizeRow) {
                        ForEach(0...50, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .onChange(of: sizeRow) { _ in
                        vm.setNewSize(row: sizeRow, cell: sizeCell)
                    }
                    Picker("Cells", selection: $sizeCell) {
                        ForEach(0...20, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .onChange(of: sizeCell) { _ in
                        vm.setNewSize(row: sizeRow, cell: sizeCell)
                    }
                }
                Picker("Rule", selection: $rule) {
                    ForEach(0...255, id: \.self) {
                        Text("\($0)")
                    }
                }
                HStack {
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
                    Button {
                        isOnGoing = false
                        timer?.invalidate()
                    } label: {
                        Text("Stop")
                    }
                    Button {
                        vm.reset()
                        timer = nil
                    } label: {
                        Text("Reset")
                    }
                }
            }
            .padding()
            .frame(width: 300)
            .frame(maxHeight: .infinity)
            VStack {
                ForEach(vm.cellularSystem.indices, id: \.self) { i in
                    HStack {
                        Text("\(i)")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .background(.white)
                        ForEach(vm.cellularSystem[i].indices, id: \.self) { j in
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .foregroundColor((vm.cellularSystem[i][j].state == 1) ? .black : .white)
                                .onTapGesture {
                                    if i == 0 {
                                        vm.cellularSystem[i][j].toggle()
                                    }
                                }
                        }
                    }
                }
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
