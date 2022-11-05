//
//  Bundle+Extension.swift
//  iOS Code Challenge
//
//  Created by Cédric Bahirwe on 03/11/2022.
//  Copyright © 2022 Geektastic. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ fileName: String) throws -> T {

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw FileDecodingError.badURL
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()

            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            print(error.localizedDescription)
            throw FileDecodingError.invalidData
        }

    }
}
