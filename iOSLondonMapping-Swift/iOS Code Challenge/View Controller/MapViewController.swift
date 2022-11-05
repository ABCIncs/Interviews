//
//  MapViewController.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {

    var mapView: MKMapView?
    var annotations: [MKAnnotation]?
    private let monumentsStore: GetMonumentsProtocol

    init(_ monumentsStore: GetMonumentsProtocol = MonumentsDatabase.sharedInstance) {
        self.monumentsStore = monumentsStore
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = nil

        setupMapView()
        loadMonuments()
    }

    private func setupMapView() {
        mapView = MKMapView(frame: view.frame)
        if let mapView {
            mapView.mapType = MKMapType.standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true
            mapView.delegate = self
            mapView.center = view.center
            view.addSubview(mapView)
        }
    }

    private func loadMonuments() {
        monumentsStore.loadMonuments { [weak self] monuments in
            guard let self = self else { return }
            let annotations = self.getAnnotations(from: monuments)
            self.mapView?.addAnnotations(annotations)
            if let annotations = self.mapView?.annotations {
                let insets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
                self.mapView?.fitAllAnnotations(in: annotations, insets: insets)
            }
        }
    }
}

// MARK: - MapView Delegate Methods
extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let identifier = "MonumentAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.image = UIImage(named: "59-flag")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }
}

// MARK: - Helper Methods
extension MapViewController {
    private func getAnnotations(from monuments: [Monument]) -> [MonumentMapAnnotation] {
        return monuments.map(MonumentMapAnnotation.init)
    }
}
