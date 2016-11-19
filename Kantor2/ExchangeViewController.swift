//
//  FirstViewController.swift
//  Kantor2
//
//  Created by Slawek Kurczewski on 19.11.2016.
//  Copyright © 2016 Slawomir Kurczewski. All rights reserved.
//

import UIKit

class ExchangeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var userAmountTextField: UITextField!
    @IBOutlet weak var currencyButton: UIButton!
    @IBOutlet weak var hideUserInputButton: UIBarButtonItem!
    @IBOutlet weak var exchangeLab: UILabel!
    
    
    @IBAction func actionHideUserInputs(_ sender: AnyObject) {
        userAmountTextField.resignFirstResponder()
        navigationItem.rightBarButtonItems=nil
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAmountTextField.text="100"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        navigationItem.rightBarButtonItem=hideUserInputButton
    }

}

