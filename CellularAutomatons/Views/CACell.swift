//
//  CACell.swift
//  CellularAutomatons
//
//  Created by Steven Wijaya on 04.03.2023.
//

import SwiftUI

struct CACell: View {
    
    var state: Int
    
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 50)
            .foregroundColor((state == 1) ? .black : .white)
    }
}

struct CACell_Previews: PreviewProvider {
    static var previews: some View {
        CACell(state: 1)
    }
}
