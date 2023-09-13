//
//  DiaryRepository.swift
//  Diary
//
//  Created by 김민성 on 2023/09/13.
//

import Foundation

protocol DiaryRepository {
    func fetch() -> Result<[Diary], Error>
    func create(_ diary: Diary)
    func update(_ id: UUID, diary: Diary)
    func delete(_ diary: Diary)
}
