//
//  ViewController.swift
//  Clima
//
//  Created by Saeem on 09/02/2022.
//  Copyright © 2022 Saeem. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
// We have added UITextFieldDelegate in the above code to make the software keyboard behave the sameway when we click on the go button as the search button in the app.
// UITextFieldDelegate allow our class, our weatherViewController to manage the editing and validation of the text in a TextField.
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        // Here this line of code is saying that the textField should report back to our ViewController for example our Textfield will handle the task of our user entering text. When user Intereacts with our textfield.
        // So when user type something then textfield will notify the viewController on what's Happening
        // The idea is that the Textfield can communicate what's going on and the way we ensure that the view controllers notified by the text field is by setting the ViewController as Delegate
  
        // Self refers to the currentViewcontroller
        // By adding UITextFieldDelegate above and searchTextField.delegate = self , this is allowing us to do these two steps is we can now create a method called textfieldShouldReturn.....
    }
    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchTextField.text!)
        //searchTextField.text is a property which corresponds to the text displayed by the textfield.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        return true
        // We are returning true here because this function expects a boolean as an output so that our textfield will be allowed to actually return.
    }
    // The textFieldShouldReturn function will tell the viewcontroller that user has pressed the return/go key on the keyboard what should we do and this will happen at the exact time when return button gets pressed.
    // By adding UITextFieldDelegate above and searchTextField.delegate = self , this is allowing us to do these two steps is we can now create a method called textfieldShouldReturn.....
    
}

