//
//  DefaultDiariesRepository.swift
//  Diary
//
//  Created by 김민성 on 2023/09/13.
//

import Foundation

final class DefaultDiaryRepository: DiaryRepository {
    
    private let dataSource: DiaryDataSource
    
    init(dataSource: DiaryDataSource = DiaryCoreDataSourceImpl()) {
        self.dataSource = dataSource
    }
    
    func fetch() -> Result<[Diary], Error> {
        do {
            let diaries = try dataSource.getAll()
            return .success(diaries)
        } catch {
            print("[DefaultDiaryRepository]: fetch Error!!")
            return .failure(error)
        }
    }
    
    func create(_ diary: Diary) {
        do {
            try dataSource.create(diary)
        } catch {
            print("[DefaultDiaryRepository]: create Error!!")
        }
    }
    
    func update(_ id: UUID, diary: Diary) {
        do {
            try dataSource.update(id, diary: diary)
        } catch {
            print("[DefaultDiaryRepository]: update Error!!")
        }
    }
    
    func delete(_ diary: Diary) {
        do {
            try dataSource.delete(diary)
        } catch {
            print("[DefaultDiaryRepository]: delete Error!!")
        }
    }
}
