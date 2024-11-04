//
//  ViewController.swift
//  FoodDeliveryApp
//
//  Created by Bijantyum on 04/11/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var locationButton: UIButton = {
        let button: UIButton = UIButton(type: .roundedRect)
        button.setImage(UIImage(systemName: "mappin.and.ellipse"), for: .normal)
        button.setTitle("Pilih Lokasi", for: .normal)
        button.tintColor = .systemOrange
        var config = UIButton.Configuration.borderedTinted()
        config.buttonSize = .medium
        config.cornerStyle = .capsule
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var searchTextField: UISearchTextField = {
        let search = UISearchTextField(frame: .zero)
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Cari.."
        return search
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .vertical
           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.translatesAutoresizingMaskIntoConstraints = false
           collectionView.dataSource = self
           collectionView.delegate = self
           collectionView.register(RestaurantListCell.self, forCellWithReuseIdentifier: "restaurant_list")
           collectionView.register(CuisineCarouselListCell.self, forCellWithReuseIdentifier: "cuisine_carousel")
           return collectionView
    }()
    
    
    
    let viewModel: HomeViewModel
    init(viewModel: HomeViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onViewDidLoad()
    }


}

extension HomeViewController: HomeViewmodelDelegate{
    func setUpView() {
        view.backgroundColor = .white
        view.addSubview(locationButton)
        view.addSubview(searchTextField)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
            locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            locationButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16.0),
                   
            searchTextField.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 16.0),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
                   
                   collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16.0),
                   collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cuisine_carousel", for: indexPath) as? CuisineCarouselListCell else {
                return UICollectionViewCell()
            }
            cell.setupDataModel(dataModel: [
                CuisineListCellModel(cuisineImageURL: "https://example.com/image1.png", cuisineName: "Indonesia"),
                CuisineListCellModel(cuisineImageURL: "https://example.com/image2.png", cuisineName: "Japan"),
                CuisineListCellModel(cuisineImageURL: "https://example.com/image3.png", cuisineName: "Italy"),
                // Add more items as needed
            ])
            return cell
        }
        else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurant_list", for: indexPath) as? RestaurantListCell else{
                return UICollectionViewCell()
            }
            cell.setUpData(cellModel: RestaurantListCellModel(restaurantImageURL: "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg", restaurantName: "Jaksel Abies", cuisineName: "Ngopi, Makan"))
            return cell
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: UIScreen.main.bounds.width, height: CuisineCarouselListCell.getHeight())
        }else{
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 290.0)
        }
       
    }
}
