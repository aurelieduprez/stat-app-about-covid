//
//  ContentView.swift
//  supHealth
//
//  Created by Aurelie Duprez on 05/04/2021.
//  Copyright © 2021 aurelieduprez. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct ContentView: View {
    
    var body: some View {
        TabView {
            
            // onglet de gauche, contient le menu avec le nombre de cas, morts et guerisons
            LeftTabView()
                
                // logo globe
                .tabItem {
                    Image(systemName: "globe")
                    Text("Menu")
                }
            
            // liste de tous les pays, liste d'item (cf. country item list
            RightTabView()
                
                // logo pour la liste
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Dans le monde")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
