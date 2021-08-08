//
//  RatingReviewNavigationSetup.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 08/08/21.
//

import UIKit

extension RatingReviewVC {
    func setupNavigation() {
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        // Set Title & Styling
        self.title = "Beri Penilaian"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.ColorLibrary.customBlack]
        
        // Set 'Lewati' Button
        let rightBarButton = UIBarButtonItem(title: "Lewati", style: .plain, target: self, action: #selector(lewatiBtn))
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .normal)
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.FontLibrary.textLink1], for: .application)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // 'Lewati' Button Action
    @objc func lewatiBtn(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // 'Kirim' Button Action
    @IBAction func kirimBtn(_ sender: Any) {
        DummyData.shared.addUserReview(job: selectedJob!, reviewPoint: reviewPoint ?? 0, reviewText: reviewTextView.text, reviewer: reviewer!, reviewee: reviewee!)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
