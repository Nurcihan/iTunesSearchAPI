//
//  Constant.swift
//  SearchAPI
//
//  Created by Nurcihan Karayakalı on 9.01.2022.
//

import Foundation
import UIKit
struct GlobalConstants{
    static let COLOR_LIGHT_BLACK :UIColor = UIColor(red: 80/255, green: 90/255, blue: 110/255, alpha: 1.0)
    static let COLOR_LIGHT_GRAY :UIColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1.0)
    static let COLOR_NAV_COLOR :UIColor = UIColor(red: 0/255, green: 102/255, blue: 204/255, alpha: 1.0)
    static let COLOR_BORDER_BLUE :UIColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0)
    
    static let headerViewReuseIdentifier = "HeaderReusableView"
    static let footerViewReuseIdentifier = "CollectionFooterReusableView"
    static let cellReuseIdentifier = "ModelCollectionViewCell"
    
    
    
    static let allowedCharacters = CharacterSet(charactersIn:"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxyz,.!*%+#-_=()&'\"? ").inverted

}
