//
//  PhotoStore.swift
//  FinanceApp
//
//  Created by Dave Pierre on 2021-03-28.
//

import Foundation
import UIKit

class PhotoStore {
        private let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
        
    func fetchImage(for photo: Photo, completion: @escaping (ImageResult)->Void){
        let photoURL = photo.remoteURL
        let request = URLRequest(url: photoURL)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            let result = self.processImageRequest(data: data, error: error)
            
            if case let .success(image) = result {
                photo.image = image
            }
            
            completion(result)

        }
        task.resume()
    }
    func fetchRecentPhotos(completion: @escaping (PhotoResult) ->Void){
          let url = FlickrAPI.recentPhotosURL()
          let request = URLRequest(url: url)
          let task = session.dataTask(with: request){
              (data, response, error) -> Void in

              let result = self.processRecentPhotosRequest(data: data, error: error)
              completion(result)
          }
          task.resume()
      }
    private func processImageRequest(data: Data?, error: Error?) ->ImageResult {
            guard
            let imageData = data,
            let image = UIImage(data: imageData)
            else {
                //could not create image
                if data == nil { return .failure(error!) }
                else {return .failure(PhotoError.imageCreationError) }
            }
            return .success(image)
        }

    
    func processRecentPhotosRequest(data: Data?, error: Error?) -> PhotoResult {
        guard let jsonData:Data = data
        else {
            return .failure(error!)
        }
        return FlickrAPI.photos(fromJSON: jsonData)
    }
    
    

}

