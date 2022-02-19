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
    
    var weatherManager = WeatherManager()
    
    
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
        searchTextField.endEditing(true)
        // Here we are using the endediting so when we click on search button dismiss our current action or keyboard.
        print(searchTextField.text!)
        //searchTextField.text is a property which corresponds to the text displayed by the textfield.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchTextField.endEditing(true)
        // Here we are using the endediting above so when we click on search button dismiss our current action or keyboard.
        print(searchTextField.text!)
        return true
        // We are returning true here because this function expects a boolean as an output so that our textfield will be allowed to actually return.
    }
    // The textFieldShouldReturn function will tell the viewcontroller that user has pressed the return/go key on the keyboard what should we do and this will happen at the exact time when return button gets pressed.
    // By adding UITextFieldDelegate above and searchTextField.delegate = self , this is allowing us to do these two steps is we can now create a method called textfieldShouldReturn.....
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // IMPORTANT below I have actually just referred searchTextField as textField this is happening because we aren't the ones triggering or calling any of these functions nowhere in our code we specially wrote these textFieldShouldEndEditing function because they are triggered by textField and became available for us to use.
        // The UItextField class is actually the one that's responsible for calling these function/methods and when it calls textFieldShouldEndEditing basically when it detects user dismissing the keyboard, IN THAT MOMENT IT'S GONNA PASS A REFERENCE TO THE textField that triggered this method.
        
        // We could for example have a multiple textfield similat to how in our IBAciton we can get hold of the sender which was the UIButton that actually triggered this IBAction by detecting a touchevent.
        
        // We can have multiple textfield or triggering the same methods so if we had multiple buttons linked to the same IBAction then any of those buttons could be the sender it just depends on who detected the event.
        
        // IF WE HAVE MULTIPLE textFields ALL WITH THEIR DELEGATES SET AS THIS CURRENT CLASS ANY OF THOSE textFields COULD BE THE TRIGGER FOR THOSE DELEGATE METHODS BUT THEY WILL PASS THEIR IDENTITY IN THROUGH THIS TextField parameter so if we dont care about which textfield was triggered then we can simply use this parameter (_ textField: UITextField) and apply our validation to any textField in our currentViewController using this code
        
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    // In the above function we are checking if user hasn't typed anything we will display him a placeholder saying type something if the user has typed something then it will work normally keyboard will dissppear and we will get our desired result.
    // The above function gets to decide what to do when the user clicked on go or return without typing in the search field.
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Use searchTextField.text to get the weather for that city.
        
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
    } // As this is an optional string I am passing over to my WeatherManager a definite string instead of an optional string so I am using "if let" to optionally unwrap
    // The above function is used to stop editing and clear the search when we have finsished editing or entering a city name and when we hit search or go it's gonna clear the search label so that we can enter a new city name next time.
}

