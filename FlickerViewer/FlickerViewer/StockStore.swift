//
//  StockStore.swift
//  FinanceApp
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
    
    
 
  func fetchStockProfile(ticker: String ,completion: @escaping (StockProfileResult) ->Void){
        let url = StockAPI.getStockProfile(ticker: ticker)
        //create a Network request to the API
        print("the url \(url)")
        let request = URLRequest(url: url)
          let task = session.dataTask(with: request){
              (data, response, error) -> Void in

              let result = self.processStockProfileRequest(data: data, error: error)
              completion(result)
          }
        task.resume()
    }
    
    
    func fetchMostActiveStocks(completion: @escaping (ActiveStockResults) ->Void){
        let url = StockAPI.getMostActives()
        print("the url \(url)")
        let request = URLRequest(url: url)
          let task = session.dataTask(with: request){
              (data, response, error) -> Void in

              let result = self.processMostActiveStockRequest(data: data, error: error)
              completion(result)
          }
          task.resume()
      }

    
    func processMostActiveStockRequest(data: Data?, error: Error?) -> ActiveStockResults {
        guard let jsonData:Data = data
        else {
            return .failure(error!)
        }
        return StockAPI.mostActiveStocks(fromJSON: jsonData)
    }
    
      
    func fetchStockResults(query: String, exchange: String, completion: @escaping (StockSearchResults) ->Void){
        let url = StockAPI.searchTicker(query: query, exchange: exchange)
        //create a Network request to the API
        print("the url \(url)")
        let request = URLRequest(url: url)
          let task = session.dataTask(with: request){
              (data, response, error) -> Void in

              let result = self.processStockSearchRequest(data: data, error: error)
              completion(result)
          }
    
        task.resume()
    }
    
    func processStockSearchRequest(data: Data?, error: Error?) -> StockSearchResults {
        guard let jsonData:Data = data
        else {
            return .failure(error!)
        }
        return StockAPI.stockSearchResults(fromJSON: jsonData)
    }
    func processStockProfileRequest(data: Data?, error: Error?) -> StockProfileResult {
        guard let jsonData:Data = data
        else {
            return .failure(error!)
        }
        return StockAPI.searchStockProfile(fromJSON: jsonData)
    }
    
    

}

