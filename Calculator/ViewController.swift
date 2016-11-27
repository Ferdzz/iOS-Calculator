//
//  ViewController.swift
//  Calculator
//
//  Created by Frederic Deschenes on 16-11-26.
//  Copyright © 2016 Frederic Deschenes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblNumber: UILabel!


    var value : String = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func showValue() {
        lblNumber.text = value
    }
}

