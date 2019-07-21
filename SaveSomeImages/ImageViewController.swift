//
//  ImageViewController.swift
//  SaveSomeImages
//
//  Created by Xuezheng Wang on 7/21/19.
//  Copyright © 2019 Xuezheng Wang. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var theImage: UIImageView!
    @IBOutlet weak var theButton: UIButton!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    var pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theImage.tintColor = UIColor.gray
        theImage.addGestureRecognizer(tapRecognizer)
        theImage.isUserInteractionEnabled = true;
        tapRecognizer.isEnabled = true
        tapRecognizer.addTarget(self, action: #selector(handleTap(_:)))
        
        pickImage()
    }
    
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        print("Called!")
        if sender.state == .ended {
            pickImage()
        }
    }
    
    func pickImage(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            
            pickerController.delegate = self
            
            if UIImagePickerController.availableMediaTypes(for: .savedPhotosAlbum)!.contains("public.image") {
                pickerController.mediaTypes = ["public.image"]
                self.present(pickerController, animated: true, completion: {})
            }
        }

    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: {})
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        theImage.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage?
        picker.dismiss(animated: true, completion: {})
    }
}
