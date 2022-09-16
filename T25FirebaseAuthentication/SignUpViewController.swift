//
//  SignUpViewController.swift
//  T25FirebaseAuthentication
//
//  Created by NeonApps on 16.09.2022.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    let userEmail = UITextField()
    let userPassword = UITextField()
    let userPasswordAgain = UITextField()
    let signUpButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
    }
    
    func createUI() {
        setDefaultSize(view: view)
        
        userEmail.placeholder = " email"
        userPassword.placeholder = " password"
        userPasswordAgain.placeholder = " confirm password"

        userEmail.keyboardType = .emailAddress
        userEmail.backgroundColor = .systemGray4
        userPassword.backgroundColor = .systemGray4
        userPassword.isSecureTextEntry = true
        userPasswordAgain.backgroundColor = .systemGray4
        userPasswordAgain.isSecureTextEntry = true

        userEmail.frame = CGRect(x: 0.2 * screenWidth, y: 0.2 * screenHeight, width: 0.6 * screenWidth, height: 40)
        userPassword.frame = CGRect(x: 0.2 * screenWidth, y: 0.3 * screenHeight, width: 0.6 * screenWidth, height: 40)
        userPasswordAgain.frame = CGRect(x: 0.2 * screenWidth, y: 0.4 * screenHeight, width: 0.6 * screenWidth, height: 40)
        signUpButton.frame = CGRect(x: 0.2 * screenWidth, y: 0.6 * screenHeight, width: 0.6 * screenWidth, height: 60)
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .systemPink
        signUpButton.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
        
        view.addSubview(userEmail)
        view.addSubview(userPassword)
        view.addSubview(userPasswordAgain)
        view.addSubview(signUpButton)



    }
    
    @objc func signUpClicked() {
        if userEmail.text != "" && userPassword.text != "" && userPasswordAgain.text != "" && userPassword.text == userPasswordAgain.text {
            Auth.auth().createUser(withEmail: userEmail.text!, password: userPassword.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")

                }else{
                    let destinationVC = ViewController()
                    destinationVC.modalPresentationStyle = .fullScreen
                    self.present(destinationVC, animated: true)
                    
                }
            }
        }else {
            
           makeAlert(titleInput: "Error", messageInput: "Usarname/Password")
        }
        
    }
    func makeAlert (titleInput : String, messageInput : String) {
        let alert = UIAlertController (title: titleInput, message: messageInput, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    

 

}
