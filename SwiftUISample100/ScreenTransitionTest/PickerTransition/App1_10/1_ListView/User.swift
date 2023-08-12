//
//  User.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/29.
//

import RealmSwift

// データベースオブジェクトを表すRealm 'User' クラス
class User: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
