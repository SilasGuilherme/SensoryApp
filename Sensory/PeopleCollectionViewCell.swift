//
//  PeopleCollectionViewCell.swift
//  Sensory
//
//  Created by Silas Guilherme on 31/08/21.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PeopleCollectionCell"
    
    @IBOutlet var imagePeople: UIImageView!
    @IBOutlet var myMoodText: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "PeopleCollectionViewCell", bundle: nil)
    }
    public func configure(with title: String, imageName: UIImage!) {
        myMoodText.text = title
        imagePeople.image = imageName
        
        // Initialization code
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imagePeople.contentMode = .scaleAspectFit
        
    }
}
