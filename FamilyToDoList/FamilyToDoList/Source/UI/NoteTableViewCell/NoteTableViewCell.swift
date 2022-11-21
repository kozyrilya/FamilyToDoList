//
//  NoteTableViewCell.swift
//  FamilyToDoList
//
//  Created by Illia Kozyr on 11/21/22.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet private var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with text: String) {
        descriptionLabel.text = text
        descriptionLabel.font = .systemFont(ofSize: 16)
    }
}
