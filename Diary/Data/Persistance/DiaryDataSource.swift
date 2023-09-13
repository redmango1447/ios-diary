//
//  DiaryDataSource.swift
//  Diary
//
//  Created by 김민성 on 2023/09/13.
//

import Foundation

protocol DiaryDataSource {
    func getAll() throws -> [Diary]
    func create(_ diary: Diary) throws
    func update(_ id: UUID, diary: Diary) throws
    func delete(_ diary: Diary) throws
}
