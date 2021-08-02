//
//  Job.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 24/07/21.
//

import MapKit
import UIKit

enum Urgency {
    case High, Medium, Low
}

enum JobStatus {
    case Active, Taken, Cancelled, Done
}

enum Gender {
    case Male, Female, Other
}

enum AgePreference {
    case Adolescence, Adult, Senior
}

// This struct is used for home page
class Job: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let urgency: Urgency?
    let price: Int?
    let coordinate: CLLocationCoordinate2D
    
    init(
        title: String?,
        locationName: String?,
        urgency: Urgency?,
        price: Int?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.locationName = locationName
        self.urgency = urgency
        self.price = price
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}

// This struct is used for dummy data
struct Jobs {
    let id : Int
    let jobPosterId : UserProfile
    
    // Job Details
    let postingDate : Date
    let urgency : Urgency
    let title : String
    let desc : String?
    let price : Int
    let status : JobStatus
    let distance : Double
    
    let tags : [String]?
    let medias : [UIImage]?
    var helperId : UserProfile?
    
    // Job Preference
    let genderPreference : Gender?
    let agePreference : AgePreference?
}
