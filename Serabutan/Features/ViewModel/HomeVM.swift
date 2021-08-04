//
//  HomeVM.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 03/08/21.
//

import Foundation
import MapKit

class HomeVM: NSObject {

	
		private(set) var nearbyJobs: [Job]? {
				didSet {
						self.bindCatalogueViewModelToController()
				}
		}

		var bindCatalogueViewModelToController: (() -> ()) = {}
		
		override init() {
			super.init()
		}

	func fetchNearbyJob(coordinate: CLLocationCoordinate2D) {
				
		APIManager.getNearbyJob(coordinate: coordinate){ result in
					switch result {
					case .success (let fetchedJobs):
						print("success", fetchedJobs)
						self.nearbyJobs = fetchedJobs as! [Job]
					case .failure(let error):
						print("error:", error)
					}
				}
			}
}
