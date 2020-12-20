//
//  ViewController.swift
//  ListOfMovies
//
//  Created by Sanatzhan Aimukambetov on 02.12.2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let topView = UIView()
    let tableView = TableView()
    let apiService = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        apiService.fetchFilms()
        
    }
    
    private func setupViews() {
        
        view.addSubview(topView)
        view.addSubview(tableView)
        
        view.backgroundColor = Constants.yellowColor
        topView.backgroundColor = Constants.greenColor
    
    }
    
    private func setupConstraints() {
        
        topView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(topView.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

