//
//  DiaryContentCompositor.swift
//  Diary
//
//  Created by Minsup, RedMango on 2023/09/07.
//

struct DiaryContentCompositor: DiaryContentComposable {
    func composite(title: String, content: String) -> String {
        if title.isEmpty {
           return ""
        } else {
            return title + "\n\n" + content
        }        
    }
}
