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
        
        let stockStore = StockStore()
//        stockStore.fetchStockResults(query: "bank", exchange: "NASDAQ", completion: { stockSearchResults in
//            switch stockSearchResults {
//            case let .success(stockSearchResults):
//                print("Successfully found \(stockSearchResults.count) Stocks.")
//
//            case let .failure(error):
//                print ("Error fetching recent Stocks: \(error)")
//            }
//
//        })
        
        let ticker = "AAPL";
        
        stockStore.fetchStockProfile(ticker: ticker , completion: {
            stockProfileResult in
            switch stockProfileResult {
            case let .success(stockProfileResult):
                print("Successfully found \(stockProfileResult) Stocks.")

            case let .failure(error):
                print ("Error fetching recent Stocks: \(error)")
            }
            
        })
    
    
//        stockStore.fetchMostActiveStocks{
//            (activeStockResult) -> Void in
//            switch activeStockResult {
//            case let .success(activeStocks):
//                print("Successfully found \(activeStocks.count) Stocks.")
//
//            case let .failure(error):
//                print ("Error fetching recent Stocks: \(error)")
//            }
//        }
        
        
    }


}
