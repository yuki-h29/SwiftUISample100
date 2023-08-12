//
//  UserViewModel.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/29.
//

import Combine
import RealmSwift

// データベースからのデータを管理し、ビューに対してデータを公開する 'UserViewModel' クラス
class UserViewModel: ObservableObject {
    private var userResults: Results<User>  // Realmデータベースから取得した結果を格納する
    @Published var users: [User] = []  // ビューが使用するデータを公開する

    init() {
        let realm = try! Realm()  // Realmデータベースのインスタンスを取得する
        userResults = realm.objects(User.self)  // データベースからすべての 'User' オブジェクトを取得する
        self.users = Array(userResults)  // 'userResults' を配列に変換して 'users' に格納する
        observeRealmChanges()  // Realmデータベースの変更を監視する
    }

    func delete(_ user: User) {
        do {
            let realm = try Realm()  // Realmデータベースのインスタンスを取得する
            if let userToDelete = realm.object(ofType: User.self, forPrimaryKey: user.id) {
                // userToDeleteは同じスレッド上のオブジェクトです
                if let index = self.users.firstIndex(where: { $0.id == userToDelete.id }) {
                    self.users.remove(at: index)
                }
                try realm.write {  // Realmデータベースの変更を行う
                    realm.delete(userToDelete)  // 指定された 'User' オブジェクトを削除する
                }
            }
        } catch let error {
            // エラーをハンドルする
            print(error.localizedDescription)
        }
    }


    func add(user name: String) {
        do {
            let realm = try Realm()  // Realmデータベースのインスタンスを取得する
            try realm.write {  // Realmデータベースの変更を行う
                let user = User()  // 新しいUserオブジェクトを作成する
                user.name = name  // ユーザー名を設定する
                realm.add(user)  // 新しいUserオブジェクトをデータベースに追加する
            }
            self.users = Array(realm.objects(User.self))  // データベースからすべての 'User' オブジェクトを取得して 'users' に格納する
        } catch let error {
            // エラーをハンドルする
            print(error.localizedDescription)
        }
    }

    
    private func observeRealmChanges() {
        // 'userResults' に対する変更を監視し、その変更を 'users' に反映させる
        userResults.observe { [weak self] changes in
            switch changes {
            case .initial:
                print("Initial population of data is done.")
            case .update(_, let deletions, let insertions, let modifications):
                print("Database was updated. Deletions: \(deletions), Insertions: \(insertions), Modifications: \(modifications)")
            case .error(let error):
                print("Error: \(error)")
            }
            self?.users = Array(self!.userResults)
        }
    }

}
