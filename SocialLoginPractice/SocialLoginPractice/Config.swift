//
//  Config.swift
//  SocialLoginPractice
//
//  Created by 이성민 on 2023/08/15.
//

import Foundation

enum Config {
    
    static let kakaoNativeAppKey = Bundle.main.object(forInfoDictionaryKey: "KakaoNativeAppKey") as? String ?? ""
    
}
