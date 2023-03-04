//
//  CAIndexCell.swift
//  CellularAutomatons
//
//  Created by Steven Wijaya on 04.03.2023.
//

import SwiftUI

struct CAIndexCell: View {
    
    var index: Int
    
    var body: some View {
        Text("\(index)")
            .bold()
            .foregroundColor(.black)
            .frame(width: 50, height: 50)
            .background(.white)
    }
}

struct CAIndexCell_Previews: PreviewProvider {
    static var previews: some View {
        CAIndexCell(index: 0)
    }
}
