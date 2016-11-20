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
    @IBOutlet var hideUserInputButton: UIBarButtonItem!
    @IBOutlet weak var exchangeLab: UILabel!
    
    var result:(buy:Float, sell:Float) = (0.0,0.0)
    
    var kantor = Kantor()
   
    // MARK: ViewControler -
    override func viewDidLoad() {
        super.viewDidLoad()
        userAmountTextField.text="100"
        actionUserAmountChanged(userAmountTextField)
        
        //let tapGest=UITapGestureRecognizer(target: self, action: Selector(("actionHideUserInputs")))
        //self.view.addGestureRecognizer(tapGest)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: Moje metody -
    @IBAction func actionHideUserInputs(_ sender: AnyObject) {
        userAmountTextField.resignFirstResponder()
        navigationItem.rightBarButtonItems=nil
    }
    
    @IBAction func actionUserAmountChanged(_ sender: AnyObject) {
        //result.buy=Float(userAmountTextField.text!)!*3
        //result.sell=Float(userAmountTextField.text!)!*4
        
        let amount=Float(userAmountTextField.text!)
        result=kantor.exchange(amount: amount!, currencyCode: "USD")
        actionUpdateInterface()
    }
    
    @IBAction func actionUpdateInterface() {
        var displayResult:Float=0.0
        if(segmentedControl.selectedSegmentIndex==0)
        {
            displayResult=result.sell
        }
        else
        {
            displayResult=result.buy
        }
        exchangeLab.text="\(displayResult)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        navigationItem.rightBarButtonItem=hideUserInputButton
        
    }

}

