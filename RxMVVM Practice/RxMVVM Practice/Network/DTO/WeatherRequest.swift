//
//  WeatherRequest.swift
//  RxMVVM Practice
//
//  Created by 이성민 on 2023/08/05.
//

import Foundation

struct WeatherRequest {
    let lat: Double
    let lon: Double
    let exclude: [Exclude]?
}

enum Exclude: String {
    case current
    case minutely
    case hourly
    case daily
    case alerts
}

