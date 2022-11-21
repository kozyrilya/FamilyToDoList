//
//  DoneTableViewCell.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/21/22.
//

import UIKit

class DoneTableViewCell: UITableViewCell {

    @IBOutlet private var checkMarkImageView: UIImageView!
    @IBOutlet private var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func configure(with text: String) {
        descriptionLabel.text = text
    }

    func setupUI() {
        checkMarkImageView.image = UIImage(named: "done_checkmark")
        descriptionLabel.font = .systemFont(ofSize: 16)
    }
}
