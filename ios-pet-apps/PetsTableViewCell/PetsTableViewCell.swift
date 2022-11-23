//
//  PetsTableViewCell.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import UIKit
import Nuke

class PetsTableViewCell: UITableViewCell {

    @IBOutlet var petsImage: UIImageView?
    @IBOutlet var petsTitle: UILabel?
    @IBOutlet var contentCardView: UIView?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.petsTitle?.font = UIFont.boldSystemFont(ofSize: CGFloat(18.0))
        self.petsTitle?.backgroundColor = .clear
        self.petsTitle?.textColor = .black
        contentCardView?.backgroundColor = .white
        contentCardView?.layer.cornerRadius = 10.0
        contentCardView?.layer.shadowColor = UIColor.gray.cgColor
        contentCardView?.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        contentCardView?.layer.shadowRadius = 6.0
        contentCardView?.layer.shadowOpacity = 0.7
    }

    func setData(title: String, imageUrl: String) {
        self.petsTitle?.text = title
        DispatchQueue.main.async {
            if let url = URL(string: imageUrl) {
                Nuke.loadImage(with: url, into: self.petsImage ?? UIImageView())
            }
        }
    }
}
