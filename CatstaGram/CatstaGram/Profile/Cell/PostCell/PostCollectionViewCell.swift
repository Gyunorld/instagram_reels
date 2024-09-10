//
//  PostCollectionViewCell.swift
//  CatstaGram
//
//  Created by 김민규 on 9/10/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData(){
        // 이미지뷰의 이미지를 업로드함
    }
}
