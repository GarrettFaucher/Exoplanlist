//
//  DetailViewController.swift
//  Exoplanlist
//
//  Created by Garrett on 11/14/20.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var discoveryMethodField: UITextField!
    @IBOutlet var distanceField: UITextField!
    @IBOutlet var dateDiscovered: UILabel!
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        discoveryMethodField.text = item.discoveryMethod
        distanceField.text =
            numberFormatter.string(from: NSNumber(value: item.distance!))
        dateDiscovered.text = "\(item.dateDiscovered!)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.discoveryMethod = discoveryMethodField.text ?? ""
        
        if let distanceText = distanceField.text,
            let value = numberFormatter.number(from: distanceText) {
            item.distance = value.floatValue
        } else {
            item.distance = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
