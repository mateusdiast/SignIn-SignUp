//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var createAccountLabel: UILabel!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    
    let signInViewModel = SignInViewModel()
 

 
    override func viewDidLoad() {
        super.viewDidLoad()

        signInViewModel.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        emailField.layer.cornerRadius = 8
        passwordField.layer.cornerRadius = 8
        
        let gestureRecoveryPassword = UITapGestureRecognizer(target: self, action: #selector(passwordLabelTapped))
        forgetPasswordLabel.addGestureRecognizer(gestureRecoveryPassword)
        forgetPasswordLabel.isUserInteractionEnabled = true
    
        let gestureCreateANewAccount = UITapGestureRecognizer(target: self, action: #selector(createAccountLabelTapped))
        createAccountLabel.addGestureRecognizer(gestureCreateANewAccount)
        createAccountLabel.isUserInteractionEnabled = true
 
        
    }
    
    @objc func createAccountLabelTapped(gesture: UITapGestureRecognizer) {
        performSegue(withIdentifier: "goTosSignUpView", sender: nil)
    }
    
    @objc func passwordLabelTapped(gesture: UITapGestureRecognizer){
        signInViewModel.validadeEmail(email: emailField.text!)
    }

    @IBAction func signInBtnPressed(_ sender: UIButton) {
        signInViewModel.validateLogin(email: emailField.text!, password: passwordField.text!)
    }
}


extension SignInViewController: SignInDelegate {
    func navigationToRegisterView() {
        print("teste")
    }
    
    func recoveryPassword() {
        let alertRecoveryPassoword = UIAlertController(title: "Recuperação de senha!", message: "Enviamos um e-mail para recuperação de senha", preferredStyle: UIAlertController.Style.alert)
        alertRecoveryPassoword.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertRecoveryPassoword, animated: true, completion: nil)
        emailField.text = ""
    }
    
    func putValidateEmail() {
        let alertEmailInvalidate = UIAlertController(title: "Erro!", message: "Informe o e-mail para continuar", preferredStyle: UIAlertController.Style.alert)
        alertEmailInvalidate.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default){ action in
            self.emailField.becomeFirstResponder()
            self.emailField.text = ""
            self.passwordField.text = ""
        })
        self.present(alertEmailInvalidate, animated: true, completion: nil)
        
}
    
    func loginSuccess() {
        performSegue(withIdentifier: "goToHomeView", sender: nil)
    }
    
    func alertLoginInvalidate() {
        let alertLogin = UIAlertController(title: "Login Invalido!", message: "Senha ou email incorretos! Tente novamente", preferredStyle: UIAlertController.Style.alert)
        alertLogin.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertLogin, animated: true, completion: nil)
        emailField.text = ""
        passwordField.text = ""
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
        textField.layer.borderColor = DesignSystem.Colors.secondary.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != nil{
            textField.backgroundColor = DesignSystem.Colors.textFieldEndEditing
            textField.layer.borderColor = DesignSystem.Colors.textFieldBorderEndEditing.cgColor
            textField.layer.cornerRadius = 8
            textField.layer.borderWidth = 1
        }
    }
}

