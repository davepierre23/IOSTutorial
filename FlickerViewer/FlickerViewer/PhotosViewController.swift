//
//  PhotosViewController.swift
//  FlickerViewer
//
//  Created by Dave Pierre on 2021-03-28.
//
import UIKit
import Foundation

class PhotosViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("running Fickr Viewer")
//        let url = FlickrAPI.recentPhotosURL()
//        print("request url:")
//        print(url)
//        let store = PhotoStore()
//        let ticker  = "CU.TO"
//        loadStockProfile(ticker: ticker)
//        loadMostActiveStocks()
//        searchStock(query: "bank", exchange: "NASDAQ")
        
//
//            let stockStore = StockStore()
//            stockStore.fetchStockProfile(ticker: ticker , completion: {
//                stockProfileResult in
//                switch stockProfileResult {
//                case let .success(stockProfileResult):
//                    print("Successfully found \(String(describing: stockProfileResult)) Stocks.")
//                    if let firstPhoto = stockProfileResult.first {
//                        stockStore.fetchImage(for: firstPhoto) {
//                        (imageResult) -> Void in
//                            switch imageResult {
//                            case let .success(image): //self.imageView.image = image
//                                OperationQueue.main.addOperation {
//                                    self.imageView.image = image
//                                }
//                            case let .failure(error): print("ERROR downloading actual image: \(error)")
//                            }
//                        }
//                    }
//                case let .failure(error):
//                    print ("Error fetching recent Stocks: \(error)")
//                }
//
//            })
//        store.fetchRecentPhotos {
//            (photosResult) -> Void in
//            switch photosResult {
//            case let .success(photos):
//                print("Successfully found \(photos.count) photos.")
//                if let firstPhoto = photos.first {
//                    store.fetchImage(for: firstPhoto) {
//                    (imageResult) -> Void in
//                        switch imageResult {
//                        case let .success(image): //self.imageView.image = image
//                            OperationQueue.main.addOperation {
//                                self.imageView.image = image
//                            }
//                        case let .failure(error): print("ERROR downloading actual image: \(error)")
//                        }
//                    }
//                }
//
//            case let .failure(error):
//                print ("Error fetching recent photos: \(error)")
//            }
//        }
        
//
//                print("running Fickr Viewer")
//                let url = FlickrAPI.recentPhotosURL()
//                print("request url:")
//                print(url)
//                let store = PhotoStore()
//                store.fetchRecentPhotos {
//                    (photosResult) -> Void in
//                    switch photosResult {
//                    case let .success(photos):
//                        print("Successfully found \(photos.count) photos.")
//                        if let firstPhoto = photos.first {
//                            store.fetchImage(for: firstPhoto) {
//                            (imageResult) -> Void in
//                                switch imageResult {
//                                case let .success(image): //self.imageView.image = image
//                                    OperationQueue.main.addOperation {
//                                        self.imageView.image = image
//                                    }
//                                case let .failure(error): print("ERROR downloading actual image: \(error)")
//                                }
//                            }
//                        }
//
//                    case let .failure(error):
//                        print ("Error fetching recent photos: \(error)")
//                    }
//                }
        
        
        loadPicture()
        
        
      
    

        
    }
    func searchStock(query:String, exchange: String){
        let stockStore = StockStore()
        stockStore.fetchStockResults(query: query, exchange: exchange, completion: { stockSearchResults in
            switch stockSearchResults {
            case let .success(stockSearchResults):
                print("Successfully found \(stockSearchResults.count) Stocks.")

            case let .failure(error):
                print ("Error fetching recent Stocks: \(error)")
            }

        })
        
        
    }
    func loadStockProfile(ticker:String) {
        let stockStore = StockStore()
        stockStore.fetchStockProfile(ticker: ticker , completion: {
            stockProfileResult in
            switch stockProfileResult {
            case let .success(stockProfileResult):
                print("Successfully found \(String(describing: stockProfileResult)) Stocks.")
            case let .failure(error):
                print ("Error fetching recent Stocks: \(error)")
            }
            
        })
    
        
    }
    
    func loadPicture(){
        
                print("running Fickr Viewer")
                let stockStore = StockStore()
                stockStore.fetchStockProfile(ticker: "CU.to" , completion: {
                    stockProfileResult in
                    switch stockProfileResult {
                    case let .success(stockProfileResult):
                        print("Successfully found \(String(describing: stockProfileResult)) Stocks.")
                        if let firstPhoto = stockProfileResult.first {
                            print(firstPhoto)
                            stockStore.fetchImage(for: firstPhoto) {
                            (imageResult) -> Void in
                                switch imageResult {
                                case let .success(image): //self.imageView.image = image
                                    OperationQueue.main.addOperation {
                                        self.imageView.image = image
                                    }
                                case let .failure(error): print("ERROR downloading actual image: \(error)")
                                }
                            }
                        }

                    case let .failure(error):
                        print ("Error fetching recent Stocks: \(error)")
                    }
                    
                })

             
        
    }
    func loadMostActiveStocks(){
        let stockStore = StockStore()
        stockStore.fetchMostActiveStocks{
            (activeStockResult) -> Void in
            switch activeStockResult {
            case let .success(activeStocks):
                print("Successfully found \(activeStocks.count) Stocks.")

            case let .failure(error):
                print ("Error fetching recent Stocks: \(error)")
            }
        }
        
    }


}
