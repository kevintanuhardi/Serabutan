//
//  HomeVC.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 22/07/21.
//

import UIKit
import MapKit

var jobs = [Job]()
//    Job(title: "Nurunin Kucing dari Atap", locationName: "masih di atap situ deh", urgency: .high, price: 50000, coordinate: CLLocationCoordinate2D(latitude:  -6.302919554428814, longitude: 106.65259634329381)),
//    Job(title: "Angkut Rongsokan", locationName: "itu muka apa rongsokan", urgency: .medium, price: 75000, coordinate: CLLocationCoordinate2D(latitude:  -6.3009267573263275, longitude: 106.65268675358362)),
//    Job(title: "Bantu Sebar Kotay Syukuran", locationName: "yang penting bersyukur", urgency: .low, price: 1000000, coordinate: CLLocationCoordinate2D(latitude:  -6.299640621626045, longitude: 106.65153022391823)]

class HomeVC: UIViewController {

    private let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var jobListingColView: UICollectionView!
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var gradientView: UIView!
    
    private var currentCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.mapType = .mutedStandard
        
        let dummyNib = UINib(nibName: "DummyCollectionViewCell", bundle: nil)
        jobListingColView.register(dummyNib, forCellWithReuseIdentifier: "dummyIdentifier")
        jobListingColView.delegate = self
        jobListingColView.dataSource = self
        
        showAllButton.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft

        
        configureLocationServices()
        
        setGradientBackground()
			
			// TODO: DELETE THIS
			postJob()
			
    }
	
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
		//this is a trial should be moved to ViewModel
	func fetchNearbyJob(coordinate: CLLocationCoordinate2D) {
				
		APIManager.getNearbyJob(coordinate: coordinate){ result in
					switch result {
					case .success (let fetchedJobs):
						print("result:", fetchedJobs)
						jobs = fetchedJobs as! [Job]
						DispatchQueue.main.async {
							self.addAnnotations()
						}
					case .failure(let error):
						print("error:", error)
					}
				}
			}
	
	//trial to post
	func postJob() {
		let dummyJob = Job( id: 0, title: "IntegrateTesting", desc: "Gw bayar mahal yang bisa bantu gw please", urgency: .high, price: 100000000, coordinate: CLLocationCoordinate2D(latitude: -6.301202, longitude: 106.651777), jobPosterId: 0, status: "", genderPreference: "MALE", agePreference: "16-25", distance: 0.0)
		
		APIManager.postJob(jobToCreate: dummyJob){ result in
			switch result {
			case .success (let fetchedJobs):
				print("result:", fetchedJobs)
				jobs = fetchedJobs as! [Job]
				DispatchQueue.main.async {
					self.addAnnotations()
				}
			case .failure(let error):
				print("error:", error)
			}
		}
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
//
//        dummyCell = UICollectionViewCell(frame: CGRect(x: 0, y: 0, width: 325, height: 150))
//
//        dummyCell.backgroundColor = UIColor.lightGray
//
        return dummyCell
    }


}

extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let latestLocation = locations.first else { return }

        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
					fetchNearbyJob(coordinate: latestLocation.coordinate)
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
