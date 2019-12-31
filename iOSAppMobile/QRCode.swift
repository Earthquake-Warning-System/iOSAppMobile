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
        let data = token!.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue("Q", forKey: "inputCorrectionLevel")
        
        qrcodeImage = filter!.outputImage
        
        displayQRCodeImage()
    }
    
    func displayQRCodeImage() {
        let scaleX = imgQRCode.frame.size.width / qrcodeImage.extent.width
        let scaleY = imgQRCode.frame.size.height / qrcodeImage.extent.height
        
        let transformedImage = qrcodeImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
        
        imgQRCode.image = UIImage(ciImage: transformedImage)
        
    }

}

