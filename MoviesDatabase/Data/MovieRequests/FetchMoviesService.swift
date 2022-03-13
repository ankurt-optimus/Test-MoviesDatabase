//
//  FetchMoviesService.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import Foundation

class FetchMoviesService {

    class func fetchMovies(completionBlock : @escaping  (Result<GenericResponseModel, ErrorModel>) -> Void ) {
        
        NetworkService.shared.sendRequest(request: PopularMovieRequestModel()) { (result) in
            completionBlock(result)
        }
        
    }
}
