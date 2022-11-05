//
//  MonumentMapAnnotation.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import Foundation
import MapKit

class MonumentMapAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(monument: Monument) {
        self.title = monument.name
        self.subtitle = monument.location
        self.coordinate = CLLocationCoordinate2D(
            latitude: Double(monument.latitude),
            longitude: Double(monument.longitude)
        )
        super.init()
    }
}
