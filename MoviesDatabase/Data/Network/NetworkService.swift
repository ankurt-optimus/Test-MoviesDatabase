//
//  NetworkService.swift
//  MovieDataBase
//
//  Created by Ankur on 13/03/22.
//

import Foundation



import Foundation

class NetworkService {
    // MARK: - Properties
    static let shared: NetworkService = NetworkService()
    var baseURL = "https://api.themoviedb.org/3"
    var basePathToImage = "https://image.tmdb.org/t/p/w500"
}

// MARK: - Public Functions
extension NetworkService {
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Result<T, ErrorModel>) -> Void) {
        
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            print("data is \(data?.count)")
            let decoder = JSONDecoder.init()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-d hh:mm a"
            
            let iso8601Full: DateFormatter = {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                formatter.calendar = Calendar(identifier: .iso8601)
                formatter.timeZone = TimeZone(secondsFromGMT: 0)
                formatter.locale = Locale(identifier: "en_US_POSIX")
                return formatter
            }()
            
            decoder.dateDecodingStrategy =  .formatted(iso8601Full)
            
            guard let data = data else {
                let error: ErrorModel = ErrorModel("parsing error")
                return completion(Result.failure(error))
            }
            
            
//            do {
//                let response = try JSONDecoder().decode(T.self, from: data)
//                print(response)
//            } catch {
//                print(error) //here.....
//            }
            
            do {
                guard let parsedResponse = try? decoder.decode(T.self, from: data) else {
                    let error: ErrorModel = ErrorModel("parsing error")
                    completion(Result.failure(error))
                    return
                }
                
                var responseModel: ResponseModel<T> = .init()
                responseModel.isSuccess = true
                responseModel.data = parsedResponse

                responseModel.rawData = data
                responseModel.request = request

                if responseModel.isSuccess, let data = responseModel.data {
                    completion(Result.success(data))
                } else {
                    completion(Result.failure(ErrorModel(responseModel.json ?? "unknown api error")))
                }
                
            } catch let error {
                let error: ErrorModel = ErrorModel("parsing error")
                completion(Result.failure(error))
                print(error)
            }
            
            
            
        }.resume()
    }
}
