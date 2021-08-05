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
	
		private var homeVM = HomeVM()
		private var jobs: [Job] = []
	
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var jobListingColView: UICollectionView!
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var gradientView: UIView!
    
    private var currentCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		setupUI()
		setupCollectionView()
		setupMapView()
			
		subscribeViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
	
		private func subscribeViewModel() {
				homeVM.bindCatalogueViewModelToController = {
						self.bindData()
				}
		}
		
		private func bindData() {
					jobs = homeVM.nearbyJobs ?? [Job]()
					DispatchQueue.main.async {
						self.addAnnotations()
					}
		}
	
	func setupUI() {
		setGradientBackground()
		
		showAllButton.semanticContentAttribute = UIApplication.shared
				.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
	}
	
	func setupCollectionView() {
		let dummyNib = UINib(nibName: "DummyCollectionViewCell", bundle: nil)
		jobListingColView.register(dummyNib, forCellWithReuseIdentifier: "dummyIdentifier")
		jobListingColView.delegate = self
		jobListingColView.dataSource = self
	}
	
	func setupMapView() {
		mapView.delegate = self
		mapView.mapType = .mutedStandard
		configureLocationServices()
	}
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 201.0/255.0, green: 230.0/255.0, blue: 179.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 201.0/255.0, green: 230.0/255.0, blue: 179.0/255.0, alpha: 0.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = gradientView.frame
                
        gradientView.layer.insertSublayer(gradientLayer, at:0)
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
        for annotation in jobs {
					mapView.addAnnotation(annotation as! MKAnnotation)
        }
    }
}

extension HomeVC: UICollectionViewDataSource , UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let dummyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dummyIdentifier", for: indexPath) as! DummyCollectionViewCell
        return dummyCell
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
