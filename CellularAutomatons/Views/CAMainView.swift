//
//  CAMainView.swift
//  CellularAutomatons
//
//  Created by Steven Wijaya on 02.03.2023.
//

import SwiftUI

struct CAMainView: View {
    
    @State private var rule: Int = 0
    
    @State private var cellularBox: [[Int]] = [
        [0, 0, 0, 0, 1, 0, 1, 1, 0, 0],
        [0, 0, 0, 1, 0, 0, 1, 0, 1, 0],
        [0, 0, 0, 0, 1, 0, 0, 1, 1, 0],
        [0, 1, 0, 1, 1, 0, 1, 0, 0, 0],
        [0, 1, 0, 1, 1, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0, 0, 0, 1, 0],
        [0, 0, 1, 0, 0, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    ]
    
    var body: some View {
        HSplitView {
            VStack(alignment: .leading) {
                Picker("Rule", selection: $rule) {
                    ForEach(0...255, id: \.self) {
                        Text("\($0)")
                    }
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
                                .foregroundColor((cellularBox[i][j] == 1) ? .black : .white)
                                .onTapGesture {
                                    if i == 0 {
                                        if cellularBox[i][j] == 1 {
                                            cellularBox[i][j] = 0
                                        } else {
                                            cellularBox[i][j] = 1
                                        }
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
