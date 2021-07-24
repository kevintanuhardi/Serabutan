//
//  MapKitAnnotationCellViewController.swift
//  Serabutan
//
//  Created by Kevin Tanuhardi on 24/07/21.
//

import UIKit

class MapKitAnnotationCellViewController: UIViewController {

    @IBOutlet weak var urgencyIndicator: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urgencyIndicator.layer.cornerRadius = urgencyIndicator.frame.size.width / 2
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
