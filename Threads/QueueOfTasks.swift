//
//  QueueOfTasks.swift
//  Threads
//
//  Created by Ekaterina Stepanova on 15.07.21.
//

import Foundation

class QueueOfTasks {
    
    typealias Task = ()->Void
    
    var queue = DispatchQueue(label: "queue", qos: .background, attributes: .concurrent)
        
    func add(task: @escaping Task) {
        queue.async(flags: .barrier, execute: task)
        //queue.async(execute: task)
    }
}
