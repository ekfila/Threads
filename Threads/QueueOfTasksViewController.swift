//
//  QueueOfTasksViewController.swift
//  Threads
//
//  Created by Ekaterina Stepanova on 19.07.21.
//

import UIKit

class QueueOfTasksViewController: UIViewController {
    
    let queueOfTasks = QueueOfTasks()
    var num = 50

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTask(_ sender: Any) {
        for i in 1...10 {
            queueOfTasks.add {
                sleep(1)
                DispatchQueue.main.async {
                    self.label.text = "Task \(i) finished"
                }
            }
            //print("Task \(i) added")
        }
    }

}
