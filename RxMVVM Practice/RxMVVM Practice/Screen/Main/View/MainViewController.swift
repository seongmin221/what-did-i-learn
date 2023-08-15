//
//  MainViewController.swift
//  RxMVVM Practice
//
//  Created by 이성민 on 2023/08/04.
//

import CoreLocation
import UIKit

import RxCocoa
import RxSwift
import SnapKit

class MainViewController: UIViewController {
    
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    
    let regionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemCyan
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemCyan
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.weatherObservable
            .map { $0.region }
            .bind(to: regionLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.weatherObservable
            .map { self.convertToCelsius($0.temperature) }
            .bind(to: tempLabel.rx.text)
            .disposed(by: disposeBag)
        
        view.addSubview(regionLabel)
        regionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        view.addSubview(tempLabel)
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(regionLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
    }
    
}

extension MainViewController {
    
    func convertToCelsius(_ temperature: Double) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        
        let temp = Measurement(value: temperature, unit: UnitTemperature.kelvin)
        return formatter.string(from: temp.converted(to: .celsius))
    }
    
}
