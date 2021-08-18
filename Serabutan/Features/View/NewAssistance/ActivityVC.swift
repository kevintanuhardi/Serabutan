//
//  ActivityVC.swift
//  Serabutan
//
//  Created by Dimas Pramudya Satria H on 04/08/21.
//

import UIKit

class ActivityVC: UIViewController {

    @IBOutlet weak var activityTopView: UIView!
    @IBOutlet weak var activityBodyView: UIView!
    @IBOutlet weak var activitySC: UISegmentedControl!
    
    let historyVC = HistoryActivityVC()
    let ongoingVC = OngoingActivityVC()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        setup()
    }
    
    private func setup(){
        addChild(historyVC)
        addChild(ongoingVC)
        self.activityBodyView.addSubview(historyVC.view)
        self.activityBodyView.addSubview(ongoingVC.view)
        
        historyVC.didMove(toParent: self)
        ongoingVC.didMove(toParent: self)
        
        historyVC.view.frame = self.activityBodyView.bounds
        ongoingVC.view.frame = self.activityBodyView.bounds
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl){
        ongoingVC.view.isHidden = true
        historyVC.view.isHidden = true
        
        if sender.selectedSegmentIndex == 0 {
            ongoingVC.view.isHidden = false
        }else if sender.selectedSegmentIndex == 1{
            historyVC.view.isHidden = false
        }
    }
}

extension ActivityVC {
    func setupBackButton() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: UIBarButtonItem.Style.plain,
                                                           target: nil,
                                                           action: nil)
    }
}
