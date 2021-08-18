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
    
    var homeVM = HomeVM()
    private var jobs: [Job] = []
    var jobList = [Jobs]()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var jobListingColView: UICollectionView!
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    var currentCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobListingColView.delegate = self
        jobListingColView.dataSource = self
        jobListingColView.register(JobListCell.nib(), forCellWithReuseIdentifier: JobListCell.identifier)
        
        setupUI()
        setupCollectionView()
        setupMapView()
        
        subscribeViewModel()
        
        for annotation in jobList {
            mapView.addAnnotation(annotation)
        }
        
    }
	
	override func viewDidAppear(_ animated: Bool) {
		guard let latestLocation = currentCoordinate else { return }
		homeVM.fetchNearbyJob(coordinate: latestLocation)
		print("jobList", jobList.count)
	}
    
    func loadMapData() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tabBarController?.tabBar.isHidden = false
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
		if let parsedJobs = homeVM.nearbyJobs {
			jobList = parsedJobs 
			DispatchQueue.main.async {
				self.addAnnotations()
				self.jobListingColView.reloadData()
			}
		}
    }
    
    func setupUI() {
        
        showAllButton.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        
        showAllButton.titleLabel?.font = .FontLibrary.textLink1
        
        blurView.layer.cornerRadius = 10
        blurView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blurView.layer.masksToBounds = true
        
        //Back Button
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    @IBAction func searchBarTapped(_ sender: Any) {
		navToListAssitance()
    }
    
    @IBAction func showAll(_ sender: Any) {
        navToListAssitance()
    }
    
    func configureLocationServices() {
        locationManager.delegate = self
        let status = locationManager.authorizationStatus
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
    }
}
