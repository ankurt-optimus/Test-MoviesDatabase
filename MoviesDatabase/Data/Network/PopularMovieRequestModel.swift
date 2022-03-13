//
//  MovieRequestModel.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import Foundation


class PopularMovieRequestModel : RequestModel {
    override var path: String {
        return "/movie/popular"
    }
}
