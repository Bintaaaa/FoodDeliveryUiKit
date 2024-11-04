//
//  RestaurantData.swift
//  FoodDeliveryApp
//
//  Created by Bijantyum on 04/11/24.
//

import Foundation


class RestaurantRemoteDatasources{
    func requestRestaurantList(completionBlock: @escaping ([RestaurantData]?, Error?) -> Void) {
        guard let url: URL = URL(string: "https://restaurant-api-f0974-default-rtdb.firebaseio.com/restaurants.json") else {
            completionBlock(nil, NSError(domain: "Invalid URL", code: -1))
            return
        }
        let urlRequest: URLRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                completionBlock(nil, error)
                return
            }
            
            guard let data = data else {
                completionBlock(nil, NSError(domain: "Data invalid", code: -2))
                return
            }
            
            //decode json
            do {
                let decoder = JSONDecoder()
                let restaurants = try decoder.decode([RestaurantData].self, from: data)
                completionBlock(restaurants, nil)
            } catch {
                completionBlock(nil, error)
            }
        }
        task.resume()
    }
}
