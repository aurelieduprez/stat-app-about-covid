//
//  CountriesViewModel.swift
//  supHealth
//
//  Created by Aurelie Duprez on 05/04/2021.
//  Copyright © 2021 aurelieduprez. All rights reserved.
//
import Foundation
import SwiftUI

class CountriesViewModel: ObservableObject {
    
    // declaration variables published
    @Published var countries: [Country] = []
    @Published var global: Global?
    @Published var favorties: [String] = UserDefaults.standard.array(forKey: "Favorites") as? [String] ?? [] as [String] {
        didSet {
            UserDefaults.standard.set(self.favorties, forKey: "Favorites")
        }
    }
    
    // recupère les données auprès de l'API
    init() {
        fetchAPI()
    }
    
    // maj des données des pays
    func fetchAPI() {
        
        guard let url = URL( string:"https://api.covid19api.com/summary" ) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: {data, _, err in
        
        // Vérifie l'état des données recues
        guard let data = data, err == nil else {
            print("Erreur lors du chargement. Veuillez réessayer plus tard.")
            return
        }
            
        //maj asynchrone des données
            DispatchQueue.main.async {
                var decodedData: Response?
                do {
                    decodedData = try JSONDecoder().decode(Response.self, from: data)
                    self.countries = decodedData!.Countries
                    self.global = decodedData!.Global
                }
                catch {
                    print("Erreur lors de la conversion des données JSON: \(error.localizedDescription)")
                }
            }
        }).resume() //execution requete
        
    }
    
}
