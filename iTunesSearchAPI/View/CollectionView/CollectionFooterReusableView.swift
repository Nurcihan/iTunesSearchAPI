//
//  CollectionFooterReusableView.swift
//  iTunesSearchAPI
//
//  Created by Nurcihan Karayakalı on 5.01.2022.
//

import UIKit

class CollectionFooterReusableView: UICollectionReusableView {
    let activityView: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false

        activityView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateUI(with item: FooterViewModel) {
        if(item.isShowLoading){
            activityView.startAnimating()
        }
        else{
           activityView.stopAnimating()
        }
    }
}
