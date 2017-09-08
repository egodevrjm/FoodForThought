//
//  AddViewController.swift
//  FoodForThought
//
//  Created by Ryan Morrison on 07/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ratingPicker: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var restaurantTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    lazy var imagePicker = UIImagePickerController()
    lazy var imagePickerCamera = UIImagePickerController()
    
    let categories = ["Pizza", "Asian", "Mexican", "Fish and Chips", "French", "Fast Food"]
    let ratings = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //style
        addButton.layer.cornerRadius = 5.0
        addParallaxToView(vw: imageView, amount: 10)
        
        //pickers
        ratingPicker.delegate = self
        ratingPicker.dataSource = self
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        
        //textfields
        restaurantTextField.delegate = self
        noteTextField.delegate = self
        priceTextField.delegate = self
    }
    
    @IBAction func selectPhotoButtonHandler(sender: AnyObject?) {
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takePhotoButtonHandler(sender: AnyObject?) {
        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
            imagePickerCamera.delegate = self
            imagePickerCamera.allowsEditing = false
            imagePickerCamera.sourceType = .camera
            imagePickerCamera.cameraCaptureMode = .photo
            present(imagePickerCamera, animated: true, completion: nil)
        } else {
            noCamera()
        }
    }
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
//        picker.dismiss(animated: true, completion: nil)
//        imageView.image = image
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //info[UIImagePickerControllerEditedImage] as? UIImage
        imageView.image = image
    }
    
    
    func noCamera() {
       let alertController = UIAlertController(title: "No Camera", message: "This device has no camera!", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text ?? "Default text")
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == ratingPicker {
            return ratings.count
        } else {
            return categories.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == ratingPicker {
            return "\(ratings[row])"
        } else {
            return "\(categories[row])"
        }
         
    }
}
