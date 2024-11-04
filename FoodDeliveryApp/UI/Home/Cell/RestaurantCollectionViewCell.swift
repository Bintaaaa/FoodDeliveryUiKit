//
//  FoodCollectionViewCell.swift
//  FoodDeliveryApp
//
//  Created by Bijantyum on 04/11/24.
//

import UIKit

class RestaurantListCell: UICollectionViewCell {
    private lazy var restaurantImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 18.0
        return image
    }()
    
    private lazy var restaurantLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var cuisineLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpData(cellModel: RestaurantListCellModel){
        if let imageUrlString: String = cellModel.restaurantImageURL,
           let imageUrl: URL = URL(string: imageUrlString){
            restaurantImageView.load(url: imageUrl)
        }
        restaurantLabel.text = cellModel.restaurantName
        cuisineLabel.text = cellModel.cuisineName
    }
}

extension RestaurantListCell{
    func setUpView(){
        contentView.backgroundColor = .white
        addSubview(restaurantImageView)
        addSubview(restaurantLabel)
        addSubview(cuisineLabel)
        
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: topAnchor),
            restaurantImageView.leftAnchor.constraint(equalTo: leftAnchor),
            restaurantImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            cuisineLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 16),
            cuisineLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            cuisineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            restaurantLabel.topAnchor.constraint(equalTo: cuisineLabel.bottomAnchor, constant: 8),
            restaurantLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            restaurantLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            restaurantLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
        
      
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 18
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.gray.cgColor
    }
}
