//
//  ViewController.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var moviesListTableView: UITableView!
    var movieViewModel = MoviesListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        movieViewModel.fetchMoviesList { (movies) in
            self.moviesListTableView.reloadData()
        }
        self.moviesListTableView.delegate = self
        self.moviesListTableView.dataSource = self
        self.moviesListTableView.rowHeight = UITableView.automaticDimension

        self.moviesListTableView.register(UINib(nibName: MovieCell.reuseIdentifier, bundle: .main), forCellReuseIdentifier: MovieCell.reuseIdentifier)
    }
}


extension MoviesListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieViewModel.movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        if let movie = movieViewModel.movies?[indexPath.row] {
            movieCell.configureCell(with: movie)
        }
        return movieCell
    }
    
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        if let movie = movieViewModel.movies?[indexPath.row] {
            let detailController = MovieDetailViewController.controller(movie: movie)
            self.present(detailController, animated: true, completion: nil)
        }
    }
}
