//
//  HomeVC.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 22/07/21.
//

import UIKit
import MapKit

class HomeVC: UIViewController {

    private let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    private var currentCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.mapType = .mutedStandard
        
        configureLocationServices()
//        self.addRadiusCircle(location: CLLocation(latitude: -6.214907166595364, longitude: 106.79686159791704))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("will dis")
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
        let redAnnotation = MKPointAnnotation()
        redAnnotation.title = "Nuruning Kucing di Atap"
        redAnnotation.coordinate = CLLocationCoordinate2D(latitude:  -6.3009267573263275, longitude: 106.65268675358362)

        let yellowAnnotation = MKPointAnnotation()
        yellowAnnotation.title = "Angkut Rongsokan"
        yellowAnnotation.coordinate = CLLocationCoordinate2D(latitude:  -6.299640621626045, longitude: 106.65153022391823)
        
        mapView.addAnnotation(redAnnotation)
        mapView.addAnnotation(yellowAnnotation)
    }

//    func addRadiusCircle(location: CLLocation){
//        print("location")
////        if let poll = self.selectedPoll {
//            self.mapView.delegate = self
//            let circle = MKCircle(center: location.coordinate, radius: 50)
//        self.mapView.addOverlay(circle)
////        }
//    }
//
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        print(overlay is MKCircle, "_overlay")
//        if overlay is MKCircle {
//            let circle = MKCircleRenderer(overlay: overlay)
//            circle.strokeColor = UIColor.black
//            circle.fillColor = UIColor(red: 224, green: 21, blue: 21, alpha: 1.0)
//            circle.lineWidth = 1
//            return circle
//        } else {
//            return MKPolylineRenderer()
//        }
//    }
}

extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest location")

        guard let latestLocation = locations.first else { return }

        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            addAnnotations()
        }

        currentCoordinate = latestLocation.coordinate
    }
//
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
        
        if let title = annotation.title, title == "Nuruning Kucing di Atap" {
            reassigned = true
            print("here")
            annotationView?.image = UIImage(named: "high_urgency_radius")
        }
        if let title = annotation.title, title == "Angkut Rongsokan" {
            reassigned = true
            print("here")
            annotationView?.image = UIImage(named: "low_urgency_radius")
        }
        
        annotationView?.canShowCallout = true
        
        return reassigned ? annotationView : nil;
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("The annotation was selected: \(String(describing: view.annotation?.title))")
    }
}
