//
//  HomeMapView.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 15/08/21.
//

import Foundation
import MapKit
import UIKit

extension HomeVC {
	func setupMapView() {
		mapView.delegate = self
		mapView.mapType = .mutedStandard
		configureLocationServices()
	}
	
	func beginLocationUpdates(locationManager: CLLocationManager) {
		mapView.showsUserLocation = true
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.startUpdatingLocation()
	}
	
	private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
		let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
		mapView.setRegion(zoomRegion, animated: true)
	}
	
	func addAnnotations() {
		for annotation in jobList {
			mapView.addAnnotation(annotation as MKAnnotation)
		}
	}
}

extension HomeVC: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
		guard let latestLocation = locations.first else { return }
		
		if currentCoordinate == nil {
			zoomToLatestLocation(with: latestLocation.coordinate)
			homeVM.fetchNearbyJob(coordinate: latestLocation.coordinate)
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
		
		if let jobAnnotation = annotation as? Jobs {
			let jobAnnotationCell = MapKitAnnotationCellViewController(nibName: "MapKitAnnotationCellViewController", bundle: nil)
			
			jobAnnotationCell.job = jobAnnotation
			
			annotationView?.image = jobAnnotationCell.view.asImage()
			
			reassigned = true
		}
		
		annotationView?.canShowCallout = true
		
		return reassigned ? annotationView : nil;
	}
	
	func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
		
		if let jobAnnotation = view.annotation as? Jobs {
			self.navToDetail(selectedJob: jobAnnotation)
		}
	}
}
