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

    @EnvironmentObject var countriesModel: CountriesViewModel
    @State private var isRefreshing = false
    @State private var showFavorites = false

    // Returns the correct country array according to the showFavorites property
    private func getFavoriteFilteredCountryArray() -> [Country] {
        return !self.showFavorites ?
            countriesModel.countries :
            countriesModel.countries.filter { self.countriesModel.favorites.contains($0.CountryCode)
                
            }
    }
    
    // booleen si le pays est en favoris ou non
    private func isFavorite(country: Country) -> Bool {
        return self.countriesModel.favorites.contains( country.CountryCode )
    }

    var body: some View {
        
        // liste
        NavigationView {
            
            List( getFavoriteFilteredCountryArray() ) { country in
                
                NavigationLink(
                    //Details view
                    destination: DetailView (
                        country: country,
                        isFavorite: self.isFavorite(country: country)
                    )
                ) {
                    // country item View
                    CountryItemView (
                        country: country,
                        isFavorite: self.isFavorite(country: country)
                    )
                }
            }
          
                // Navigation view titre
                .navigationBarTitle(Text("Pays"))
                    
                // Navigation view Items
                .navigationBarItems(trailing: HStack() {
                    
                    Toggle(isOn: $showFavorites) { //bouton switch des favoris, si activé faire $showfavorites
                        Text("Favoris")
                    }
                    
                })
        }
    }
}
