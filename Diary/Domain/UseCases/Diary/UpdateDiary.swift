//
//  UpdateDiary.swift
//  Diary
//
//  Created by 김민성 on 2023/09/13.
//

import Foundation

protocol UpdateDiary {
    func update(_ id: UUID, diary: Diary)
}

final class DefaultUpdateDiary: UpdateDiary {
    private let diaryRepository: DiaryRepository
    
    init(diaryRepository: DiaryRepository = DefaultDiaryRepository()) {
        self.diaryRepository = diaryRepository
    }
    
    func update(_ id: UUID, diary: Diary) {
        diaryRepository.update(id, diary: diary)
    }
}
