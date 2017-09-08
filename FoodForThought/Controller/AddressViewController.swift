//
//  AddressViewController.swift
//  Big Bowl
//
//  Created by Ryan Morrison on 08/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddressViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet weak var getLocationStyle: UIButton!
    
    lazy var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        streetTextField.delegate = self
        stateTextField.delegate = self
        countryTextField.delegate = self
        
        
    }
    
    // Text Fields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }

    // Location Services
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) -> Void in
            
            if (error != nil) {
                print("Reverse geocoder failed. Reason: " + error!.localizedDescription)
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationInMap(placemark: pm)
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error updating location. Reason: " + error.localizedDescription)
    }
    
    func displayLocationInMap(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            locationManager.stopUpdatingLocation()
            let annotation = MKPlacemark(placemark: containsPlacemark)
            mapView.addAnnotation(annotation)
            mapView.showAnnotations([annotation], animated: true)
            
            let street = (containsPlacemark.thoroughfare != nil) ? containsPlacemark.thoroughfare : ""
            let number = (containsPlacemark.subThoroughfare != nil) ? containsPlacemark.subThoroughfare : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea :""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            streetTextField.text = street! + " " + number!
            stateTextField.text = administrativeArea!
            countryTextField.text = country!
        }
    }
    
    //MARK: - Action Buttons
    
    @IBAction func getLocationButtonHandler(sender: UIButton) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
        @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
            self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
