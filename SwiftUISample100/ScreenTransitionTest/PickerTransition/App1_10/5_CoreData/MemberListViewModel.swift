//
//  MemberList.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/11.
//

import CoreData

// 会員のリストを管理するViewModelクラス
class MemberListViewModel: ObservableObject {
    @Published var members = [MemberList]()
    
    private var context: NSManagedObjectContext
    
    // コンストラクタ
    init(context: NSManagedObjectContext) {
        self.context = context
        // 初期化時に会員をフェッチする
        fetchMembers()
    }
    
    // 会員の情報をデータベースから取得する関数
    func fetchMembers() {
        let request: NSFetchRequest<MemberList> = MemberList.fetchRequest()
        
        do {
            self.members = try context.fetch(request)
        } catch {
            print("Fetching members failed: \(error.localizedDescription)")
        }
    }
    
    // 会員を追加する関数
    func addMember(id: UUID, name: String, address: String) {
        autoreleasepool {
            // 100000件のデータを一度に削除
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = MemberList.fetchRequest()
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try context.execute(batchDeleteRequest)
            } catch {
                print("Batch deletion failed: \(error.localizedDescription)")
            }

            // 100000件のデータを追加
            for _ in 1...1000000 {
                let newMember = MemberList(context: context)
                newMember.id = UUID()
                newMember.name = "Sample Name"
                newMember.address = "Sample Address"
            }

            do {
                try context.save()
            } catch {
                print("Saving members failed: \(error.localizedDescription)")
            }

            // メモリを効果的に解放
            context.reset()
            // メモリ開放、再読み込み
            context.refreshAllObjects()
        }
    }
}
