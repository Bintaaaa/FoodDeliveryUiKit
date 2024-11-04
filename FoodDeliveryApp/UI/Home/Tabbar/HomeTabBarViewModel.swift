//
//  HomeTabBarViewModel.swift
//  FoodDeliveryApp
//
//  Created by Bijantyum on 04/11/24.
//

protocol HomeTabBarViewModelProtocol: AnyObject{
    func onViewWillAppear()
    var delegate: HomeTabBarViewModelDelegate? {get set}
}
protocol HomeTabBarViewModelDelegate: AnyObject{
    func setUpView()
}

class HomeTabBarViewModel: HomeTabBarViewModelProtocol{
    weak var delegate:  HomeTabBarViewModelDelegate?
    
    func onViewWillAppear() {
        delegate?.setUpView()
    }
}


