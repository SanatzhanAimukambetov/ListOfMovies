//
//  TableViewCell.swift
//  ListOfMovies
//
//  Created by Sanatzhan Aimukambetov on 02.12.2020.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    let moviePoster: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let titleOfMovieLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let overviewOfMovieLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    static let reuseID = "TableViewCell"
    private var urlString: String = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TableViewCell")
        
        self.backgroundColor = .black
        
        addSubview(titleOfMovieLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellWithValuesOf(_ movie: Movie) {
        updateUI(title: movie.title, overview: movie.overview, poster: movie.posterImage)
    }
    
    private func updateUI(title: String?, overview: String?, poster: String?) {
        self.titleOfMovieLabel.text = title
        self.overviewOfMovieLabel.text = overview
        
        guard let posterString = poster else { return }
        urlString = "https://image.tmdp.org/t/p/w300" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.moviePoster.image = UIImage(named: "noImage")
            return
        }
        
        self.moviePoster.image = nil
        
        getImageDataFrom(url: posterImageURL)
    }
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.moviePoster.image = image
                }
            }
        }.resume()
    }
    
    private func setupConstraints() {
        
        titleOfMovieLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
        }
    }

}
