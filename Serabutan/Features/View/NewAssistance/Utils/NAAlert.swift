//
//  NAAlert.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 08/08/21.
//

import Foundation
import UIKit

extension NewAssistanceVC {

    func createAlert(){
        let alert = UIAlertController(title: "Tambahkan Media", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Ambil Foto",
                                      style: .default,
                                      handler: { action in
                                        ImageHelper.startMediaBrowser(delegate: self, sourceType: .camera)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Pilih dari Galeri",
                                      style: .default,
                                      handler: { action in
                                        ImageHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
                                      }))
        
        alert.addAction(UIAlertAction(title: "Batalkan", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func createTitleEmpty(){
        let alert = UIAlertController(title: "Judul Bantuan", message: "Judul Bantuan tidak boleh kosong", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func createDescEmpty(){
        let alert = UIAlertController(title: "Deskripsi Bantuan", message: "Judul Bantuan tidak boleh kosong", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}
