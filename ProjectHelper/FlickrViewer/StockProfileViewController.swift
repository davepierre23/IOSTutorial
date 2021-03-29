//
//  PhotosViewController.swift
//  FlickrViewer
//
//  Created by Louis Nel on 2018-03-04.
//  Copyright © 2018 COMP2601. All rights reserved.
//

import UIKit
class StockViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       print("Running Stock Profile Viewer")
       let url = FlickrAPI.recentPhotosURL()
       print("request url:")
       print(url)
       let store = PhotoStore()
       store.fetchRecentPhotos() {
           // create a annoysmous function
            (photoResult) -> Void in
            switch photoResult {
            case let .Success(photos):
                print("Successfully found \(photos) recent photos")
                
                if let firstPhoto = photos.first {
                    store.fetchImageForPhoto(firstPhoto) {
                        (imageResult) -> Void in
                        switch imageResult  {
                        case let .success(image): 
                            OperationQueue.main.addOperation {
                                self.imageView.image = image
                            }
                        case let .failure(error): 
                            print("ERROR downloading actual image: \(error)")
                        }
                    }
                }
            case let .failure(error):
                print("Error fetching recent stock: \(error)")
            }
        }
        
    }
}
