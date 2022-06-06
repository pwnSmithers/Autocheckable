//
//  ViewController.swift
//  AutoCheckable
//
//  Created by Mugalu Smith Yusuf on 06/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
 
    var carMake = [MakeList]()
    var cars = [Car]()

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    @IBOutlet weak var productListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }


    private func setupView() {
        self.categoriesCollectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        self.productListCollectionView.register(CarCollectionViewCell.self, forCellWithReuseIdentifier: "CarCollectionViewCell")
        fetchCategories()
        fetchAllCars()
    }
    
    private func fetchCategories() {
        Services.popularCars {[weak self] result in
            switch result {
            case .success(let response):
                self?.carMake = response.makeList
                DispatchQueue.main.async {
                    self?.categoriesCollectionView.reloadData()
                }
                
                break
            case .failure(let error):
                print("Error is \(error.message)")
                break
            }
        }
    }
    
    private func fetchAllCars() {
        Services.searchCars { [weak self] result in
            switch result {
            case .success(let response):
                self?.cars = response.result
                DispatchQueue.main.async {
                    self?.productListCollectionView.reloadData()
                }
            case .failure(let error):
                print("Error \(error.messageKey)")
                break
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return carMake.count
        } else {
            return cars.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            if !carMake.isEmpty{
                cell.configureCell(with: carMake[indexPath.row])
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCollectionViewCell", for: indexPath) as! CarCollectionViewCell
            if !cars.isEmpty {
                cell.configureCell(with: cars[indexPath.row])
            }
            return cell
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            return CGSize(width: 100, height: 100)
        } else {
            return CGSize(width: 300, height: 300)
        }
    }
}
