//
//  CarDetailsViewController.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 07/06/2022.
//

import UIKit
import Kingfisher
import AVKit
import AVFoundation

class CarDetailsViewController: UIViewController {

    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var sliderCollectionVIew: UICollectionView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var checkoutPriceLabel: UILabel!
    
    @IBOutlet weak var addToCartButton: UIButton!
    
    @IBOutlet weak var backgroundContainerView: UIView!
    
    @IBOutlet weak var carNameTitleLabel: UILabel!
    
    @IBOutlet weak var bottomBackground: UIView!
    
    
    var carID: String = ""
    var videoURL: String = ""
    private var carDetails: CarDetails?
    private var carMedia = [CarMediaList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchCarDetails()
        fetchCarMedia()
        print("Car ID \(carID)")
    }
    
    private func setupView() {
        priceLabel.layer.cornerRadius = 10
        priceLabel.clipsToBounds = true
        backgroundContainerView.layer.cornerRadius = 20
        carImageView.clipsToBounds = true
        carImageView.layer.cornerRadius = 20
        carImageView.layer.borderWidth = 2
        carImageView.layer.borderColor = UIColor.systemGray5.cgColor
        bottomBackground.layer.cornerRadius = 10
        addToCartButton.layer.cornerRadius = 10
        addToCartButton.backgroundColor = .label
        sliderCollectionVIew.delegate = self
        sliderCollectionVIew.dataSource = self
        sliderCollectionVIew.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "GalleryCollectionViewCell")
    }
    
    private func fetchCarDetails() {
        Services.carDetails(carID: carID) { result in
            switch result {
            case .success(let details):
                self.carDetails = details
                DispatchQueue.main.async {
                    self.setupCarDetails()
                }
            case .failure(let error):
                print("Error Error \(error)")
            }
        }
    }
    
    private func fetchCarMedia() {
        Services.carMedia(carID: carID) { result in
            switch result {
            case .success(let media):
                self.carMedia = media.carMediaList
                DispatchQueue.main.async {
                    self.sliderCollectionVIew.reloadData()
                }
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
    private func setupCarDetails() {
        carNameTitleLabel.text = carDetails?.carName
        if let url = carDetails?.imageURL,  let imageURL = URL(string: url) {
            carImageView.kf.setImage(with: imageURL)
        }
        if let price = carDetails?.marketplacePrice {
            priceLabel.text = "$\(price)"
        }
        
        if let checkoutPrice = carDetails?.marketplacePrice {
            checkoutPriceLabel.text = "Total: \(checkoutPrice)"
        }
    }
    
    @objc private func handleTappedVideo(_ sender: UITapGestureRecognizer? = nil) {
        if let videoURL = URL(string: videoURL) {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
}

extension CarDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carMedia.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        if !carMedia.isEmpty{
            cell.configure(with: carMedia[indexPath.row])
        }
        return cell
    }
}

extension CarDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let carMedia = carMedia[indexPath.row]
        if let url = URL(string: carMedia.url) {
            DispatchQueue.main.async {
                if carMedia.type == "image/jpg" {
                    self.carImageView.kf.setImage(with: url)
                    self.carImageView.isUserInteractionEnabled = false
                } else if carMedia.type == "video/mp4" {
                    self.carImageView.image = UIImage(named: "playVideo")
                    self.videoURL = carMedia.url
                    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTappedVideo(_:)))
                    self.carImageView.addGestureRecognizer(tap)
                    self.carImageView.isUserInteractionEnabled = true
                }
            }
        }
    }
}

extension CarDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
