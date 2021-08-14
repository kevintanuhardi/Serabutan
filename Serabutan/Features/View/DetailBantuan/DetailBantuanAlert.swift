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
    
    // Shown when user want to change their helpee once it's assigned
    func changeHelpee() {
        let alert = UIAlertController(title: "Ganti Helpee?",
                                      message: "Anda yakin ingin mengganti helpee? Aksi ini tidak dapat dibatalkan.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { action in
                                        self.selectedJob.status = .active
                                        self.selectedJob.helperId = nil
                                        self.configureHelper()
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Shown when user (helpee) want to withdraw their application
    func cancelJob() {
        let alert = UIAlertController(title: "Hapus Bantuan?",
                                      message: "Anda yakin ingin menghapus bantuan? Aksi ini tidak dapat dibatalkan.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { action in
                                        self.selectedJob.status = .cancelled
                                        self.setNavigationItems()
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Shown when user (helpee) want to withdraw their application
    func cancelHelpee() {
        let alert = UIAlertController(title: "Batalkan Bantuan?",
                                      message: "Anda yakin ingin membatalkan bantuan? Aksi ini tidak dapat dibatalkan.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { action in
                                        self.selectedJob.status = .active
                                        self.selectedJob.helperId = nil
                                        self.configureHelper()
                                      }))
        present(alert, animated: true, completion: nil)
    }
    
    // Edit the job detail, only available when the status is active (no helpee assigned)
    func editJobDetail() {
        let alert = UIAlertController(title: "Bantu Helpee?",
                                      message: "Dengan pilih Ya anda akan diarahkan ke Whatsapp Messenger.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tidak",
                                      style: .destructive,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: "Ya",
                                      style: .default,
                                      handler: { action in
                                        print("Editing Job Detail")
                                      }))
        present(alert, animated: true, completion: nil)
    }
}
