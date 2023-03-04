//
//  CAPicker.swift
//  CellularAutomatons
//
//  Created by Steven Wijaya on 04.03.2023.
//

import SwiftUI

struct CAPicker: View {
    
    var text: String
    @Binding var data: Int
    var lowerLimit: Int = 0
    var upperLimit: Int
    
    var body: some View {
        Picker(text, selection: $data) {
            ForEach(lowerLimit...upperLimit, id: \.self) {
                Text("\($0)")
            }
        }
    }
}

struct CAPicker_Previews: PreviewProvider {
    static var previews: some View {
        CAPicker(text: "Some data", data: .constant(20), lowerLimit: 1, upperLimit: 50)
    }
}
