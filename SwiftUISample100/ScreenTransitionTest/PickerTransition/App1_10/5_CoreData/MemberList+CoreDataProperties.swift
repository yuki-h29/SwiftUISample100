//
//  MemberList+CoreDataProperties.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/11.
//

import Foundation
import CoreData

// MemberListクラスの拡張部分
extension MemberList {
    // フェッチリクエストを取得する関数
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MemberList> {
        return NSFetchRequest<MemberList>(entityName: "MemberList")
    }

    // プロパティ
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var address: String?
}
