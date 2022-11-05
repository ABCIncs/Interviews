//
//  MonumentsResponse.swift
//  iOS Code Challenge
//
//  Created by Cédric Bahirwe on 03/11/2022.
//  Copyright © 2022 Geektastic. All rights reserved.
//

import Foundation

struct MonumentsResponse: Decodable {
    var monuments: [DecodableMonument]
}
