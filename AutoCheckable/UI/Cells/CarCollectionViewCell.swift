//
//  CarCollectionViewCell.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import UIKit
import Kingfisher

class CarCollectionViewCell: UICollectionViewCell {
 
    let backgroundContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let carLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let starImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    let ratingLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let addToCartButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
   //     self.addSubview(backgroundContainerView)
        self.addSubview(carImageView)
        carImageView.clipsToBounds = true
        carImageView.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
//            backgroundContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
//            backgroundContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
//            backgroundContainerView.heightAnchor.constraint(equalToConstant: 280),
            
            carImageView.heightAnchor.constraint(equalToConstant: 200),
            carImageView.widthAnchor.constraint(equalToConstant: 250),
            carImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
//            carImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            carImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
        ])
        
        backgroundContainerView.layer.cornerRadius = 20
    }
    
    func configureCell(with car: Car) {
        guard let url = URL(string: car.imageURL) else {return}
        carImageView.kf.setImage(with: url, options: [.processor(SVGImgProcessor())])
    }
    
}
