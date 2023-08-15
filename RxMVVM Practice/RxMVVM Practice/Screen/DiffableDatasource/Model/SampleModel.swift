//
//  SampleModel.swift
//  RxMVVM Practice
//
//  Created by 이성민 on 2023/08/12.
//

import Foundation

struct SampleModel: Identifiable, Hashable {
    let id: Int
    var title: String
    var content: String
}

extension SampleModel {
    static func dummy() -> [SampleModel] {
        return [
            SampleModel(id: 1, title: "first", content: "first content"),
            SampleModel(id: 2, title: "second", content: "second content"),
            SampleModel(id: 3, title: "thirt", content: "third content")
        ]
    }
}
