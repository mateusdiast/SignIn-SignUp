//
//  HomeViewModel.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 20/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol HomeDelegate: AnyObject{
    func sendDataFromModel(data: [String])
}

class HomeViewModel{
    
    weak var delegate: HomeDelegate?
    
    func onLoad() {
        let homeModel = HomeModel()
        delegate?.sendDataFromModel(data: homeModel.data)
        
    }
    
}
