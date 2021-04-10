//
//  DetailsView.swift
//  supHealth
//
//  Created by Aurelie Duprez on 05/04/2021.
//  Copyright © 2021 aurelieduprez. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var countriesVM : CountriesViewModel
    @Environment(\.colorScheme) var colorScheme
    
    let country: Country
    @State var isFavorite : Bool
    @State var isShareSheetShowing: Bool = false
    
    
    //bouton partager
    func shareButton() {
        isShareSheetShowing.toggle()
        
        // le bouton partager permet de transmettre copier dans le presse papier le nombre de deces/cas/guérisons du pays choisi
        
        let text = "\(country.Country): \(country.TotalConfirmed) cas, \(country.TotalDeaths) décès, \(country.TotalRecovered) guérisons"
        let av = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
        
    }
    
    var body: some View {
        ScrollView(.vertical) {
            
            HStack {
                Spacer()
            }
            // pour chaque element de la liste des pays, détails de chaque pays (cas, deces, guerisons)
            DetailItem(
                labelText: "Cas",
                totalNumber: country.TotalConfirmed,
                dailyNumber: country.NewConfirmed,
                color: Color(UIColor.systemOrange)
            )
            
            DetailItem(
                labelText: "Décès",
                totalNumber: country.TotalDeaths,
                dailyNumber: country.NewDeaths,
                color: Color(UIColor.systemRed)
            )
            
            DetailItem(
                labelText: "Guérisons",
                totalNumber: country.TotalRecovered,
                dailyNumber: country.NewRecovered,
                color: Color(UIColor.systemGreen)
            )
            
        }
        .padding([.top, .horizontal])
        .navigationBarTitle(country.Country)
        .navigationBarItems(trailing:
            HStack(spacing: 20.0) {
                Button(action: shareButton ) {
                    //bouton partager
                    Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20.0)
                    .foregroundColor( Color(UIColor.systemBlue) )
                }
                
                //animation etoile selectionnee
                Button(action: {
                    withAnimation {self.isFavorite.toggle()}
                    if self.isFavorite {
                        self.countriesVM.favorties.append( self.country.CountryCode )
                    } else {
                        self.countriesVM.favorties = self.countriesVM.favorties.filter { $0 != self.country.CountryCode}
                    }
                }) {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28.0)
                        .foregroundColor(
                            isFavorite ?
                                (colorScheme == .dark ? Color(UIColor.systemYellow) : .yellow):
                                Color(UIColor.systemGray3)
                        )
                }
            }
        )
    }
}
