//
//  ViewController.swift
//  Calculator
//
//  Created by Frederic Deschenes on 16-11-26.
//  Copyright © 2016 Frederic Deschenes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var previousResult : String = "0"
    var result : String = "0"

    var currentOperation : Operation = .none // This is obviously a bit of overkill, but I use it to practice enums in Swift

    var isShowingResult : Bool = false // Set this to true when showing the operation result, to know when to clear the screen

    override func viewDidLoad() {
        super.viewDidLoad()

        showValue()
    }

    // MARK: Numbers handling
    @IBAction func tapNumberButtons(_ sender: UIButton) {
        clearIfShowingResult()
        if result == "0" { // if the value is empty as of now, replace the 0
            result = sender.titleLabel!.text!
        } else if -999999999 ... 999999999 ~= Double(sender.titleLabel!.text!)!
                    || result.contains(".") {  // limit the amount of characters the person can use
            result += sender.titleLabel!.text!
        }
        showValue()
    }

    @IBAction func floatingPoint(_ sender: UIButton) {
        clearIfShowingResult()
        if !result.contains(".") {
            result += "."
        }
        showValue()
    }

    @IBAction func clear() {
        previousResult = "0"
        result = "0"
        isShowingResult = false

        showValue()
    }

    @IBAction func minus(_ sender: UIButton) {
        clearIfShowingResult()
        if !result.contains("-") { // if the result is not negative
            result = "-" + result
        } else { // if result is already negated
            result.remove(at: result.startIndex)
        }
        showValue()
    }

    @IBAction func deleteLastChar(_ sender: UIButton) {
        clearIfShowingResult()
        result = result.substring(to: result.index(before: result.endIndex))
        if result.isEmpty || result == "-" { // if the String is empty, or just has a - symbol
            result = "0" // we do not want an empty String, instead, set it to 0
        }
        showValue()
    }

    // MARK: Operations
    @IBAction func divide(_ sender: UIButton) {
        setOperation(operation: .division)
    }

    @IBAction func multiply(_ sender: UIButton) {
        setOperation(operation: .multiplication)
    }

    @IBAction func substract(_ sender: UIButton) {
        setOperation(operation: .substraction)
    }

    @IBAction func add(_ sender: UIButton) {
        setOperation(operation: .addition)
    }

    @IBAction func equals() {
        switch currentOperation {
        case .addition:
            result = String(Double(previousResult)!.adding(Double(result)!))
        case .substraction:
            result = String(Double(previousResult)!.subtracting(Double(result)!))
        case .multiplication:
            result = String(Double(previousResult)!.multiplied(by: Double(result)!))
        case .division:
            result = String(Double(previousResult)!.divided(by: Double(result)!))
        case .none: return
        }
        currentOperation = .none
        isShowingResult = true
        showValue()
    }

    @IBOutlet var lblNumber: UILabel!

    /// Sets the new operation as well as executing the pending operation
    private func setOperation(operation: Operation) {
        equals() // execute the pending operation
        previousResult = result
        currentOperation = operation
        result = "0"
    }

    /// Clears the label if the result was in 'show' mode
    private func clearIfShowingResult() {
        if isShowingResult { // if in result showing mode, exit mode
            result = "0"
            isShowingResult = false
            showValue()
        }
    }

    /// Shows the current value on the main label
    private func showValue() {
        lblNumber.text = result
    }
}

