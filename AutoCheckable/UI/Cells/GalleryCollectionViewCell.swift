//
//  GalleryCollectionViewCell.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 07/06/2022.
//

import UIKit
import Kingfisher

class GalleryCollectionViewCell: UICollectionViewCell {
    
    let carImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemGray4.cgColor
       return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.addSubview(carImageView)
        self.layer.cornerRadius = 20
        NSLayoutConstraint.activate([
            carImageView.heightAnchor.constraint(equalToConstant: 60),
            carImageView.widthAnchor.constraint(equalToConstant: 100),
            carImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
    }

    func configure(with media: CarMediaList) {
        guard let url = URL(string: media.url) else {return}
        if media.type == "image/jpg" {
            self.carImageView.kf.setImage(with: url)
        } else if media.type == "video/mp4" {
            self.carImageView.image = UIImage(named: "playVideo")
        }
    }
}
