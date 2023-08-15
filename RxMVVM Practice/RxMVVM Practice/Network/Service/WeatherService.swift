//
//  WeatherService.swift
//  RxMVVM Practice
//
//  Created by 이성민 on 2023/08/05.
//

import UIKit
import CoreLocation

final class WeatherService: BaseService {
    
    static let shared = WeatherService()
    
    private override init() {}
    
}

extension WeatherService {
    
    func getWeatherData(_ coordinate: CLLocationCoordinate2D, completion: @escaping ((WeatherResponse) -> Void)) {
        URLSession(configuration: .default)
            .dataTask(with: appendURLParams(coordinate)) { data, _, err in
                guard err == nil
                else {
                    print(err?.localizedDescription ?? "")
                    return
                }
                
                guard let data = data,
                      let decodedData = try? JSONDecoder().decode(WeatherResponse.self, from: data)
                else {
                    print("decoding error")
                    return
                }
                
                completion(decodedData)
            }
            .resume()
    }
    
    
    
}

extension WeatherService {
    
    private func appendURLParams(_ coordinate: CLLocationCoordinate2D) -> URL {
        guard var urlComponent = URLComponents(string: baseURLString)
        else { return URL(string: "")! }
        urlComponent.queryItems = [URLQueryItem(name: "lat", value: "\(coordinate.latitude)"),
                                   URLQueryItem(name: "lon", value: "\(coordinate.longitude)"),
                                   URLQueryItem(name: "appid", value: appid)]
        return urlComponent.url!
    }
    
}
