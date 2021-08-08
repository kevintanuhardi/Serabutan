//
//  Review.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import Foundation
import UIKit

struct Review {
    let job : Jobs
    let finishedDate : Date
    let reviewPoint : Int
    let reviewText : String?
    let reviewer : UserProfile
    let reviewee : UserProfile
}
