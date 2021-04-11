//
//  HomeView.swift
//  supHealth
//
//  Created by Aurelie Duprez on 05/04/2021.
//  Copyright © 2021 aurelieduprez. All rights reserved.
//

import Foundation
import SwiftUI

struct LeftTabView: View {
    
    @EnvironmentObject var countriesModel : CountriesViewModel
    
    var body: some View {
        
        NavigationView() {
            ScrollView(.vertical) {
                HStack() {
                    Text("Evolution du COVID-19 dans le monde")
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal, 10)
                    
                    DetailItem(
                        labelText: "Cas",
                        totalNumber: countriesModel.global?.TotalConfirmed ?? 0,
                        dailyNumber: countriesModel.global?.NewConfirmed ?? 0,
                        color: Color(UIColor.systemOrange))
                    
                    DetailItem(
                        labelText: "Décès",
                        totalNumber: countriesModel.global?.TotalDeaths ?? 0,
                        dailyNumber: countriesModel.global?.NewDeaths ?? 0,
                        color: Color(UIColor.systemRed)
                    )
                    
                    DetailItem(
                        labelText: "Guérisons",
                        totalNumber: countriesModel.global?.TotalRecovered ?? 0,
                        dailyNumber: countriesModel.global?.NewRecovered ?? 0,
                        color: Color(UIColor.systemGreen)
                    )
            }
            .navigationBarTitle( Text("SUPHEALTH") )
            
        }
    }
    
}
