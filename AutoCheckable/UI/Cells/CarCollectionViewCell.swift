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
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let carLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
       return label
    }()
    
    let starImage: UIImageView = {
       var gold = #colorLiteral(red: 0.9882352941, green: 0.7607843137, blue: 0, alpha: 1)
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = gold
       return imageView
    }()
    
    let ratingLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "(0.0)"
        label.textColor = .systemGray4
        label.font = .systemFont(ofSize: 15, weight: .medium)
       return label
    }()
    
    let brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .systemGray4
        return label
    }()
    
    let priceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
       return label
    }()
    
    let addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Add"), for: .normal)
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
        self.addSubview(backgroundContainerView)
        self.addSubview(carImageView)
        self.addSubview(carLabel)
        self.addSubview(ratingLabel)
        self.addSubview(starImage)
        self.addSubview(brandLabel)
        self.addSubview(priceLabel)
        self.addSubview(addToCartButton)
        carImageView.layer.cornerRadius = 20
        carImageView.clipsToBounds = true
        carImageView.layer.borderWidth = 2
        carImageView.layer.borderColor = UIColor.white.cgColor
        NSLayoutConstraint.activate([
            backgroundContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            backgroundContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            backgroundContainerView.heightAnchor.constraint(equalToConstant: 280),
            
            carImageView.heightAnchor.constraint(equalToConstant: 230),
            carImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -50),
            carImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            carImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            carLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            carLabel.topAnchor.constraint(equalTo: self.carImageView.bottomAnchor, constant: 10),
            
            ratingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ratingLabel.topAnchor.constraint(equalTo: self.carImageView.bottomAnchor, constant: 10),
            
            starImage.topAnchor.constraint(equalTo: self.carImageView.bottomAnchor, constant: 10),
            starImage.trailingAnchor.constraint(equalTo: self.ratingLabel.leadingAnchor, constant: -10),
            
            brandLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            brandLabel.topAnchor.constraint(equalTo: self.carLabel.bottomAnchor, constant: 5),
            
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(equalTo: self.brandLabel.bottomAnchor, constant: 5),
            
            addToCartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            addToCartButton.topAnchor.constraint(equalTo: self.ratingLabel.bottomAnchor, constant: 20),
            addToCartButton.widthAnchor.constraint(equalToConstant: 40),
            addToCartButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        backgroundContainerView.layer.cornerRadius = 20
    }
    
    func configureCell(with car: Car) {
        guard let url = URL(string: car.imageURL) else {return}
        carImageView.kf.setImage(with: url)
        carLabel.text = car.title
        if let rating = car.gradeScore?.rounded() {
            ratingLabel.text = String("(\(rating))")
        }
        brandLabel.text = "Toyota" //We aren't getting a category back
        priceLabel.text = String("\(car.marketplacePrice)")
    }
    
}
