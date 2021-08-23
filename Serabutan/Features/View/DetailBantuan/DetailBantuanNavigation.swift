//
//  DetailBantuanNavigation.swift
//  Serabutan
//
//  Created by Gilang Adrian on 03/08/21.
//

import UIKit

extension DetailBantuanVC {
    
    @objc func shareButtonAction(_ sender: UIButton!) {
        let items: [Any] = [selectedJob?.title ?? "Share Bantuan", URL(string: "https://www.bantuinapp.com/testflight") as Any]
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        activityController.completionWithItemsHandler = { (_, success, _, error) in
            if success {
                print("Page is being shared.")
            } else {
                print("There was an error, ", error as Any)
            }
        }
        present(activityController, animated: true)
    }
    
    // Go to list bantuan and search query based on clicked tags
    func searchTag(tags: String) {
        let search = AssistanceListVC()
        // TODO: - Create search query variable on the job list page
        self.navigationController?.pushViewController(search, animated: true)
    }
    
    func sendWhatsApp(template: Bool) {
        guard let poster = selectedJob?.jobPosterId.name else { return }
        var message: String?
        let phoneNumber: Int = 6281910077402
        
        if template {
            message = """
            Halo Pak/Bu \(poster),
            saya \(DummyData.shared.getUserProfile()[currentUser].name) dari BantuinApp bersedia membantu Bapak/Ibu untuk \(selectedJob?.title ?? "Untitled Bantuan").
            Bagaimana saya bisa membantu? 🙂
            """
            message = message?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }
        
        let whatsappURL = URL(string: "https://api.whatsapp.com/send?phone=+\(phoneNumber)&text=\(message ?? "")")
        UIApplication.shared.open(whatsappURL!)
        
    }
    
    func goToProfile(sender: Int) {
        let userProfile = ProfileVC()
        if sender == 0 {
            userProfile.user = self.selectedJob?.jobPosterId
        } else {
            userProfile.user = self.selectedJob?.helperId
        }
        self.navigationController?.pushViewController(userProfile, animated: true)
    }
    
    // Go to rate profile after finishing the job
    func goToRateProfile() {
        let rateProfile = RatingReviewVC()
        rateProfile.reviewee = selectedJob?.jobPosterId
        rateProfile.reviewer = selectedJob?.helperId
        rateProfile.selectedJob = self.selectedJob
        self.navigationController?.pushViewController(rateProfile, animated: true)
    }
}
