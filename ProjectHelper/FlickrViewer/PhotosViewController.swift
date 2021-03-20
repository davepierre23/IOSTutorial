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
        print("running Fickr Viewer")
        //let url = FlickrAPI.recentPhotosURL()
        print("request url:")
       // print(url)
//        let store = PhotoStore()
//        store.fetchRecentPhotos()
        let url2 = StockAPI.stockAPI()
        print("request url2:")
        print(url2)
        let store2 = StockStore()
        store2.fetchRecentPhotos()
        
    }
}
