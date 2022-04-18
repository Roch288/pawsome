//
//  LoginViewController.swift
//  Pawsome
//
//  Created by Roch on 3/23/22.
//

import UIKit
import SwiftSpinner
import FirebaseAuth


class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordStackView: UIStackView!
    
    var loginService = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    private func setupViews() {
        emailTextField.setUnderLine()
        passwordStackView.setUnderLine()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hideUnhideTapped(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        self.alert(message: "Sorry, current this func is not available", title: "Alert", okAction: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        self.view.endEditing(true)
        guard let email = emailTextField.text, !email.isEmpty else { self.alert(message: "Email is empty", title: nil, okAction: nil);
            return }
        guard email.isValidEmail() else { self.alert(message: "Email is invalid", title: nil, okAction: nil);
            return }
        guard let password = passwordTextField.text, !password.isEmpty else { self.alert(message: "Password is empty", title: nil, okAction: nil);
            return }
        
        SwiftSpinner.show("Logging In...")
       
        
        //Firebase login
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {authResult, error in
            guard let result = authResult, error == nil else{
                print("Failed to login with \(email)")
                return
            }
            
            let user = result.user
            print("Sucessfully logged in with \(user)")
            
        })
        
        loginService.login(email: email, password: password) { success, message, profile in
            SwiftSpinner.hide()
            if success {
                guard let profile = profile else {
                    return
                }
                switch profile.getUserType() {
                case .owner:
                    appDelegate.goToOwnerDashboardPage()
                case .walker:
                    appDelegate.goToWalkerDashboardPage()
                }
            } else {
                self.alert(message: message, title: "Alert", okAction: nil)
            }
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
