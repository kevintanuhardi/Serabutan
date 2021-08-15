//
//  FloatingNotification.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 12/08/21.
//

import UIKit
import NotificationBannerSwift

enum NotificationType {
    case helpeeAssigned
    case helpeeCancelled
    case jobCancelled
}

class FloatingNotification {
    static let shared = FloatingNotification()
    
    init() {
    }
    
    func showNotification(type: NotificationType, job: Jobs) {
        let shortenedName = StringFormatter().shortenedName(fullName: job.helperId?.name ?? "Anonim")
        let defaultIcon = UIImage(systemName: "bell.badge")?.withTintColor(.ColorLibrary.accentColor)
        
        switch type {
        case .helpeeAssigned:
            showNotification(title: "\(shortenedName) Bersedia Membantu",
                             subtitle: job.title ?? "Hubungi helper untuk diskusi lebih lanjut.",
                             image: job.helperId?.avatar ?? defaultIcon!,
                             job: job)
        case .helpeeCancelled:
            break
        case .jobCancelled:
            break
        }
    }
    
    // Showing the notification
    private func showNotification(title: String, subtitle: String, image: UIImage, job: Jobs) {
        let notification = CustomNotification.createCustomNotification()
        let banner = FloatingNotificationBanner(customView: notification)
        
        notification.titleLabel?.text = title
        notification.subtitleLabel?.text = subtitle
        notification.leftImage?.image = image
        
        // Show notification banner
        banner.show(bannerPosition: .top,
                    queue: .default,
                    edgeInsets: UIEdgeInsets(top: 25, left: 10, bottom: 0, right: 10),
                    shadowColor: UIColor.ColorLibrary.mediumGrey,
                    shadowOpacity: 0.5,
                    shadowBlurRadius: 15,
                    shadowCornerRadius: 10,
                    shadowOffset: UIOffset(horizontal: 0, vertical: 10))
        banner.onTap = {
            let detailJob = DetailBantuanVC()
            let detailJobController = UINavigationController.init(rootViewController: detailJob)
            detailJob.selectedJob = job
            UIApplication.shared.windows.first?.rootViewController?.present(detailJobController, animated: true)
        }
    }
}
