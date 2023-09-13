//
//  CreateDiary.swift
//  Diary
//
//  Created by 김민성 on 2023/09/13.
//

import Foundation

protocol CreateDiary {
    func create(_ diary: Diary)
}

final class DefaultCreateDiary: CreateDiary {
    private let diaryRepository: DiaryRepository
    
    init(diaryRepository: DiaryRepository = DefaultDiaryRepository()) {
        self.diaryRepository = diaryRepository
    }
    
    func create(_ diary: Diary) {
        diaryRepository.create(diary)
    }
}
