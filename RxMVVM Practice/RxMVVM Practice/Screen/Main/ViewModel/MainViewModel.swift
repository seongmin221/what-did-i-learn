//
//  LocationViewModel.swift
//  RxMVVM Practice
//
//  Created by 이성민 on 2023/08/06.
//

import CoreLocation
import Foundation

import RxCocoa
import RxSwift

final class MainViewModel {
    
    let disposeBag = DisposeBag()
    
    let locationManager = CLLocationManager()
    
    init() {
        bindWeatherObservable()
        locateCurrentCoordinates()
    }
    
    // MARK: - input
    
    let locationObservable = PublishSubject<CLLocation>()
    let weatherObservable = PublishSubject<WeatherModel>()
    
    // MARK: - Custom Functions
    
    func locateCurrentCoordinates() {
        locationManager.requestWhenInUseAuthorization()
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            guard let coordinate = locationManager.location
            else { return }
            locationObservable.onNext(coordinate)
            locationObservable.onCompleted()
        default:
            print("not allowed")
        }
    }
    
    func bindWeatherObservable() {
        locationObservable
            .map { $0.coordinate }
            .subscribe(onNext: { [weak self] coordinate in
                WeatherService.shared.getWeatherData(coordinate) { response in
                    guard let data = self?.convertResponseToData(response)
                    else { return }
                    self?.weatherObservable.onNext(data)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func convertResponseToData(_ response: WeatherResponse) -> WeatherModel {
        return WeatherModel(region: response.city.name,
                            temperature: response.list[0].main.temp,
                            status: response.list[0].weather[0].description)
    }
    
}
