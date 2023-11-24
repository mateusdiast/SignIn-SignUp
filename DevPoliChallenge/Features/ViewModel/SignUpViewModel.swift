//
//  SignUpViewModel.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 22/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol SignUpDelegate: AnyObject {
    func createdAccount()
}

class SignUpViewModel{
    
    weak var delegate: SignUpDelegate?
    
    func validateDatas(firstName: String, surname: String, email: String, password: String, confirmedPassword: String) -> Bool{
        
        let emailUserRegex = EmailUserRegex()
        let emailValidate = email.range(of: emailUserRegex.email, options: .regularExpression)
        
        if (firstName.count >= 3 && surname.count >= 3 ) && (emailValidate != nil) && (password.count >=  5) && (confirmedPassword == password)  {
            return true
        }
        return false
    }
    
    func toCreateAnAccount() {
        delegate?.createdAccount()
    }
}
