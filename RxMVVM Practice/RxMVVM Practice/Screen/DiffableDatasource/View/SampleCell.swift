//
//  SampleCell.swift
//  RxMVVM Practice
//
//  Created by 이성민 on 2023/08/12.
//

import UIKit

import SnapKit

final class SampleCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "SampleCell"
    
    // MARK: - UI Property
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemCyan
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        configureLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    func configureCell(_ title: String, _ subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
    func configureLayout() {
        self.backgroundColor = .systemGray
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
    
}
