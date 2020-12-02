//
//  ViewController.swift
//  ListOfMovies
//
//  Created by Sanatzhan Aimukambetov on 02.12.2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView = TableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        setupConstraints()
        
        
        
    }
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

