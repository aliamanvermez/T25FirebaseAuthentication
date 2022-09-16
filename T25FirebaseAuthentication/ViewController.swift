//
//  ViewController.swift
//  T25FirebaseAuthentication
//
//  Created by NeonApps on 16.09.2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let logInButton = UIButton()
    let signUpButton = UIButton()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
        
            
        
    }
    
    func createUI(){
        setDefaultSize(view: view)
        
        emailTextField.placeholder = " email"
        passwordTextField.placeholder = " password"
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .systemGray4
        passwordTextField.backgroundColor = .systemGray4
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true

        
        emailTextField.frame = CGRect(x: 0.2 * screenWidth, y: 0.2 * screenHeight, width: 0.6 * screenWidth, height: 40)
        passwordTextField.frame = CGRect(x: 0.2 * screenWidth, y: 0.3 * screenHeight, width: 0.6 * screenWidth, height: 40)
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.backgroundColor = .systemPink
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .systemPink
        
        logInButton.frame = CGRect(x: 0.6 * screenWidth, y: 0.4 * screenHeight, width: 0.2 * screenWidth, height: 40)
        signUpButton.frame = CGRect(x: 0.2 * screenWidth, y: 0.4 * screenHeight, width: 0.2 * screenWidth, height: 40)
        
        signUpButton.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(logInClicked), for: .touchUpInside)

        
        
        
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        view.addSubview(signUpButton)

    }
    
    @objc func signUpClicked() {
        let destinationVC = SignUpViewController()
        present(destinationVC, animated: true)
    }
    
    @objc func logInClicked() {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Alert", messageInput: error?.localizedDescription ?? "Error" )
                }else{
                    let destinationVC = LogInVC()
                    self.present(destinationVC, animated: true)
                }
                
            }
        }else{
            makeAlert(titleInput: "Error", messageInput: "Username/Password")
        }
    }
    
    func makeAlert (titleInput : String, messageInput : String) {
        let alert = UIAlertController (title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }


}

