//
//  DetailBantuanAlert.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 12/08/21.
//

import Foundation
import UIKit

extension DetailBantuanVC {
    // Shown when user tap on 'Finish' button
    func finishedAlert() {
        let alert = UIAlertController(title: "Bantuan Telah Selesai?",
                                      message: "Mohon pastikan bantuan anda telah selesai.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { action in
                                        self.selectedJob.status = .done
                                        self.configureHelper()
                                        self.rateProfile()
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Shown when user applying for the job
    func whatsappAlert() {
        let alert = UIAlertController(title: "Bantu Helpee?",
                                      message: "Dengan pilih Ya anda akan diarahkan ke Whatsapp Messenger.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { action in
                                        self.selectedJob.status = .taken
                                        self.configureHelper()
                                        self.sendWhatsApp(template: true)
                                      }))
        present(alert, animated: true, completion: nil)
    }
}
