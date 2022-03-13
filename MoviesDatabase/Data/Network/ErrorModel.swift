//
//  ErrorModel.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import Foundation

class ErrorModel: Error {
    
    // MARK: - Properties
    var message: String

    
    init(_ message: String) {
        self.message = message
    }
}

enum ErrorMessage : String {
    case generalError = "General error"
    case parsingError = "Parsing Error"
}
