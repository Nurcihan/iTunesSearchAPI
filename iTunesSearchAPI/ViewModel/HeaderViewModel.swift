//
//  HeaderViewModel.swift
//  SearchAPI
//
//  Created by Nurcihan KarayakalÄ± on 9.01.2022.
//

import UIKit

struct HeaderViewModel{
    let section :SegmentModel
    var title :String {
        return self.section.segmentTitle
    }
}
