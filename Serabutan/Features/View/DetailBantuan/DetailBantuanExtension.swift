//
//  DetailBantuanExtension.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 12/08/21.
//

import Foundation
import UIKit

extension DetailBantuanVC {
    // WhatsApp API
    func sendWhatsApp(template: Bool) {
        let loggedUser = UserDefaults.standard.integer(forKey: "loggedUser")
        var message: String?
        let phoneNumber: Int = 6281910077402
        
        if template {
            message = """
            Halo Pak/Bu \(selectedJob.jobPosterId.name),
            saya \(DummyData.shared.getUserProfile()[loggedUser].name) dari BantuinApp bersedia membantu Bapak/Ibu untuk \(selectedJob.title ?? "Untitled Bantuan").
            Bagaimana saya bisa membantu? 🙂
            """
            message = message?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }
        
        let whatsappURL = URL(string: "https://api.whatsapp.com/send?phone=+\(phoneNumber)&text=\(message ?? "")")
        UIApplication.shared.open(whatsappURL!)
        
    }
    
    // Set tag list view
    func setTagList() {
        tagView.textFont = .FontLibrary.body
        if selectedJob.tags != nil {
            tagView.addTags(selectedJob.tags!)
        }
    }
    
    // Go to rate profile after finishing the job
    func rateProfile() {
        let rateProfile = RatingReviewVC()
        rateProfile.reviewee = selectedJob.jobPosterId
        rateProfile.reviewer = selectedJob.helperId!
        rateProfile.selectedJob = self.selectedJob
        self.navigationController?.pushViewController(rateProfile, animated: true)
    }
}
