//
//  MainViewModel.swift
//  RxMVVM Practice
//
//  Created by 이성민 on 2023/08/04.
//

import Foundation

import RxSwift

final class WeatherViewModel {
    
    // 1. ViewModel 에서 사용할 Observable 데이터 생성
    var weatherObservable = PublishSubject<WeatherResponse>()
    var weatherData: WeatherResponse!
    
    func fetchWeatherData(with params: WeatherRequest) {
//        WeatherService.shared.getWeatherData(params) { data in
//            self.weatherData = data
//        }
    }
    
    func registerRegion() {
        
    }
    
}
