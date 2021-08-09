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
    var jobList = DummyData.shared.getJobsList(.active)
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var jobListingColView: UICollectionView!
    @IBOutlet weak var showAllButton: UIButton!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    private var currentCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobListingColView.delegate = self
        jobListingColView.dataSource = self
        jobListingColView.register(JobListCell.nib(), forCellWithReuseIdentifier: JobListCell.identifier)
        
        setupUI()
        setupCollectionView()
        setupMapView()
        
        subscribeViewModel()
        
        UserDefaults.standard.set(currentCoordinate, forKey: "userCoordinate")
        
        for annotation in jobList {
            mapView.addAnnotation(annotation)
        }
        
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
        jobs = homeVM.nearbyJobs ?? [Job]()
        DispatchQueue.main.async {
            self.addAnnotations()
        }
    }
    
    func setupUI() {
        //        setGradientBackground()
        
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
    
    
    @IBAction func showAll(_ sender: Any) {
        let showAll = AssistanceListVC()
        self.navigationController?.pushViewController(showAll, animated: true)
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
        for annotation in jobList {
            mapView.addAnnotation(annotation as MKAnnotation)
        }
    }
}

extension HomeVC: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobListCell.identifier, for: indexPath) as! JobListCell
        let selectedJob = jobList[indexPath.row]
        
        DispatchQueue.main.async {
            cell.headerLabel.text = StringFormatter().distanceFromCoordinate(from: self.currentCoordinate ?? CLLocationCoordinate2D(), to: selectedJob.coordinate)
        }
        
        cell.setStatusView(urgency: selectedJob.urgency)
        cell.titleLabel.text = selectedJob.title
        cell.posterImage.image = selectedJob.jobPosterId.avatar
        cell.posterLabel.text = selectedJob.jobPosterId.name
        cell.verifiedLogo.isHidden = !selectedJob.jobPosterId.isVerified

        cell.compensationLabel.text = StringFormatter().priceFormatting(amount: selectedJob.price)
        cell.timeElapsedLabel.text = StringFormatter().relativeDateFormatter(date: selectedJob.postingDate)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailBantuan = DetailBantuanVC()
        detailBantuan.selectedJob = jobList[indexPath.row]
        self.navigationController?.pushViewController(detailBantuan, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 325, height: 140)
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
        print("The annotation was selected: \(String(describing: view.annotation?.title))")
    }
}
