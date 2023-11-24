//
//  TermsViewModel.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 23/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol TermsDelegate: AnyObject{
    func openTerms(url: URL)
}

class TermsViewModel {

    
    weak var delegate: TermsDelegate?
    
    func onLoad(){
        
        let termsModel = TermsModel()
        
        if let url = URL(string: termsModel.url){
            delegate?.openTerms(url: url)
        }
        
    }
}


