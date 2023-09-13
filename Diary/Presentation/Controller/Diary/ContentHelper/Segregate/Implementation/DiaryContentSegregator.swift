//
//  DiaryContentSegregator.swift
//  Diary
//
//  Created by Minsup, RedMango on 2023/09/07.
//

struct DiaryContentSegregator: DiaryContentSegregatable {
    func segregate(text: String?) -> (title: String, content: String) {
        let paragraphs = text?.split(separator: "\n", maxSplits: 1) ?? []
        
        if let title = paragraphs.first {
            let content = paragraphs
                             .dropFirst()
                             .joined()
                             .trimmingCharacters(in: .whitespacesAndNewlines)
            return (title: String(title), content: String(content))
        } else {
            return (title: "", content: "")
        }
    }
}
