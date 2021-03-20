//
//  PhotoStore.swift
//  FlickrViewer
//
//  Created by Louis Nel on 2018-03-04.
//  Copyright © 2018 COMP2601. All rights reserved.
//

import Foundation

class PhotoStore {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchRecentPhotos(){
        let url = FlickrAPI.recentPhotosURL()
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8){
                    print("data coming in")
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
