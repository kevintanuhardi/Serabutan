//
//  Enum.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 26/07/21.
//

import Foundation
import UIKit

enum Urgency: String, CaseIterable {
    case tinggi = "Urgensi tinggi"
    case sedang = "Urgensi sedang"
    case rendah = "Urgensi rendah"
    
    func getImage()-> UIImage{
        switch self {
        case .tinggi:
            return UIImage(systemName: "circle.fill")!
        case .sedang:
            return UIImage(systemName: "circle.fill")!
        default:
            return UIImage(systemName: "circle.fill")!
        }
    }
    
    func getBGColor()-> UIColor{
        switch self {
        case .tinggi:
            return UIColor(red: 0.88, green: 0.08, blue: 0.08, alpha: 0.10)
        case .sedang:
            return UIColor(red: 0.88, green: 0.46, blue: 0.08, alpha: 0.10)
        default:
            return UIColor(red: 1.00, green: 0.81, blue: 0.14, alpha: 0.10)
        }
    }
    
    func getSymbolColor()-> UIColor{
        switch self {
        case .tinggi:
            return UIColor(red: 0.88, green: 0.08, blue: 0.08, alpha: 1.00)
        case .sedang:
            return UIColor(red: 0.88, green: 0.46, blue: 0.08, alpha: 1.00)
        default:
            return UIColor(red: 1.00, green: 0.81, blue: 0.14, alpha: 1.00)
        }
    }
}

enum Status: String, CaseIterable {
    case diberikan = "Diberikan"
    case diterima = "Diterima"
    case selesai = "Selesai"
    case dibatalkan = "Dibatalkan"
    
    func getImage()-> UIImage{
        switch self {
        case .diberikan:
            return UIImage(systemName: "arrow.up")!
        case .diterima:
            return UIImage(systemName: "arrow.down")!
        case .selesai:
            return UIImage(systemName: "checkmark")!
        default:
            return UIImage(systemName: "checkmark")!
        }
    }
    
    func getBGColor()-> UIColor{
        switch self {
        case .diberikan:
            return UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
        case .diterima:
            return UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
        case .selesai:
            return UIColor(red: 0.16, green: 0.60, blue: 0.00, alpha: 0.10)
        default:
            return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.00)
        }
    }
    
    func getSymbolColor()-> UIColor{
        switch self {
        case .diberikan:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        case .diterima:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        case .selesai:
            return UIColor(red: 0.16, green: 0.60, blue: 0.00, alpha: 1.00)
        default:
            return UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.00)
        }
    }
}
