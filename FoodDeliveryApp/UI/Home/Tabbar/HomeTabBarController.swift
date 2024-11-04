//
//  Home.swift
//  FoodDeliveryApp
//
//  Created by Bijantyum on 04/11/24.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    let viewModel: HomeTabBarViewModelProtocol
    init(viewModel: HomeTabBarViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.onViewWillAppear()
    }
}

extension HomeTabBarController: HomeTabBarViewModelDelegate{
    func setUpView() {
        
        let homeTabBar: UITabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let search: UITabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let cart: UITabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 1)
        
        let homeVM = HomeViewModel()
        let homeVC = HomeViewController(viewModel: homeVM)
        homeVC.tabBarItem = homeTabBar
        
        
        let searchVC = SearchViewController()
        searchVC.tabBarItem = search
        
        let cartVC = CartViewController()
        cartVC.tabBarItem = cart
        
        viewControllers = [homeVC, searchVC, cartVC]
        tabBar.backgroundColor = .white
        tabBar.tintColor = UIColor.systemOrange
    }
}
