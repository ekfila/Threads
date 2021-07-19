//
//  BlurImageViewController.swift
//  Threads
//
//  Created by Ekaterina Stepanova on 13.07.21.
//

import UIKit
import CoreImage

class BlurImageViewController: UIViewController {
    
    let urlString = "https://images.unsplash.com/photo-1590523814886-59e7082738e8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzd8fGRvd25sb2FkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60" //"https://images.unsplash.com/photo-1552645265-3c26f196b870?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODd8fGRvd25sb2FkfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.backgroundColor = UIColor.white
    }
    
    @IBAction func loadAndBlur(_ sender: Any) {
        let url = URL(string: urlString)!
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            
            let data = try? Data(contentsOf: url)
            let image = CIImage(data: data!)
            //print(UIImage(ciImage: image!).size)
            
            let blur = CIFilter(name: "CIGaussianBlur")
            blur?.setValue(image, forKey: kCIInputImageKey)
            blur?.setValue(15.0, forKey: kCIInputRadiusKey)

            
            let resultImage = blur?.value(forKey: kCIOutputImageKey) as! CIImage
            //print(UIImage(ciImage: resultImage).size)

            let context = CIContext()
            let outputImage = context.createCGImage(resultImage, from: image!.extent)

            DispatchQueue.main.async { [weak self] in
                self?.imageView.image = UIImage(cgImage: outputImage!)
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
