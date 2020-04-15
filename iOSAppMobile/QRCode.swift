//
//  ViewController.swift
//  QRCodeGen
//
//  Created by mwnl on 2019/9/4.
//  Copyright © 2019年 mwnl. All rights reserved.
//

import UIKit

var qrcodeImage: CIImage!

class QRCode: UIViewController {
    
    @IBOutlet weak var imgQRCode: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("UIDevice.current.name = \(UIDevice.current.name)")
        phoneName = ",\(UIDevice.current.name)"
        tokenName = token! + phoneName
        print(tokenName as Any)

        let data = tokenName!.data(using: String.Encoding.utf8, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue("Q", forKey: "inputCorrectionLevel")
        
        qrcodeImage = filter!.outputImage
        
        displayQRCodeImage()
        
        NotificationCenter.default.addObserver(self, selector: #selector(isPresentEqImage(notification:)), name: NSNotification.Name("presentEqImage") , object: nil)
        
        
    }
    
    func displayQRCodeImage() {
        
        let scaleX = imgQRCode.frame.size.width / qrcodeImage.extent.width
        let scaleY = imgQRCode.frame.size.height / qrcodeImage.extent.height
        
        let transformedImage = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
        
        imgQRCode.image = UIImage(ciImage: transformedImage)
        
    }

    @objc func isPresentEqImage(notification: NSNotification) {
        let controller = UIAlertController(title: "Scan finished", message: "Complete connection", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
}

