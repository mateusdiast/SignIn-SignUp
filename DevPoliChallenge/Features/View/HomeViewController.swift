//
//  HomeViewController.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 20/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var data: [String]?
    let homeViewModel = HomeViewModel()
    
    @IBOutlet weak var tableViewContent: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate = self
        tableViewContent.dataSource = self
        tableViewContent.delegate = self
        homeViewModel.onLoad()
        title = "Minha Conta"
    }
    

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data![indexPath.row]
        return cell
    }
    
    
}

extension HomeViewController: HomeDelegate{
    
    func sendDataFromModel(data: [String]) {
        self.data = data
    }
}
