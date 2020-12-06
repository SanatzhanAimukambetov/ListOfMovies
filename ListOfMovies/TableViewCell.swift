//
//  TableViewCell.swift
//  ListOfMovies
//
//  Created by Sanatzhan Aimukambetov on 02.12.2020.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    let view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(red: 64/255, green: 148/255, blue: 76/255, alpha: 1)
        view.layer.shadowRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
    
    let titleOfMovieLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    let overviewOfMovieLabel: UITextView = {
       let text = UITextView()
        text.textColor = .white
        text.backgroundColor = UIColor(red: 64/255, green: 148/255, blue: 76/255, alpha: 1)
        text.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        return text
    }()
    
    let moviePoster: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    static let reuseID = "TableViewCell"
    private var urlString: String = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TableViewCell")
        
        setupViews()
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
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
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
        
        view.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(5)
        }
        
        titleOfMovieLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(moviePoster.snp.trailing).offset(15)
            make.top.equalToSuperview().inset(10)
        }
        
        overviewOfMovieLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(moviePoster.snp.trailing).offset(10)
            make.top.equalTo(titleOfMovieLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        moviePoster.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(120)
        }
    }
    
    private func setupViews() {
        addSubview(view)
        view.addSubview(titleOfMovieLabel)
        view.addSubview(overviewOfMovieLabel)
        view.addSubview(moviePoster)
        
        self.backgroundColor = UIColor(red: 245/255, green: 202/255, blue: 60/255, alpha: 1)
    }

}
