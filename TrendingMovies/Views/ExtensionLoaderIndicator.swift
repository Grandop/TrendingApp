//
//  ExtensionLoaderIndicator.swift
//  TrendingMovies
//
//  Created by Pedro Grando on 06/12/22.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    static let loaderTag = 1938123987
    
    func showLoadingLarge(style: UIActivityIndicatorView.Style = .large) {
        var loading = viewWithTag(UIActivityIndicatorView.loaderTag) as? UIActivityIndicatorView
        if loading == nil {
            loading = UIActivityIndicatorView(style: style)
        }
        
        loading?.translatesAutoresizingMaskIntoConstraints = false //center loader
        loading!.startAnimating()
        loading!.hidesWhenStopped = true
        loading?.tag = UIActivityIndicatorView.loaderTag
        addSubview(loading!)
        
        loading?.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true //center loader
        loading?.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true //center loader
    }
    
    func stopLoading() {
        let loading = viewWithTag(UIActivityIndicatorView.loaderTag) as? UIActivityIndicatorView
        loading?.stopAnimating()
        loading?.removeFromSuperview()
    }
    
    
}
