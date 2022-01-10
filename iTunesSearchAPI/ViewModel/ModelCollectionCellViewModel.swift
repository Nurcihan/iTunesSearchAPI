//
//  ModelCollectionViewModel.swift
//  SearchAPI
//
//  Created by Nurcihan Karayakalı on 7.01.2022.
//

import Foundation
struct ModelCollectionCellViewModel {
    let content :ContentModel
    
    var kind :String {
        return self.content.kind ?? ""
    }
    var trackName :String {
        return self.content.trackName ?? ""
    }
    var artworkUrl100 :String {
        return self.content.artworkUrl100 ?? ""
    }
   
}
