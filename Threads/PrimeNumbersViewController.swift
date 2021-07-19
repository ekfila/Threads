//
//  PrimeNumbersViewController.swift
//  Threads
//
//  Created by Ekaterina Stepanova on 15.07.21.
//

import UIKit

class PrimeNumbersViewController: UIViewController {

    @IBOutlet var background: UIView!
    @IBOutlet weak var boundNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func evaluatePrimeNumbers(_ sender: Any) {
        let primeNumbers = PrimeNumbers()
        var bound = 1
        if let textBoundNumber = self.boundNumber.text {
            bound = Int(textBoundNumber) ?? 1
        }
        DispatchQueue.global(qos: .background).async {
            primeNumbers.evaluateNotGreaterThan(n: bound)
            DispatchQueue.global(qos: .utility).async {
                let numbers = primeNumbers.primeNumbers
                let times = primeNumbers.times
                for (i, number) in numbers.enumerated() {
                    print(number, times[i])
                }
            }
        }
    }
    
}
