//
//  DetailVC.swift
//  Delegate-Protocols
//
//  Created by Mehmet Kerim ÖZEK on 16.12.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var details: PostElement?
    
    static let shared = DetailVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        detailLabel.text = details?.body
        titleLabel.text = details?.title
    }
}
