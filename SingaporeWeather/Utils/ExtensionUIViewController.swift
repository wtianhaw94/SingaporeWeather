//
//  UIViewController.swift
//  SingaporeWeather
//
//  Created by Tian Haw on 3/28/18.
//  Copyright © 2018 tianhaw. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func progressBarDisplay(_ msg:String, _ indicator:Bool ) -> UIView {
        print(msg)
        var messageFrame = UIView()
        var activityIndicator = UIActivityIndicatorView()
        var strLabel = UILabel()
        var messageBG = UIView()
        
        
        strLabel = UILabel(frame: CGRect(x: 70, y: 0, width: 200, height: 50))
        strLabel.text = msg
        strLabel.textColor = UIColor.white
        messageFrame = UIView(frame: CGRect(x: view.frame.midX - 90, y: view.frame.midY - 25 , width: 200, height: 50))
        messageFrame.layer.cornerRadius = 15
        messageFrame.backgroundColor = UIColor(white: 0, alpha: 0.7)
        messageBG = UIView(frame: CGRect(x: 0, y: 0 , width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        messageBG.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        if indicator {
            activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.startAnimating()
            messageFrame.addSubview(activityIndicator)
        }
        messageFrame.addSubview(strLabel)
        messageBG.addSubview(messageFrame)
        
        return messageBG
    }
    
}
