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
    
    
//    func fetchMedia(searchValue: String,
//                    completion: @escaping (ITunesDataModel?, Error?) -> Void) {
//        let urlString = NetworkConfiguration.basePath +
//        NetworkConfiguration.searchPath +
//        searchValue + NetworkConfiguration.path
//        let url = URL(string: urlString)!
//        let task = URLSession.shared.sendRequest(url: url,
//                                                 completionHandler: { (result: ITunesDataModel?, response, error) in
//            if let error = error {
//                completion(nil, error)
//            }
//            completion(result, nil)
//        })
//        task.resume()
//
//    }
//
    
    func getContentResponseWithSearch(searchLink: URL, completion: @escaping ([SegmentModel]? , Int) -> ()){
        
        let task = URLSession.shared.sendRequest(url: searchLink, completionHandler:{(result: ResponseModel?, response, error) in
        
        if let error = error {
            print("Error: \(error)")
            completion(nil, 0)
        }
            if let model = result?.results{
                self.items.append(contentsOf: model)
                completion(self.groupAndCreateSectionList(contentList:self.items) , model.count)
            }
            
        })
        task.resume()
        
        
        
//        AF.request(searchLink).responseData {(data) in
//            switch data.result {
//            case let .success(rawResponse):
//                do {
//                    let response = try JSONDecoder().decode(ResponseModel.self, from: rawResponse)
//                    self.items.append(contentsOf: response.results)
//                    completion(self.groupAndCreateSectionList(contentList:self.items) , response.results.count)
//                } catch {
//                    print("Error: \(error)")
//                    completion(nil,0)
//                }
//            case let .failure(error):
//                print(error)
//                completion(nil,0)
//            }
//        }
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
