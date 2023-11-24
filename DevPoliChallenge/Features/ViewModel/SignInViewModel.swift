//
//  SignInViewModel.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 20/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol SignInDelegate: AnyObject {
    func alertLoginInvalidate()
    func loginSuccess()
    func recoveryPassword()
    func putValidateEmail()
    func navigationToRegisterView()
}

class SignInViewModel{
    
    weak var delegate: SignInDelegate?
    
    let signInModel = SignInModel()
    
    func validateLogin(email: String, password: String){
        if email == signInModel.emailCorrectly && password == signInModel.passawordCorrectly {
            delegate?.loginSuccess()
        } else {
            delegate?.alertLoginInvalidate()
        }
    }
    
    func validadeEmail(email: String){
        let emailUserRegex = EmailUserRegex()
        let result = email.range(of: emailUserRegex.email, options: .regularExpression)
        if result != nil {
            delegate?.recoveryPassword()
        }else{
            delegate?.putValidateEmail()
        }
    }
    
}
