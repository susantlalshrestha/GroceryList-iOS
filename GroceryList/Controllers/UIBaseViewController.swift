//
//  UIBaseViewController.swift
//  GroceryList
//
//  Created by SusantShrestha on 1/26/24.
//

import UIKit

open class UIBaseViewController: UIViewController {

    func showError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
