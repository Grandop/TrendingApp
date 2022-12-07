//
//  ExtensionUiImage.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 05/12/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadFrom(UrlAddress: String, completionHandler: @escaping() -> Void)   {
        guard let url = URL(string: UrlAddress) else {return}
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
                if let imageData = imageData {
                    if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                        completionHandler()
                    }
                }
            }
        }
    }
}
