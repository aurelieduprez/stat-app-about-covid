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
    
    @EnvironmentObject var countriesVM : CountriesViewModel
    
    var body: some View {
        
        NavigationView() {
            ScrollView(.vertical) {
                HStack() {
                    Text("Worldwide COVID-19 evolution")
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal, 10)
                    
                    DetailItem(
                        labelText: "Cases",
                        totalNumber: countriesVM.global?.TotalConfirmed ?? 0,
                        dailyNumber: countriesVM.global?.NewConfirmed ?? 0,
                        color: Color(UIColor.systemOrange))
                    
                    DetailItem(
                        labelText: "Deaths",
                        totalNumber: countriesVM.global?.TotalDeaths ?? 0,
                        dailyNumber: countriesVM.global?.NewDeaths ?? 0,
                        color: Color(UIColor.systemRed)
                    )
                    
                    DetailItem(
                        labelText: "Recovered",
                        totalNumber: countriesVM.global?.TotalRecovered ?? 0,
                        dailyNumber: countriesVM.global?.NewRecovered ?? 0,
                        color: Color(UIColor.systemGreen)
                    )
            }
            .navigationBarTitle( Text("SupHealth") )
            
        }
    }
    
}
