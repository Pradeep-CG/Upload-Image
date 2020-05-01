//
//  ViewController.swift
//  UploadImage
//
//  Created by Pradeep on 01/05/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//
//             Post an image to the server
//
//
//Multiple way of doing this
//
//1. The Base64 way.
//
//2. The Byte array way.
//
//3. Multipart/form-data way.
//
//Multipart/form-data is a content-type similar to application/json
//The post body contains multiple parts and each part is divided by a boundary
//
//
//Main boundary
//
//Content-Boundary
//
//Content Disposition: form-data;
//name = "attachment"
//
//Attachment value
//
//Content-Boundary
//
//Content Disposition: form-data;
//name = "fileName"
//
//fileName value
//
//End of main boundary--

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imgView: UIImageView!
    private var manager : ImageManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        manager = ImageManager()
    }


    @IBAction func uploadImage(_ sender: Any) {
        
        if(self.imgView.image != nil)
        {
            
            manager?.uploadImage(data: (self.imgView.image?.pngData())!, completionHandler: { (response) in

                if(response.path.isEmpty == false)
                {
                    
                    DispatchQueue.main.async {
                        
                        let alert = UIAlertController(title: "Image", message: "Image uploaded successfully", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(okAction)
                        self.present(alert, animated: true)
                    }
                }
            })
        }
    }
    @IBAction func selectImage(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    // MARK: Image picker delegate method

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imgView.image = image
        }else{
            debugPrint("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

