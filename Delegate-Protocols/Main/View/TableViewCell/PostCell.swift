//
//  PostCell.swift
//  Delegate-Protocols
//
//  Created by Mehmet Kerim ÖZEK on 17.12.2022.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postView.layer.cornerRadius = 16
    }

    func configureCell(item: PostElement) {
        titleLabel.text = item.title
        detailLabel.text = item.body
    }
}
