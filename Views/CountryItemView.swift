//
//  CountryItemView.swift
//  supHealth
//
//  Created by Aurelie Duprez on 05/04/2021.
//  Copyright © 2021 aurelieduprez. All rights reserved.
//

import Foundation
import SwiftUI

struct CountryItemView: View {
    
    var country: Country
    var isFavorite: Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        // Navigation cell
        HStack() {
            
            // drapeau selon country code
            Image(country.CountryCode)
                .resizable()
                .scaledToFit()
                .frame(width: 64.0)
            
            // label nom du pays
            Text(country.Country)
            
            Spacer()
            
            // etoile favoris
            if self.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(
                        colorScheme != .dark ? Color(UIColor.systemYellow) : .yellow
                    )
            }
        }
        
    }
}
