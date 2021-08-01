//
//  Review.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import Foundation
import UIKit

struct UserProfile {
    var name : String
    var avatar : UIImage?
    var bio :  String?
    let joinDate : Date
    var isVerified : Bool
    var statistics : ProfileStatistic?
}

struct ProfileStatistic {
    var reviewAggregate : Float?
    var totalReview : Int?
    var diberikan : Int?
    var diterima : Int?
}

struct Review {
    let jobTitle : String
    let finishedDate : Date
    let reviewPoint : Int
    let reviewText : String?
    let reviewer : UserProfile
}
