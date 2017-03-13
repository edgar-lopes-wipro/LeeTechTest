//
//  APIService.swift
//  BuildIt
//
//  Created by Lee Maguire on 07/03/2017.
//  Copyright © 2017 Lee Maguire. All rights reserved.
//

import UIKit

//http://api.openweathermap.org/data/2.5/forecast?q=London,UK&mode=json&appid=4e5a983b87ab7358ea008839fed32386

class APIService: NSObject {

    private let endpoint = "http://api.openweathermap.org/data/2.5/forecast?q="
    private let apiKey = "&mode=json&appid=4e5a983b87ab7358ea008839fed32386"
    
    private enum httpMethod: String {
        case get = "GET" //enums are lowercase since swift 3
    }
    
    enum unit: String {
        case metric = "metric"
        case imperial = "imperial"
    }
    
    func retrieveFiveDayForcast(_ cityName: String, _ countryCode: String, _ unit: unit, completion: @escaping ((_ response: WeatherResponse?, _ error: BTError?) -> ())) {
        let query = "\(cityName),\(countryCode)"
        let unit = "&units=\(unit.rawValue)"
        guard let url = URL.init(string: endpoint + query + unit + apiKey) else {
            //bad url
            completion(nil, BTError.init(.badRequest))
            return
        }
        
        
        performRequest(.get, url) { (data, error) in
            if let data = data {
                completion(WeatherResponse.init(data), nil)
            } else if let error = error {
                completion(nil, error)
            } else {
                completion(nil, BTError.init(.badRequest))
            }
        }
        
    }
    
    private func performRequest(_ httpMethod: httpMethod, _ url: URL, completion: @escaping ((_ response: [String: AnyHashable]?, _ error: BTError?) -> ())) {

        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                
                switch httpResponse.statusCode {
                    case _ where httpResponse.statusCode > 200:
                        completion(nil, BTError.init(.badRequest))
                    case _ where httpResponse.statusCode < 200:
                        completion(nil, BTError.init(.badRequest))
                    default: break
                }
            }
            
            guard let data = data, let _:URLResponse = response, error == nil else {
                completion(nil, BTError.init(.badRequest))
                return
            }
            
            //json parsing
            do {
                let parsedData = try JSONSerialization.jsonObject(with: data, options: []) as! [String : AnyHashable]
                print(parsedData)
                completion(parsedData, nil)
            } catch let error as NSError {
                completion(nil, BTError.init(.parsingError, error.description))
            }
        }
        
        task.resume()
    }
    
}
