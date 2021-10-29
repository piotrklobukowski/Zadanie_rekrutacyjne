//
//  CatDetailsTableViewCell.swift
//  Zadanie rekrutacyjne
//
//  Created by Piotr Kłobukowski on 28/10/2021.
//

import UIKit

class CatDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageOfCat: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    func configureCell(withText text: String?, andImage image: UIImage, imageHeight: CGFloat) {
        imageOfCat.image = image
        nameLabel.text = text
        imageHeightConstraint.constant = imageHeight
    }
}
