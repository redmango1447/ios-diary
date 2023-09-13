//
//  DataManager.swift
//  Diary
//
//  Created by Minsup, RedMango on 2023/09/04.
//

import CoreData

final class DiaryCoreDataSourceImpl: DiaryDataSource {
    
    let container: NSPersistentContainer
    
    init() {
        self.container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores(completionHandler: { ( _, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }

    func getAll() throws -> [Diary] {
        let request = DiaryCoreDataEntity.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(
                keyPath: \DiaryCoreDataEntity.createdDate,
                ascending: false
            )
        ]
        
        return try container.viewContext.fetch(request).map({ diaryCoreDataEntity in
            return Diary(
                id: diaryCoreDataEntity.id ?? UUID(),
                title: diaryCoreDataEntity.title ?? "",
                content: diaryCoreDataEntity.content ?? "",
                createdDate: diaryCoreDataEntity.createdDate ?? Date()
            )
        })
    }
    
    func create(_ diary: Diary) throws {
        let diaryCoreDataEntity = DiaryCoreDataEntity(context: container.viewContext)
        diaryCoreDataEntity.id = diary.id
        diaryCoreDataEntity.title = diary.title
        diaryCoreDataEntity.content = diary.content
        diaryCoreDataEntity.createdDate = diary.createdDate
        
        try saveContext()
    }
    
    func update(_ id: UUID, diary: Diary) throws {
        guard let entity = try getById(id: diary.id) else {
            return
        }
        
        entity.title = diary.title
        entity.content = diary.content
        
        try saveContext()
    }
    
    func delete(_ diary: Diary) throws {
        guard let entity = try getById(id: diary.id) else {
            return
        }
        
        container.viewContext.delete(entity)
        
        try saveContext()
    }
    
    private func getById(id: UUID) throws -> DiaryCoreDataEntity? {
        let request = NSFetchRequest<DiaryCoreDataEntity>(entityName: "DiaryCoreDataEntity")
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
        
        let entity = try container.viewContext.fetch(request).first
        return entity
        
    }
    
    private func saveContext() throws {
        let context = container.viewContext
        if context.hasChanges {
            try context.save()
        }
    }
}
