//
//  StockStore.swift
//  FlickrViewer
//
//  Created by Dave Pierre on 2021-03-09.
//  Copyright © 2021 COMP2601. All rights reserved.
//


import Foundation

class StockStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchRecentPhotos(){
        //let url = FlickrAPI.recentPhotosURL()
        let url = StockAPI.stockAPI()
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8){
                    print("DATA that is new ")
                    print(url)
                    print("DATA that is  ")
                    print(jsonString)
                }
            } else if let requestError = error {
                print("ERROR: fetching recent photos: \(requestError)")
            } else {
                print("ERROR: unexpected error with request")
            }
        }
        task.resume()
    }
}

