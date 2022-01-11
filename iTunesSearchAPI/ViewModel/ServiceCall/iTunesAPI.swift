//
//  ItunesAPI.swift
//  SearchAPI
//
//  Created by Nurcihan Karayakalı on 5.01.2022.
//

import Foundation

class iTunesAPI {
    
    static let shared = iTunesAPI()
    let baseUrl = "https://itunes.apple.com/search?"
    var items :[ContentModel] = []
    
    func getContentResponseWithSearch(searchLink: URL, completion: @escaping ([SegmentModel]? , Int) -> ()){
        
        let task = URLSession.shared.sendRequest(url: searchLink, completionHandler:{(result: ResponseModel?, response, error) in
            if let error = error {
                print("Error: \(error)")
                completion(nil, 0)
                return
            }
            if let model = result?.results{
                self.items.append(contentsOf: model)
                completion(self.groupAndCreateSectionList(contentList:self.items) , model.count)
            }
            else{
                completion(nil, 0)
            }
        })
        task.resume()
    }
    
    func getServiceURL(word: String, itemsPerPage:Int, offset: Int)->URL{
        let url = URL(string: baseUrl + "term=\(word)&limit=\(itemsPerPage)&offset=\(offset)")!
        return url
    }
    
    func groupAndCreateSectionList( contentList:[ContentModel]) ->[SegmentModel]?{
        let groupedByWrapper = Dictionary(grouping: contentList) { $0.wrapperType }
        var newList = [SegmentModel]()
        for (key,valueList) in groupedByWrapper{
            let list = valueList
            let name = key ?? ""
            let segment = SegmentModel(segmentTitle: name, contentList: list)
            newList.append(segment)
        }
        let sortedList = newList.sorted(by: { $0.segmentTitle < $1.segmentTitle })
        return sortedList

    }
    
    
    

}
