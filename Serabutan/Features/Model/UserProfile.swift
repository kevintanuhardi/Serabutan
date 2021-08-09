//
//  UserProfile.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 02/08/21.
//

import Foundation
import UIKit

struct UserProfile {
    var id : Int
    var name : String
    var dob : Date
    var gender : Gender
    var avatar : UIImage?
    var bio :  String?
    var joinDate : Date
    var isVerified : Bool
    var statistics : ProfileStatistic?
}
