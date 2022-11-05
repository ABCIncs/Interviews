//
//  DecodableMonument.swift
//  iOS Code Challenge
//
//  Created by Cédric Bahirwe on 03/11/2022.
//  Copyright © 2022 Geektastic. All rights reserved.
//

import Foundation

struct DecodableMonument: Decodable {
    let name: String
    let location: String
    let latitude: String
    let longitude: String
}

extension DecodableMonument {
    func getMonument() -> Monument {
        Monument(name: name,
                 location: location,
                 latitude: Float(latitude) ?? 0,
                 longitude: Float(longitude) ?? 0)
    }
}
