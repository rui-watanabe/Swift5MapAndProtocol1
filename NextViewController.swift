//
//  NextViewController.swift
//  Swift5MapAndProtocol1
//
//  Created by watar on 2020/07/05.
//  Copyright © 2020 rui watanabe. All rights reserved.
//

import UIKit

protocol searchLocationDelegate {
    func searchLocation(latValue: String, longValue: String)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var latTextField: UITextField!
    
    @IBOutlet weak var longTextField: UITextField!
    
    var delegate:searchLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func okAction(_ sender: Any) {
        let latValue = latTextField.text!
        let longValue = longTextField.text!
                
        if latTextField.text != nil && longTextField.text != nil
        {
            delegate?.searchLocation(latValue: latValue, longValue: longValue)

            dismiss(animated: true, completion: nil)
        }
    }

}
