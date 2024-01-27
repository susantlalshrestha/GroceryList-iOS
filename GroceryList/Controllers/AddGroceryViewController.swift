//
//  AddGroceryViewController.swift
//  GroceryList
//
//  Created by SusantShrestha on 1/26/24.
//

import UIKit
import Firebase

class AddGroceryViewController: UIBaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ivGroceryImage: UIImageView!
    @IBOutlet weak var tfGroceryName: UITextField!
    
    var imagePicker = UIImagePickerController()

    //reference to the image stored on Firebase
    var imgRef : StorageRE {
        return Storage.storage().reference().child("Images")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            ivGroceryImage.image = pickedImage //set that image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageDidPress(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addGroceryDidPress(_ sender: Any) {
        guard let groceryImage = ivGroceryImage.image?.jpegData(compressionQuality: 1)
        else {
            showError(title: "Empty Field", message: "Please select an image")
            return
        }
        
        guard let groceryName = tfGroceryName.text,
              !groceryName.isEmpty
        else {
            showError(title: "Empty Field", message: "Please enter the grocery name")
            return
        }
        
        let uploadRef = imgRef.child(filename)

    }
}
