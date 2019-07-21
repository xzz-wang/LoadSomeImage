//
//  ImageViewController.swift
//  SaveSomeImages
//
//  Created by Xuezheng Wang on 7/21/19.
//  Copyright © 2019 Xuezheng Wang. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var theButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            print(UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum))
        }
    }
}
