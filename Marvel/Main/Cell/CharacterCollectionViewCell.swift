//
//  CharacterCollectionViewCell.swift
//  Marvel
//
//  Created by Apple on 9/27/23.
//

import UIKit
import Kingfisher

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterImageView: UIImageView!{
        didSet{
            characterImageView.contentMode = .scaleToFill
        }
    }
    @IBOutlet weak var nameLabel: UILabel!{
        didSet{
            nameLabel.numberOfLines = 0
            nameLabel.textColor = .white
            nameLabel.font = .boldSystemFont(ofSize: 15)
        }
    }
    @IBOutlet weak var detailsLabel: UILabel!{
        didSet{
            detailsLabel.numberOfLines = 0
            detailsLabel.textColor = .white.withAlphaComponent(0.5)
            detailsLabel.font = .systemFont(ofSize: 12)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(model: Result){
        
        self.backgroundColor = Constants.Colors.appRed
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        self.nameLabel.text = model.name
        self.detailsLabel.text = model.descriptionField
        guard let thumbnail = model.thumbnail?.fullString() else {return}
        self.characterImageView.kf.setImage(with: URL(string: thumbnail))
    }
}
