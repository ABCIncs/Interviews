//
//  MonumentsDatabase.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import Foundation

class MonumentsDatabase: GetMonumentsProtocol {
    
    var monuments: [Monument]?
    
    static let sharedInstance = MonumentsDatabase()
    private init() { }
    
    func hasData() -> Bool {
        if let monuments = monuments, monuments.count > 0 {
            return true
        } else {
            return false
        }
    }
    
    func loadMonuments(completion: @escaping ([Monument]) -> Void) {
        // Parse monuments from Monuments.json and return an array
        do {
            let result: MonumentsResponse = try Bundle.main.decode("Monuments")
            let monuments = result.monuments.map { $0.getMonument() }
            self.monuments = monuments
            completion(monuments)
        } catch {
            // May been to handle error
            completion([])
            print(error.localizedDescription)
        }
    }

}
