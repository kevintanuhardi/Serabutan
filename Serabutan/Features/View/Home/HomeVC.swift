//
//  HomeVC.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 22/07/21.
//

import UIKit
import MapKit

let dummyJobs = [
    Job(title: "Nurunin Kucing dari Atap", locationName: "masih di atap situ deh", urgency: .High, price: 100000, coordinate: CLLocationCoordinate2D(latitude:  -6.302919554428814, longitude: 106.65259634329381)),
    Job(title: "Angkut Rongsokan", locationName: "itu muka apa rongsokan", urgency: .Medium, price: 100000, coordinate: CLLocationCoordinate2D(latitude:  -6.3009267573263275, longitude: 106.65268675358362)),
    Job(title: "Bantu Sebar Kotay Syukuran", locationName: "yang penting bersyukur", urgency: .Low, price: 100000, coordinate: CLLocationCoordinate2D(latitude:  -6.299640621626045, longitude: 106.65153022391823))
]

class HomeVC: UIViewController {

    private let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    private var currentCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.mapType = .mutedStandard
        
        configureLocationServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }


    private func configureLocationServices() {
        locationManager.delegate = self
        let status = locationManager.authorizationStatus

        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
           beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    private func addAnnotations() {
        for annotation in dummyJobs {
            mapView.addAnnotation(annotation)
        }
    }
}

extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let latestLocation = locations.first else { return }

        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            addAnnotations()
        }

        currentCoordinate = latestLocation.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       print("The status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
}

extension HomeVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var reassigned = false
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        if let jobAnnotation = annotation as? Job {
            let jobAnnotationCell = MapKitAnnotationCellViewController(nibName: "MapKitAnnotationCellViewController", bundle: nil)
            
            jobAnnotationCell.job = jobAnnotation
            
            annotationView?.image = jobAnnotationCell.view.asImage()
            
            reassigned = true
        }
        
        annotationView?.canShowCallout = true
        
        return reassigned ? annotationView : nil;
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("The annotation was selected: \(String(describing: view.annotation?.title))")
    }
}
