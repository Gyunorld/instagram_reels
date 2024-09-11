//
//  StoryCollectionViewCell.swift
//  CatstaGram
//
//  Created by 김민규 on 9/9/24.
//

import UIKit

// 작업 전에 UIView로 백그라운드를 만들어주고 진행!!!!
class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewImageBackground: UIView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        imageViewUserProfile.clipsToBounds = true
        // Initialization code
    }

}
