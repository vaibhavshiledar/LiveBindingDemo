//
//  CustomTextField.swift
//  LiveBindingDemo
//
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    var textFieldCallBack: (String) -> () = { _ in
        
    }
    
    func bindData(callBack: @escaping (String) -> ()) {
        self.textFieldCallBack = callBack
        self.addTarget(self, action: #selector(didChangeText), for: .editingChanged)
    }
    
    @objc func didChangeText(textField: UITextField) {
        self.textFieldCallBack(textField.text!)
    }
}
