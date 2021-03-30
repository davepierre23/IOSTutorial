//
//  FlickrAPI.swift
//  FinanceApp
//
//  Created by Dave Pierre on 2021-03-28.
//

import Foundation
import UIKit


enum PhotoError: Error {
    case imageCreationError
}


enum PhotoResult {
    case success([Photo])
    case failure(Error)
}

enum FlickrError: Error {
    case invalidJSONData
}

struct FlickrAPI {
    enum Method: String {
        case RecentPhotos = "flickr.photos.getRecent"
    }
   private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let APIKey = "681f721d0b004e5e96e0befaf3da5141"
    
    static func recentPhotosURL()->URL {
        return flickrURL(method: .RecentPhotos, parameters: [
            "method": Method.RecentPhotos.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": APIKey,
            "extras": "url_h,date_taken"])
    }
    private static func flickrURL(method: Method, parameters: [String:String]?) -> URL {
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
       
        if let additionalParams = parameters {
           for(key, value) in additionalParams {
               let item = URLQueryItem(name: key, value: value)
               queryItems.append(item)
           }
           
        }
        components.queryItems = queryItems
        return components.url!
      }
    
    
    private static let dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
          return formatter
     }()
    
    
    private static func photo(fromJSON json: [String:Any]) -> Photo? {
         guard
           let photoID = json["id"] as? String,
           let title = json["title"] as? String,
           let dateString = json["datetaken"] as? String,
           let photoURLString = json["url_h"] as? String,
           let url = URL(string: photoURLString),
           let dateTaken = dateFormatter.date(from: dateString)
         else {
             //Did not have all the info fields to create photo
             return nil
         }
         
         return Photo(title: title, photoID: photoID, remoteURL: url, dateTaken: dateTaken)
         
     }


    
    static func photos(fromJSON data: Data) -> PhotoResult {
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let photos = jsonDictionary["photos"] as? [String:Any],
                let photosArray = photos["photo"] as? [[String:Any]]
            else {
                    //Unexpected JSON structure
                    return .failure(FlickrError.invalidJSONData)
            }
            var finalPhotos = [Photo]()
            for photoJSON in photosArray {
                if let photo = photo(fromJSON: photoJSON){
                    finalPhotos.append(photo)
                }
            }
            if finalPhotos.isEmpty && !photosArray.isEmpty {
                //Not able to parse the Flickr Photos
                //Maybe the JSON format for photos has changed
                return .failure(FlickrError.invalidJSONData)
            }
            return .success(finalPhotos)
        }
        catch let error {
            return .failure(error)
        }
    }



}

