//
//  StockAPI.swift
//  FlickrViewer
//
//  Created by Dave Pierre on 2021-03-09.
//  Copyright © 2021 COMP2601. All rights reserved.
//

import Foundation


struct StockAPI {
   private static let AlphAvantageAPIKey = "WBLAAN8BVBZHXPOY" //use our own key
    private static let baseURLString = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=SHOP.TRT&outputsize=full&apikey=demo"

    //used to get infromation from an API
    private static let finanaceModelbaseURLString = "https://financialmodelingprep.com"
    private static let financeModelAPIKEY="40d61e33f3a413f1c52d3cd0fe1c814e"
    private static let API_ENDPOINT = "/api/v3"
    //options found under the Ticker Search
    //https://financialmodelingprep.com/developer/docs/
    private static let exchangeOptions = ["ETF", "MUTUAL_FUND", "COMMODITY" ,"INDEX","CRYPTO", "FOREX", "TSX" , "AMEX" , "NASDAQ" , "NYSE" , "EURONEXT", "XETRA","NSE" ,"LSE"]
   
   enum Method : String {
        case  SYMBOL_SEARCH= API_ENDPOINT + "/search",
        case  MOST_ACTIVES = API_ENDPOINT + "/actives",
        case  STOCK_SCREENER = API_ENDPOINT + "/stock-screener",
        case  STOCK_PROFILE = API_ENDPOINT + "/profile/"
    }

    enum StockProfileResult {
        case success(StockProfile)
        case failure(Error)
    }

    enum FinancialModelError: Error {
        case invalidJSONData
    }
    private static func convertToURL(path: String?,parameters: [String:String]?) -> URL {

      var components = URLComponents(string: finanaceModelbaseURLString)!
      components.path = path ?? ""
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

    
    private static func stockURL(method: Method, parameters: [String:String]?) -> URL {

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

     
    //function used to search for a ticker
    // example of request :https://financialmodelingprep.com/api/v3/search-ticker?query=AA&limit=10&exchange=NASDAQ&apikey=demo
     public static func searchTicker()-> URL{
          return convertToURL(
             path: Method.SYMBOL_SEARCH
             parameters: [
            "query": query
            "limit" : "10",
            "exchange": exchange,
             "apikey": financeModelAPIKEY,
             ]) ??  URL(string: baseURLString)!;
     }  
     //function used to return the top gainers
     // example of request : https://financialmodelingprep.com/api/v3/actives?apikey=demo
     public static func getMostActives()-> URL{
          return convertToURL(
             path: Method.SYMBOL_SEARCH 
             parameters: [
             "apikey": financeModelAPIKEY,
             ]) ??  URL(string: baseURLString)!;
     }  
     // function used to fitler for stocks that meet a certain criteria
    //example of request :https://financialmodelingprep.com/api/v3/stock-screener?marketCapMoreThan=1000000000&betaMoreThan=1&volumeMoreThan=10000&sector=Technology&exchange=NASDAQ&dividendMoreThan=0&limit=100&apikey=demo
     // list of countries :https://financialmodelingprep.com/api/v3/get-all-countries?apikey=demo
    public static func stockScreen()-> URL{

            let marketCapMoreThan = String(10)
            let    volumeMoreThan = String(1000)
            let     sector = "Enbridge"
            let     exchange = "NASDAQ"
            let    dividendMoreThan = String(1.98)
            let    limit = String(10)
            
          return convertToURL(
            path: Method.STOCK_SCREENER
            parameters: [
                "marketCapMoreThan": marketCapMoreThan,
                "volumeMoreThan": volumeMoreThan,
                "sector": sector,
                "exchange": exchange,
                "dividendMoreThan": dividendMoreThan,
                "limit": limit,
                "apikey": financeModelAPIKEY,
                ]) ??  URL(string: baseURLString)!;
     }  


    //function used to get the profile of a stock
    // example : https://financialmodelingprep.com/api/v3/profile/AAPL?apikey=40d61e33f3a413f1c52d3cd0fe1c814e
    public static func getStockProfile(ticker : String ) -> URL {
        return convertToURL(
             path: Method.STOCK_PROFILE + ticker,
             parameters: [
             "apikey": financeModelAPIKEY,
             ]) ??  URL(string:baseURLString)!;
    }


    // function used to get the financial ratios of a stock
    //example :https://financialmodelingprep.com/api/v3/ratios-ttm/AAPL?apikey=demo
    public static func getStockRatios(ticker : String) -> URL {
        // replace oticker with a lists that in the end will be AAPl, FB@,...,
        return convertToURL(
             path: API_ENDPOINT + "/ratios-ttm/" + ticker,
             parameters: [
             "apikey": financeModelAPIKEY,
             ]) ??  URL(string:baseURLString)!;
    }

    static func stockProfile(fromJSON data: Data) -> Stock {
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            var finalPhotos = [Photo]()
            return .success(finalPhotos)
        }
        catch let error {
            return .failure(error)
        }
    }

    //TODO: delete later I think 
    public static func stockAPI() -> URL {
        return  URL(string:"https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=SHOP.TRT&outputsize=full&apikey=demo")!;
   }
}

print(StockAPI.getMostActives())
print(StockAPI.getStockProfile())
print(StockAPI.searchTicker())

