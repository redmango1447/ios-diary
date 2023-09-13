//
//  ReadDiary.swift
//  Diary
//
//  Created by 김민성 on 2023/09/13.
//

import Foundation

protocol FetchDiaries {
    func fetch() -> Result<[Diary], Error>
}

final class DefaultFetchDiaries: FetchDiaries {
    private let diaryRepository: DiaryRepository
    
    init(diaryRepository: DiaryRepository = DefaultDiaryRepository()) {
        self.diaryRepository = diaryRepository
    }
    
    func fetch() -> Result<[Diary], Error> {        
        return diaryRepository.fetch()
    }
}
