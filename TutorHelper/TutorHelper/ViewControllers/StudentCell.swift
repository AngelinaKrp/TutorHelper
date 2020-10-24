//
//  StudentCell.swift
//  TutorHelper
//
//  Created by Angelina on 24.10.2020.
//

import UIKit

final class StudentCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    static let reusableID = "StudentCell"
    
    // MARK: - Public methods
    
    func configure(with name: String) {
        nameLabel.text = name
    }
}
