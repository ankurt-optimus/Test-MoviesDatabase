//
//  MoviesListViewModel.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import Foundation


class MoviesListViewModel {
    
    var movies : [MovieModel]?
    typealias MovieCompletion = (Result<GenericResponseModel, ErrorModel>) -> Void
    
    func fetchMoviesList(completion : @escaping MovieCompletion) {
        FetchMoviesService.fetchMovies { movieResult in
            DispatchQueue.main.async {
                switch movieResult {
                case .success(let response):
                    self.movies = response.results
                    completion(movieResult)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
