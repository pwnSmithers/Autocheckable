//
//  CategoriesCollectionViewCell.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import UIKit
import Kingfisher

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    let imageBackgroundView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
       return view
    }()
    let categoryImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        
        self.addSubview(categoryTitleLabel)
        self.addSubview(imageBackgroundView)
        self.imageBackgroundView.addSubview(categoryImageView)
        
        categoryImageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageBackgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            imageBackgroundView.widthAnchor.constraint(equalToConstant: 50),
            imageBackgroundView.heightAnchor.constraint(equalToConstant: 50),
            imageBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            categoryImageView.widthAnchor.constraint(equalToConstant: 30),
            categoryImageView.heightAnchor.constraint(equalToConstant: 30),
            categoryImageView.centerYAnchor.constraint(equalTo: self.imageBackgroundView.centerYAnchor),
            categoryImageView.centerXAnchor.constraint(equalTo: self.imageBackgroundView.centerXAnchor),
 
            categoryTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categoryTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
            categoryTitleLabel.topAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: 2)
        ])
        imageBackgroundView.layer.cornerRadius = 25
    }
    
    func configureCell(with make: MakeList) {
        categoryTitleLabel.text = make.name
        guard let url = URL(string: make.imageURL) else {return}
        if make.imageURL.hasSuffix("jpg") {
            categoryImageView.kf.setImage(with: url)
        } else {
            categoryImageView.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
        }
    }
}
