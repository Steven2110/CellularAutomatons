//
//  CAMainView.swift
//  CellularAutomatons
//
//  Created by Steven Wijaya on 02.03.2023.
//

import SwiftUI

struct CAMainView: View {
    
    @State private var rule: Int = 0
    
    @State private var cellularBox: [[Cell]] = [
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
        [Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell(), Cell()],
    ]
    
    var body: some View {
        HSplitView {
            VStack(alignment: .leading) {
                Picker("Rule", selection: $rule) {
                    ForEach(0...255, id: \.self) {
                        Text("\($0)")
                    }
                }
                Button {
                    
                } label: {
                    Text("Start")
                }
                Button {
                    
                } label: {
                    Text("Stop")
                }
                Button {
                    
                } label: {
                    Text("Reset")
                }
            }
            .padding()
            .frame(width: 500)
            .frame(maxHeight: .infinity)
            VStack {
                ForEach(0..<cellularBox.count) { i in
                    HStack {
                        ForEach(0..<cellularBox[i].count) { j in
                            Rectangle()
                                .frame(width: 50, height: 50)
                                .foregroundColor((cellularBox[i][j].state == 1) ? .black : .white)
                                .onTapGesture {
                                    if i == 0 {
                                        cellularBox[i][j].toggle()
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
