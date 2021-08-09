//
//  UserProfile.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 02/08/21.
//

import Foundation
import UIKit

class UserProfile {
    var id : Int
    var name : String
    var dob : Date
    var gender : Gender
    var avatar : UIImage?
    var bio :  String?
    var joinDate : Date
    var isVerified : Bool
    var statistics : ProfileStatistic?
    
    init(id : Int,
         name : String,
         dob : Date,
         gender : Gender,
         avatar : UIImage,
         bio : String,
         joinDate : Date,
         isVerified : Bool,
         statistics : ProfileStatistic){
        self.id = id
        self.name = name
        self.dob = dob
        self.gender = gender
        self.avatar = UIImage(named: "Avatar")
        self.bio = bio
        self.joinDate = Date()
        self.isVerified = false
        self.statistics = ProfileStatistic(reviewAggregate: 0.0, totalReview: 0, dibantu: 0, membantu: 0)
    }
}
