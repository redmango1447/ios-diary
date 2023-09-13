//
//  DiaryEntity.swift
//  Diary
//
//  Created by 김민성 on 2023/09/13.
//

import Foundation

struct Diary: Equatable, Identifiable {
    let id: UUID
    var title: String
    var content: String
    var createdDate: Date
}
