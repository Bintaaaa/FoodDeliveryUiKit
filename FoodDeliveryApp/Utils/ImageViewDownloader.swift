//
//  ImageViewDownloader.swift
//  FoodDeliveryApp
//
//  Created by Bijantyum on 04/11/24.
//

import UIKit


extension UIImageView{
    
    
    /// <#Description#>
    /// - Parameter url: to be loaded
    func load(url: URL){
        DispatchQueue.global().async{
            if let data = try? Data(contentsOf:url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self.image = image.resized(to: CGSize(width: 64, height: 64))
                    }
                }
            }
        }
    }
}

extension UIImage {
    func resized(to targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
