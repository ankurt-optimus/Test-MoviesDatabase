//
//  GenericResponseModel.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import Foundation


struct GenericResponseModel : Codable {
    var page : Int?
    var results : [MovieModel]?
}
