//
//  GetMonumentsProtocolTest.swift
//  iOS Code ChallengeTests
//
//  Created by Cédric Bahirwe on 03/11/2022.
//  Copyright © 2022 Geektastic. All rights reserved.
//

import XCTest
@testable import iOS_Code_Challenge

final class GetMonumentsProtocolTest: XCTestCase {
    var getMonumentsMock: GetMonumentsProtocol?

    override func setUp() {
        loadMockup()
    }

    override func tearDown() {
        getMonumentsMock = nil
    }

    func testGetMonuments() {
        let name = "The Tower Of London"
        let location = "London, UK"
        let lat: Float = 51.50853
        let long: Float = -0.076132

        getMonumentsMock?.loadMonuments(completion: { monuments in
            if let firstMonument = monuments.first {
                XCTAssertEqual(firstMonument.name, name)
                XCTAssertEqual(firstMonument.location, location)
                XCTAssertEqual(firstMonument.latitude, lat)
                XCTAssertEqual(firstMonument.longitude, long)
            }
        })
    }

    private func loadMockup() {
        getMonumentsMock = GetMonumentsProtocolMock()
    }
}
