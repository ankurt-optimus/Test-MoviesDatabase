//
//  MovieDetailViewController.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import UIKit
import SDWebImage
class MovieDetailViewController: UIViewController {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var popularityLabel: UILabel!
    var movie : MovieModel?
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var overViewLabel: UILabel!
    public static func controller(movie: MovieModel?) -> MovieDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        controller.movie = movie
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.ratingLabel.text = String(self.movie?.voteAverage ?? 0)
        self.popularityLabel.text = String(self.movie?.popularity ?? 0)
        self.releaseDateLabel.text = self.movie?.releaseDate
        
        let movieImagePath = NetworkService.shared.basePathToImage + (self.movie?.posterPath ?? "")
        self.movieImageView.sd_setImage(with: URL(string: movieImagePath), placeholderImage: UIImage())
   
        self.overViewLabel.text = movie?.overview
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
