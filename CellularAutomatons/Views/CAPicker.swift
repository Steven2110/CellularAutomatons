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
    var limit: Int
    
    var body: some View {
        Picker(text, selection: $data) {
            ForEach(0...limit, id: \.self) {
                Text("\($0)")
            }
        }
    }
}

struct CAPicker_Previews: PreviewProvider {
    static var previews: some View {
        CAPicker(text: "Some data", data: .constant(20), limit: 50)
    }
}
