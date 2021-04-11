//
//  DetailItem.swift
//  supHealth
//
//  Created by Aurelie Duprez on 05/04/2021.
//  Copyright © 2021 aurelieduprez. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailItem: View {
    
    // var pour les données
    var labelText: String
    var totalNumber: Int
    var dailyNumber: Int
    var color: Color
    
    // Struct des données
    init(labelText: String, totalNumber: Int, dailyNumber: Int, color: Color) {
        self.labelText = labelText
        self.totalNumber = totalNumber
        self.dailyNumber = dailyNumber
        self.color = color
    }
    
    // Body de la view
    var body: some View {
        HStack {
            // Label
            Text( labelText )
                .font(.headline)
            
            Spacer()
            
            //données en vertical stack
            VStack(alignment: .trailing) {
                
                Text( String(totalNumber) )
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(color)
                
                Text( "+ \(String(dailyNumber)) aujourd'hui")
                    .font(.caption)
                    .foregroundColor(color)
                
            }
        }
        .padding(20.0)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12.0)
        .padding(8.0)
    }
}
