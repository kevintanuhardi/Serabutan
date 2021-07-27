//
//  Job.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 24/07/21.
//

import MapKit

enum Urgency {
    case high
    case medium
    case low
}

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
