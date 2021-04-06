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
            
            // General View
            HomeView()
                
                // Tab Icon
                .tabItem {
                    Image(systemName: "globe")
                    Text("Global")
                }
            
            // Country List View
            CountryListView()
                
                // Tab Icon
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Countries")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
