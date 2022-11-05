//
//  GetMonumentsProtocolMock.swift
//  iOS Code Challenge
//
//  Created by Cédric Bahirwe on 03/11/2022.
//  Copyright © 2022 Geektastic. All rights reserved.
//

import Foundation

final class GetMonumentsProtocolMock: GetMonumentsProtocol {
    // Assuming we were fetching from remote source
    // We could use a local json mock file of the expected response

    func loadMonuments(completion: @escaping ([Monument]) -> Void) {
        let sample = [
            Monument(name: "The Tower Of London", location: "London, UK", latitude: 51.50853, longitude: -0.076132),
            Monument(name: "Buckingham Palace", location: "London, UK", latitude: 51.501476, longitude: -0.140634), Monument(name: "The London Eye", location: "London, UK", latitude: 51.5034, longitude: -0.119519),
            Monument(name: "Big Ben", location: "London, UK", latitude: 51.510357, longitude: -0.116773)
        ]
        completion(sample)
    }
}
