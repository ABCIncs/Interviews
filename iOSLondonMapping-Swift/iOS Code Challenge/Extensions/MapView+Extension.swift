//
//  MapView+Extension.swift
//  iOS Code Challenge
//
//  Created by Cédric Bahirwe on 03/11/2022.
//  Copyright © 2022 Geektastic. All rights reserved.
//

import MapKit

extension MKMapView {
    // I create this extension for reusability
    func fitAllAnnotations(in annotations: [MKAnnotation],
                           insets: UIEdgeInsets,
                           animate: Bool = true) {
        
        var zoomRect = MKMapRect.null;
        for annotation in annotations {
            let annotationPoint = MKMapPoint(annotation.coordinate)
            let pointRect = MKMapRect(x: annotationPoint.x,
                                      y: annotationPoint.y,
                                      width: 0.01,
                                      height: 0.01);
            zoomRect = zoomRect.union(pointRect);
        }
        setVisibleMapRect(zoomRect,
                          edgePadding: insets,
                          animated: animate)
    }
}
