//
//  DeleteDiary.swift
//  Diary
//
//  Created by 김민성 on 2023/09/13.
//

import Foundation

protocol DeleteDiary {
    func delete(_ diary: Diary)
}

final class DefaultDeleteDiary: DeleteDiary {
    private let diaryRepository: DiaryRepository
    
    init(diaryRepository: DiaryRepository = DefaultDiaryRepository()) {
        self.diaryRepository = diaryRepository
    }
    
    func delete(_ diary: Diary) {
        diaryRepository.delete(diary)
    }
}
