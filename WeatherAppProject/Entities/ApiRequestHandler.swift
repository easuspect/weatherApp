//
//  ApiRequestHandler.swift
//  WeatherAppProject
//
//  Created by NewMac on 5/3/22.
//

import Foundation

enum TolgaError: Error {
    case parsing
    case generalError
    case statusCode
    case response
}

class ApiRequestHandler {
    static func request(completion: @escaping (Result<WeatherForecastEntity,Error>) -> Void) {
        if let url = URL.init(string: "https://api.openweathermap.org/data/2.5/onecall?lat=30.4872&lon=-97.7233&exclude=minutely,current&appid=c26bb83656dc36a5f3916a31555d0ba7") {
            var urlRequest = URLRequest.init(url: url)
            
            urlRequest.httpMethod = "GET"
            
            let session = URLSession.init(configuration: URLSessionConfiguration.default)
            
            let _ = session.dataTask(with: urlRequest) { responseData, response, error in
                
                if error == nil && response != nil {
                    
                    if let res = response as? HTTPURLResponse {
                        
                        if res.statusCode == 200 {
                            
                            do {
                                let result = try JSONDecoder().decode(WeatherForecastEntity.self, from: responseData!)
                                completion(.success(result))
                            } catch let error {
                                print(error.localizedDescription)
                                completion(.failure(TolgaError.generalError))
                            }
                        } else {
                            completion(.failure(TolgaError.parsing))
                        }
                    } else {
                        completion(.failure(TolgaError.statusCode))
                    }
                } else {
                    completion(.failure(TolgaError.response))
                }
            }.resume()
        }
    }
}
