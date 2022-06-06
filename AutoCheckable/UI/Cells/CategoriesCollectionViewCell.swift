//
//  CategoriesCollectionViewCell.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import UIKit
import Kingfisher

class CategoriesCollectionViewCell: UICollectionViewCell {
    
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
        self.addSubview(categoryImageView)
        self.addSubview(categoryTitleLabel)
        
        categoryImageView.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            categoryImageView.widthAnchor.constraint(equalToConstant: 50),
            categoryImageView.heightAnchor.constraint(equalToConstant: 50),
            
            categoryTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
            categoryTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
            categoryTitleLabel.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 2)
        ])
    }
    
    func configureCell(with make: MakeList) {
        categoryTitleLabel.text = make.name
        guard let url = URL(string: make.imageURL) else {return}
        categoryImageView.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
    }
}
