//
//  UIViewControllerExtension.swift
//  A2BCore
//
//  Created by Marcelo Bogdanovicz on 28/02/2021.
//

import UIKit

extension UIViewController {
    
    public func present(error: LBError?) {
        
        let alert = UIAlertController(title: error?.statusCode?.value(), message: error?.message, preferredStyle: .alert)
        let button = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
}
