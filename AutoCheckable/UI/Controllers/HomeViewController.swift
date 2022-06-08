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
    
    let exploreButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "square.grid.2x2.fill"), for: .normal)
        button.tintColor = .black
       return button
    }()

    let exploreLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let shoppingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bag"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
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
        
        let exploreBarButtonItem = UIBarButtonItem(customView: exploreButton)
        let exploreLabelItem = UIBarButtonItem(customView: exploreLabel)
        let shoppingCartItem = UIBarButtonItem(customView: shoppingButton)

        navigationItem.leftBarButtonItems = [exploreBarButtonItem, exploreLabelItem]
        navigationItem.rightBarButtonItems = [shoppingCartItem]
        self.title = ""
    }
    
    @objc func navigationItemsActions() {
      //TODO :- add navigationItems actions
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
            case .failure(_):
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
            case .failure(_):
                break
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if collectionView == productListCollectionView {
            if let vc = storyboard.instantiateViewController(withIdentifier: "CarDetailsViewController") as? CarDetailsViewController {
                vc.carID = cars[indexPath.row].id
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
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
            return CGSize(width: 300, height: 330)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoriesCollectionView {
            return 20
        } else {
            return 40
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == categoriesCollectionView {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        } else {
            return UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        }
    }
}
