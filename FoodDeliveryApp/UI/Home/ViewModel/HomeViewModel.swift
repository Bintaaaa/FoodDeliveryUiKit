//
//  HomeViewModel.swift
//  FoodDeliveryApp
//
//  Created by Bijantyum on 04/11/24.
//

protocol HomeViewmodelProtocol: AnyObject{
    func onViewDidLoad()
    var delegate: HomeViewmodelDelegate? {get set}
    
}
protocol HomeViewmodelDelegate: AnyObject{
    func setUpView()
}

class HomeViewModel: HomeViewmodelProtocol{
   weak var delegate: HomeViewmodelDelegate?
    
    func onViewDidLoad(){
        delegate?.setUpView()
    }
}

