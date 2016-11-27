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

    var result : String = "0"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tapNumberButtons(_ sender: UIButton) {

    }

    @IBAction func floatingPoint(_ sender: UIButton) {

    }

    @IBAction func clear(_ sender: UIButton) {
        result = "0"
    }

    @IBAction func minus(_ sender: UIButton) {

    }

    @IBAction func deleteLastChar(_ sender: UIButton) {

    }

    @IBAction func divide(_ sender: UIButton) {

    }

    @IBAction func multiply(_ sender: UIButton) {

    }

    @IBAction func substract(_ sender: UIButton) {

    }

    @IBAction func add(_ sender: UIButton) {

    }

    @IBAction func equals(_ sender: UIButton) {

    }

    private func appendValue(char: Character) {

    }

    private func showValue() {
        lblNumber.text = result
    }
}

