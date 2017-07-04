//
//  ViewController.swift
//  DownloadImage
//
//  Created by Tran Van Tin on 7/4/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var urlTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func downloadButtonClick(_ sender: Any) {
        if (urlTextField.text == "") {
            let alert = UIAlertController(title: "Error", message: "You must input url", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let url = urlTextField.text
            fetchImg(url!)
        }
    }
    
    func fetchImg(_ url: String) {
        let imgUrl = URL(string: url)
        (URLSession(configuration: .default)).dataTask(with: imgUrl!, completionHandler: {(dataImage, response, error) in
            if let data = dataImage {
                DispatchQueue.main.async() { () -> Void in
                    self.myImageView.image = UIImage(data: data)
                }

            }
        }).resume()
    }
}

