//
//  Job.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 24/07/21.
//

import MapKit
import UIKit
import SwiftyJSON

enum JobStatus {
    case active, taken, cancelled, done
}

enum JobAction {
    case message, change, cancel, finished
}

enum Gender: String {
    case male = "Laki-laki"
    case female = "Perempuan"
    case other = "Lainnya"
}

enum AgePreference: String {
    case youngAdult = "18-25"
    case middleAdult = "26-40"
    case lateAdult = "40+"
}

enum Urgency: String {
    case high = "Urgensi Tinggi"
    case medium = "Urgensi Sedang"
    case low = "Urgensi Rendah"
}

//MARK: - Dummy Data
// This struct is used for dummy data
class Jobs: NSObject, MKAnnotation {
    let id : Int
    let jobPosterId : UserProfile
    
    // Job Details
    let postingDate : Date
    let urgency : Urgency
    let title : String?
    let desc : String?
    let price : Int
    var status : JobStatus
    var distance : Double
    let coordinate: CLLocationCoordinate2D
    
    let tags : [String]?
    let medias : [UIImage]?
    var helperId : UserProfile?
    
    // Job Preference
    let genderPreference : Gender?
    let agePreference : AgePreference?
    
    init(
        id : Int,
        jobPosterId : UserProfile,
        postingDate : Date,
        urgency : Urgency,
        title : String?,
        desc : String?,
        price : Int,
        status : JobStatus,
        distance : Double,
        coordinate: CLLocationCoordinate2D,
        tags : [String]?,
        medias : [UIImage]?,
        helperId : UserProfile?,
        genderPreference : Gender?,
        agePreference : AgePreference?
    ) {
        self.id = id
        self.jobPosterId = jobPosterId
        self.postingDate = postingDate
        self.urgency = urgency
        self.title = title
        self.desc = desc
        self.price = price
        self.status = status
        self.distance = distance
        self.coordinate = coordinate
        self.tags = tags
        self.medias = medias
        self.helperId = helperId
        self.genderPreference = genderPreference
        self.agePreference = agePreference
    }
}

//MARK: - Real Data
//This struct is used for current homepage
class Job: NSObject, MKAnnotation {

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
	var coordinates: [Double] = []
}
