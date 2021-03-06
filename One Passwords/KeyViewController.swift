//
//  KeyViewController.swift
//  One Passwords
//
//  Created by Ghost on 3/9/16.
//  Copyright © 2016 Panos Sakkos. All rights reserved.
//

import Foundation
import UIKit

class KeyViewController : UIViewController
{
    var persistableKey = PersistableKey()
    
    @IBOutlet weak var keyTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.keyTextField.text = self.persistableKey.getKey()
        self.keyTextField.becomeFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        super.touchesBegan(touches, withEvent: event)

        self.view.endEditing(true)
    }
    
    @IBAction func SaveKey(sender: AnyObject)
    {
        let key = self.keyTextField.text!
        
        if (key.characters.count < OnePasswords.MIN_KEY_LENGTH)
        {
            showError("Your Key has to be longer than 16 characters")

            self.keyTextField.text = self.persistableKey.getKey()
            
            return
        }
        
        self.persistableKey.setkey(key)
    }
    
    private func showError(message: String)
    {
        self.view.dodo.topLayoutGuide = self.topLayoutGuide
        self.view.dodo.style.label.color = UIColor.whiteColor()
        self.view.dodo.style.bar.backgroundColor = DodoColor.fromHexString("#f44336")
        self.view.dodo.style.bar.hideAfterDelaySeconds = 5
        self.view.dodo.style.bar.hideOnTap = true
        
        self.view.dodo.show(message);
    }
}
