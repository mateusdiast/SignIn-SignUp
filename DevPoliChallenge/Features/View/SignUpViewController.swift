//
//  SignUpViewController.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 22/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var surnameLabel: UITextField!
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var confirmPassowordLabel: UITextField!
    @IBOutlet weak var createdBtnLabel: UIButton!
    @IBOutlet weak var termsBtnLabel: UILabel!
    
    let signInViewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInViewModel.delegate = self
        createdBtnLabel.isEnabled = false

        firstNameLabel.delegate = self
        surnameLabel.delegate = self
        emailLabel.delegate = self
        passwordLabel.delegate = self
        confirmPassowordLabel.delegate = self
        
        let gestureTerms = UITapGestureRecognizer(target: self, action: #selector(navigationTermViews))
        termsBtnLabel.addGestureRecognizer(gestureTerms)
        termsBtnLabel.isUserInteractionEnabled = true
        
        title = "Criar conta"
    }
    

    @IBAction func createAccountBtn(_ sender: UIButton) {
        signInViewModel.toCreateAnAccount()
    }
    
    @objc func navigationTermViews(){
        performSegue(withIdentifier: "goToWebView", sender: nil)
    }
    
}

extension SignUpViewController: SignUpDelegate {
    
    func createdAccount() {
        let createdAccount = UIAlertController(title: "Parabéns!", message: "o cadastro foi realizado com sucesso", preferredStyle: UIAlertController.Style.alert)
        createdAccount.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default){ (action) in
            self.navigationController?.popViewController(animated: true)
        })
        self.present(createdAccount, animated: true, completion: nil)
        
    }
}
    

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
        textField.layer.borderColor = DesignSystem.Colors.secondary.cgColor
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  signInViewModel.validateDatas(firstName: firstNameLabel.text!,
                                          surname: surnameLabel.text!,
                                          email: emailLabel.text!,
                                          password: passwordLabel.text!,
                                          confirmedPassword: confirmPassowordLabel.text!){
            textField.endEditing(true)
            createdBtnLabel.isEnabled = true
            textField.backgroundColor = DesignSystem.Colors.textFieldEndEditing
            textField.layer.borderColor = DesignSystem.Colors.textFieldBorderEndEditing.cgColor
            textField.layer.cornerRadius = 8
            textField.layer.borderWidth = 1
        }else{
            createdBtnLabel.isEnabled = false
            textField.backgroundColor = DesignSystem.Colors.textFieldEndEditing
            textField.layer.borderColor = DesignSystem.Colors.textFieldBorderEndEditing.cgColor
            textField.layer.cornerRadius = 8
            textField.layer.borderWidth = 1
        }
    }
}
