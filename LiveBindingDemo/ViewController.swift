//
//  ViewController.swift
//  LiveBindingDemo
//
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var userNameTxtField: CustomTextField! {
        didSet {
            userNameTxtField.bindData { (userName) in
                self.userVM.name = userName
            }
        }
    }
    
    @IBOutlet weak var passwordTxtField: CustomTextField! {
        didSet {
            passwordTxtField.bindData { (password) in
                self.userVM.password = password
            }
        }
    }
    
    //MARK:- Properties
    var userVM: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBarButton()
        self.userVM = UserViewModel()
    }
    
    private func setupNavigationBarButton() {
        let saveBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveUser))
            self.navigationItem.rightBarButtonItem  = saveBarButtonItem
    }
    
    @objc func saveUser(){
        print("Result: \nUserName = \(self.userVM.name ?? "")\nPassword = \(self.userVM.password ?? "")")
    }
}

