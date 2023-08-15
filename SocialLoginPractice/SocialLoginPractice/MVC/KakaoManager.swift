//
//  KakaoLoginManager.swift
//  SocialLoginPractice
//
//  Created by 이성민 on 2023/08/15.
//

import Foundation

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

final class KakaoManager {
    
    static let shared = KakaoManager()
    
    private init() {}
    
}

extension KakaoManager {
    
    func login() {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
}
