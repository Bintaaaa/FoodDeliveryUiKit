//
//  HomeViewModel.swift
//  FoodDeliveryApp
//
//  Created by Bijantyum on 04/11/24.
//

protocol HomeViewmodelProtocol: AnyObject{
    func onViewDidLoad()
    var delegate: HomeViewmodelDelegate? {get set}
    func fetchRestaurant() -> [RestaurantListCellModel]
    
}
protocol HomeViewmodelDelegate: AnyObject{
    func setUpView()
    func reloadData()
}

class HomeViewModel: HomeViewmodelProtocol{
    
    private var restaurantCellList: [RestaurantListCellModel] = []
    
    func fetchRestaurant() -> [RestaurantListCellModel] {
        return restaurantCellList
    }
    
   weak var delegate: HomeViewmodelDelegate?
    
    func onViewDidLoad(){
        fetchRestaurantList()
        delegate?.setUpView()
    }
}

private extension HomeViewModel{
    func fetchRestaurantList(){
        let datasource =  RestaurantRemoteDatasources()
        datasource.requestRestaurantList{[weak self] data, error in
        
            guard let self else {return}
            if let data, !data.isEmpty {
                self.convertToCell(restaurantList: data)
                self.delegate?.reloadData()
            }
            else if let error{
                
            }
        }
    }
    
    func convertToCell(restaurantList:[RestaurantData]){
        var restaurantCellModel: [RestaurantListCellModel] = []
        for item in restaurantList{
            restaurantCellModel.append(RestaurantListCellModel(restaurantImageURL: item.imageURL, restaurantName: item.name, cuisineName: item.cuisine))
            self.restaurantCellList = restaurantCellModel
        }
    }
}

