//
//  Job.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 24/07/21.
//

import MapKit
import SwiftyJSON

enum Urgency: String {
    case high = "HIGH"
    case medium = "MEDIUM"
    case low = "LOW"
}

class Job: NSObject, MKAnnotation {
//class Job: NSObject {
	var id: Int?
	var title: String?
	var desc: String?
	var urgency: Urgency
	var price: Int
	var coordinate: CLLocationCoordinate2D
	var jobPosterId: Int?
	var status: String?
	var genderPreference: String
	var agePreference: String
	var distance: Double?

  init(
		id: Int?,
		title: String?,
		desc: String?,
		urgency: Urgency,
		price: Int,
		coordinate: CLLocationCoordinate2D,
		jobPosterId: Int,
		status: String,
		genderPreference: String,
		agePreference: String,
		distance: Double
  ) {
//		super.init()
		
		self.id =  id
		self.title = title
		self.desc = desc
		self.urgency = urgency
		self.price = price
		self.coordinate = coordinate
		self.jobPosterId = jobPosterId
		self.status = status
		self.genderPreference = genderPreference
		self.agePreference = agePreference
		self.distance = distance
  }
	
	init(_ json: JSON) {
//		super.init()
		id = json["id"].intValue
		title = json["title"].stringValue
		desc = json["desc"].stringValue
		price = json["price"].intValue
		jobPosterId = json["jobPosterId"].intValue
		status = json["status"].stringValue
		genderPreference = json["genderPreference"].stringValue
		agePreference = json["agePreference"].stringValue
		distance = json["distance"].doubleValue
		
		urgency = Urgency(rawValue: json["urgency"].stringValue)!
		coordinate = CLLocationCoordinate2D(latitude: json["coordinate"]["coordinates"][1].doubleValue, longitude: json["coordinate"]["coordinates"][0].doubleValue)
	}

  var subtitle: String? {
    return desc
  }
}

class Coordinate: Codable {
	let coordinates: [Double] = []
}
