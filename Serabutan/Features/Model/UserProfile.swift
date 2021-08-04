//
//  UserProfile.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 02/08/21.
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
