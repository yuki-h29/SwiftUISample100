//
//  CoreDataStack.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/12.
//

import Foundation
import CoreData

// CoreDataのスタックを管理するクラス
class CoreDataStack {
    static let shared = CoreDataStack()

    // 永続的なデータストレージのコンテナ
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // メインスレッド用のコンテキストを返すプロパティ
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
