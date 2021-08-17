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
         avatar : UIImage?,
         bio : String?,
         joinDate : Date,
         isVerified : Bool,
         statistics : ProfileStatistic){
        self.id = id
        self.name = name
        self.dob = dob
        self.gender = gender
        self.avatar = avatar
        self.bio = bio
        self.joinDate = joinDate
        self.isVerified = isVerified
        self.statistics = statistics
    }
}
