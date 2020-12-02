//
//  TableView.swift
//  ListOfMovies
//
//  Created by Sanatzhan Aimukambetov on 02.12.2020.
//

import UIKit

class TableView: UITableView {
    
    private var viewModel = MovieViewModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        viewModel.fetchPopularMoviesData { [weak self] in
            self?.delegate = self
            self?.dataSource = self
            self?.reloadData()
        }
        
        
        self.separatorStyle = .none
        self.backgroundColor = UIColor(red: 245/255, green: 202/255, blue: 60/255, alpha: 1)

        
        register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseID, for: indexPath) as! TableViewCell
        
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
