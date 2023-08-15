//
//  MVCViewController.swift
//  SocialLoginPractice
//
//  Created by 이성민 on 2023/08/14.
//

import UIKit

import SnapKit

final class MVCViewController: UIViewController {
    
    // MARK: - Property
    
    
    
    // MARK: - UI Property
    
    private let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "kakao_login_medium_narrow"), for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setLoginButtonAction()
    }
    
    // MARK: - Setting
    
    private func setLayout() {
        view.addSubview(kakaoLoginButton)
        kakaoLoginButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(100)
        }
    }
    
    private func setLoginButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.kakaoLoginButtonTapped()
        }
        kakaoLoginButton.addAction(action, for: .touchUpInside)
    }
    
    // MARK: - Action Helper
    
    private func kakaoLoginButtonTapped() {
        
    }
    
    // MARK: - Custom Method
    
    
    
}
