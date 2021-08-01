//
//  DummyData.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import Foundation
import UIKit

class DummyData {
    static let shared = DummyData()
    
    private var userProfile = [UserProfile]()
    private var profileStatistic = [ProfileStatistic]()
    private var userReview = [Review]()
    
    init(){
    }
    
    private func seedUserProfile() {
        userProfile.append(UserProfile(name: "Guy Hawkins",
                                       avatar: UIImage(named: "avatar-0"),
                                       bio: "Typical bacon evangelist. Incurable music enthusiast. Certified troublemaker.",
                                       joinDate: Date(timeInterval: -(60*60*24)*10, since: Date()),
                                       isVerified: true,
                                       statistics: profileStatistic[0]))
        userProfile.append(UserProfile(name: "Cody Fisher",
                                       avatar: UIImage(named: "avatar-1"),
                                       bio: "Infuriatingly humble web fanatic. Bacon fan. Troublemaker. Certified organizer. Internet junkie. Travel trailblazer.",
                                       joinDate: Date(timeInterval: -(60*60*24)*15, since: Date()),
                                       isVerified: true,
                                       statistics: profileStatistic[1]))
        userProfile.append(UserProfile(name: "Theresa Webb",
                                       avatar: UIImage(named: "avatar-2"),
                                       bio: "Typical zombie ninja. Internet advocate. Freelance troublemaker. Friendly web enthusiast.",
                                       joinDate: Date(timeInterval: -(60*60*24)*35, since: Date()),
                                       isVerified: false,
                                       statistics: profileStatistic[2]))
        userProfile.append(UserProfile(name: "Marvin McKinney",
                                       avatar: UIImage(named: "avatar-3"),
                                       bio: "Incurable gamer. Infuriatingly humble coffeeaholic. Wannabe food scholar. Evil alcohol fan. Reader.",
                                       joinDate: Date(timeInterval: -(60*60*24)*20, since: Date()),
                                       isVerified: true,
                                       statistics: profileStatistic[3]))
        userProfile.append(UserProfile(name: "Savannah Nguyen",
                                       avatar: UIImage(named: "avatar-4"),
                                       bio: "Social media ninja. Subtly charming tv evangelist. Unapologetic coffee af.",
                                       joinDate: Date(timeInterval: -(60*60*24)*9, since: Date()),
                                       isVerified: false,
                                       statistics: profileStatistic[4]))
        userProfile.append(UserProfile(name: "Kathryn Murphy",
                                       avatar: UIImage(named: "avatar-5"),
                                       bio: "Infuriatingly humble web geek. Coffee practitioner. Prone to fits of apathy. Thinker. Internet evangelist. Alcoholaholic. Music aficionado.",
                                       joinDate: Date(timeInterval: -(60*60*24)*11, since: Date()),
                                       isVerified: false,
                                       statistics: profileStatistic[5]))
    }
    
    private func seedProfileStatistic() {
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.8, totalReview: 30, diberikan: 15, diterima: 15))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.0, totalReview: 10, diberikan: 10, diterima: 0))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.5, totalReview: 5, diberikan: 0, diterima: 5))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.2, totalReview: 2, diberikan: 2, diterima: 0))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.9, totalReview: 10, diberikan: 6, diterima: 4))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 5.0, totalReview: 4, diberikan: 4, diterima: 0))
    }
    
    private func seedUserReview() {
        userReview.append(Review(jobTitle: "Vacuuming and/or Mopping Floors",
                                 finishedDate: Date(timeInterval: -(60*60*24), since: Date()),
                                 reviewPoint: 4,
                                 reviewText: "I love my Hyundai azera limited. It has blind spot detection which has saved me many of times. It also has a backup camera so I can back up into parking spots easily. The sunroof is perfect for the warm summer days and the heated seats warm up so quickly on winter days.",
                                 reviewer: userProfile[0]))
        userReview.append(Review(jobTitle: "Scrubbing Sinks, Tubs, Showers",
                                 finishedDate: Date(timeInterval: -(60*60*24)*3, since: Date()),
                                 reviewPoint: 5,
                                 reviewText: "Hyundai azera sedan gains more safety features, such as blind spot detection and lane change assist.8-inch LCD navigation/multimedia interface is standard and includes google poi search and apple’s eyes-free siri integration. Plenty of standard features. Smooth ride quality. Quiet and spacious cabin. Large trunk. Long warranty coverage.",
                                 reviewer: userProfile[1]))
        userReview.append(Review(jobTitle: "Assisting with Administrative Tasks",
                                 finishedDate: Date(timeInterval: -(60*60*24)*5, since: Date()),
                                 reviewPoint: 3,
                                 reviewText: "I am very happy with my vehicle. I like the fact that it has performance as well as style. The interior looks like cars in a much higher class such as Mercedes Lexus etc. The engine has never given any problems. The car looks like the day it was purchased. I would definitely purchase another vehicle like mine.",
                                 reviewer: userProfile[2]))
        userReview.append(Review(jobTitle: "Scrubbing Out the Fridge",
                                 finishedDate: Date(timeInterval: -(60*60*24)*10, since: Date()),
                                 reviewPoint: 4,
                                 reviewText: "My car has rearview camera to help you when backing up. Its features include heated and cooling seats in the front and back. The back seats fold down to enable you to transport large items. It has Bluetooth so you can pair your phone, Sirius XM, and you can download an app that will allow you to auto start, unlock, turn on and off the heat and ac, and provides the car maintenance status. The only thing that I do not like is that the front bumper is easy to get damaged. The front bumper has snapped one twice so far and had to be replaced.",
                                 reviewer: userProfile[3]))
        userReview.append(Review(jobTitle: "Assisting with Financial Recordkeeping",
                                 finishedDate: Date(timeInterval: -(60*60*24)*15, since: Date()),
                                 reviewPoint: 5,
                                 reviewText: "I like the look of this car. It is very comfortable. It get good gas mileage.",
                                 reviewer: userProfile[4]))
        userReview.append(Review(jobTitle: "Assisting with Food Preparation",
                                 finishedDate: Date(timeInterval: -(60*60*24)*16, since: Date()),
                                 reviewPoint: 4,
                                 reviewText: "Very reliable. Color is grey. Very good looking car. Only issue is it uses more gas then I would have expected. The rearview camera is very helpful for safety, and tech wise it is up to date with a nice sound system. It can safely transport 5 people, and has room for luggage etc; in the back.",
                                 reviewer: userProfile[5]))
    }
    
    func seedData() {
        seedProfileStatistic()
        seedUserProfile()
        seedUserReview()
    }
    
    func getUserProfile() -> [UserProfile] {
        return userProfile
    }
    
    func getProfileStatistic() -> [ProfileStatistic] {
        return profileStatistic
    }
    
    func getUserReview() -> [Review] {
        return userReview
    }
    
}
