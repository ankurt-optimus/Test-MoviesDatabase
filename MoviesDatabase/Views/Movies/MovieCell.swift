//
//  MovieCell.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {

    static let reuseIdentifier = "MovieCell"
    
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.movieImageView.layer.masksToBounds = true
        self.movieImageView.layer.cornerRadius = 10.0
        // Initialization code
    }

    func configureCell(with movie : MovieModel) {
        
        self.movieDescriptionLabel.text = movie.overview
        self.movieTitleLabel.text = movie.title
        let movieImagePath = NetworkService.shared.basePathToImage + (movie.posterPath ?? "")
        self.movieImageView.sd_setImage(with: URL(string: movieImagePath), placeholderImage: UIImage())
        
        // write code to download and show images
//        self.movieImageView.image =
    }
}
