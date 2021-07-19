//
//  LoadImageViewController.swift
//  Threads
//
//  Created by Ekaterina Stepanova on 13.07.21.
//

import UIKit

class LoadImageViewController: UIViewController {
    
    let urlString = "https://images.unsplash.com/photo-1590523814886-59e7082738e8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzd8fGRvd25sb2FkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"

    @IBOutlet var background: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = UIColor.white
    }
    
    @IBAction func load(_ sender: Any) {
        let url = URL(string: urlString)!
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data!)
            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = image
            }
        }
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0, delay: 0.2, animations:
            {self.imageView.backgroundColor = UIColor.lightGray}) {isCompleted in
                self.imageView.backgroundColor = UIColor.lightGray
            }
        }
    }
}
