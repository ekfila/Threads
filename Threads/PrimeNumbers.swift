//
//  PrimeNumbers.swift
//  Threads
//
//  Created by Ekaterina Stepanova on 15.07.21.
//

import Foundation

class PrimeNumbers {
    
    var primeNumbers: [Int] = []
    var times: [Double] = []
    
    private func check(_ k: Int) -> Bool {
        var i = 0
        while i < primeNumbers.count && primeNumbers[i] * primeNumbers[i] <= k && k % primeNumbers[i] != 0 {
            i += 1
        }
        return (i == primeNumbers.count + 1 || primeNumbers[i] * primeNumbers[i] > k)
    }
    
    func evaluateNotGreaterThan(n: Int) {
        let startTime = NSDate()
        var endTime = NSDate()
        if n >= 2 {
            endTime = NSDate()
            primeNumbers.append(2)
            times.append(Double(endTime.timeIntervalSince(startTime as Date)))
            if n >= 3 {
                endTime = NSDate()
                primeNumbers.append(3)
                times.append(Double(endTime.timeIntervalSince(startTime as Date)))
            }
            var bound = primeNumbers.last! + 2
            while bound <= n {
                if check(bound) {
                    endTime = NSDate()
                    primeNumbers.append(bound)
                    times.append(Double(endTime.timeIntervalSince(startTime as Date)))
                }
                bound += 2
            }
        }
    }
    
}
