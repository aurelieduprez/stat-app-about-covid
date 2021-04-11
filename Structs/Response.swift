//
//  ResponseModel.swift
//  supHealth
//
//  Created by Aurelie Duprez on 05/04/2021.
//  Copyright © 2021 aurelieduprez. All rights reserved.
//

import Foundation

// definition de la strucure de la reponse de l'API
struct Response: Codable {
    let Global: Global
    let Countries: Array<Country>
    let Date: String
}
