//
//  PhotosViewController.swift
//  FlickrViewer
//
//  Created by Louis Nel on 2018-03-04.
//  Copyright © 2018 COMP2601. All rights reserved.
//

import UIKit
class PhotosViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       super.viewDidLoad()
        
       print("running Fickr Viewer")
        
       let url = FlickrAPI.recentPhotosURL()
       print("request url:")
       print(url)
       
       let store = PhotoStore()
        
       store.fetchRecentPhotos() {
            (photoResult) -> Void in
            switch photoResult {
            case let .Success(photos):
                print("Successfully found \(photos.count) recent photos")
                
                if let firstPhoto = photos.first {
                    store.fetchImageForPhoto(firstPhoto) {
                        (imageResult) -> Void in
                        switch imageResult  {
                        case let .Success(image): 
                            self.imageView.image = image;
                        case let .Failure(error): 
                            print("ERROR downloading actual image: \(error)")
                        }
                    }
                }
            case let .Failure(error):
                print("Error fetching recent photos: \(error)")
            }
        }
        
    }
}
