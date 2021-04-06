//
//  CountryListView.swift
//  supHealth
//
//  Created by Aurelie Duprez on 05/04/2021.
//  Copyright © 2021 aurelieduprez. All rights reserved.
//

import Foundation
import SwiftUI

struct RightTabView: View {

    @EnvironmentObject var countriesVM : CountriesViewModel
    @State private var isRefreshing = false
    @State private var showFavorites = false

    // Returns the correct country array according to the showFavorites property
    private func getFavoriteFilteredCountryArray() -> [Country] {
        return !self.showFavorites ?
            countriesVM.countries :
            countriesVM.countries.filter { self.countriesVM.favorties.contains($0.CountryCode)
                
            }
    }
    
    // Returns a boolean value telling us is the country is vaforite or not
    private func isFavorite(country: Country) -> Bool {
        return self.countriesVM.favorties.contains( country.CountryCode )
    }

    var body: some View {
        
        // List View
        NavigationView {
            
            List( getFavoriteFilteredCountryArray() ) { country in
                
                NavigationLink(
                    // Details View
                    destination: DetailView (
                        country: country,
                        isFavorite: self.isFavorite(country: country)
                    )
                ) {
                    // Item View
                    CountryItemView (
                        country: country,
                        isFavorite: self.isFavorite(country: country)
                    )
                }
            }
                // Pull to refresh handler
                .pullToRefresh(isShowing: $isRefreshing) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.isRefreshing = false
                    }
                    self.countriesVM.fetchAPI()
                }
            
                // Navigation view Title
                .navigationBarTitle(Text("Pays"))
                    
                // Navigation view Items
                .navigationBarItems(trailing: HStack() {
                    
                    Toggle(isOn: $showFavorites) {
                        Text("Favoris")
                    }
                    
                })
        }
    }
}