//
//  HomeCollectionView.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 15/08/21.
//

import Foundation
import UIKit
import MapKit

extension HomeVC: UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	func setupCollectionView() {
		let dummyNib = UINib(nibName: "DummyCollectionViewCell", bundle: nil)
		jobListingColView.register(dummyNib, forCellWithReuseIdentifier: "dummyIdentifier")
		jobListingColView.delegate = self
		jobListingColView.dataSource = self
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return jobList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobListCell.identifier, for: indexPath) as! JobListCell
		let selectedJob = jobList[indexPath.row]
		
		DispatchQueue.main.async {
			selectedJob.distance = StringFormatter().distanceFromCoordinate(from: self.currentCoordinate ?? CLLocationCoordinate2D(), to: selectedJob.coordinate)
			cell.headerLabel.text = StringFormatter().distance(selectedJob.distance)
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
		mapView.setCenter(jobList[indexPath.row].coordinate, animated: true)
		DispatchQueue.main.async {
			self.navToDetail(selectedJob: self.jobList[indexPath.row])
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 325, height: 140)
	}
}
