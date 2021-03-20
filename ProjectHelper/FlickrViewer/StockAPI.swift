//
//  StockAPI.swift
//  FlickrViewer
//
//  Created by Dave Pierre on 2021-03-09.
//  Copyright © 2021 COMP2601. All rights reserved.
//

import Foundation


struct StockAPI {
   private static let baseURLString = "https://api.flickr.com/services/rest"
   private static let APIKey = "WBLAAN8BVBZHXPOY" //use our own key
    private static let URLString = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=SHOP.TRT&outputsize=full&apikey=demo"
    private static let yahooURL="https://query1.finance.yahoo.com/v7/finance/quote?symbols=CU.TO"
    
    enum Method: String {
        case CompanyOverview = "OVERVIEW"
    }
   public static func stockAPI() -> URL {
    return URL(string: URLString) ??  URL(string:"https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=SHOP.TRT&outputsize=full&apikey=demo")!;
   }
    
    private static func stockURL(method: Method, parameters: [String:String]?) -> URL {
      //return URL(string: "")! //for now
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
     
    static func recentPhotosURL()->URL {
         return stockURL(method: .CompanyOverview, parameters: [
             "function": Method.CompanyOverview.rawValue,
             "format": "json",
             "nojsoncallback": "1",
             "apikey": APIKey,
             "extras": "url_h,date_taken"])
     }
     
    
    
}
