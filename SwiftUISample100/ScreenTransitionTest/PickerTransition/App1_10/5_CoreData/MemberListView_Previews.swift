//
//  MemberListView_Previews.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/08/11.
//

import SwiftUI
import CoreData

// プレビュー用のProviderクラス
struct MemberListView_Previews: PreviewProvider {
    class MockViewModel: MemberListViewModel {
        override init(context: NSManagedObjectContext) {
            super.init(context: context)
            
            let testMember1 = MemberList(context: context)
            testMember1.name = "Test Name 1"
            testMember1.address = "Test Address 1"
            
            let testMember2 = MemberList(context: context)
            testMember2.name = "Test Name 2"
            testMember2.address = "Test Address 2"
            
            self.members = [testMember1, testMember2]
        }
    }

    static var previews: some View {
        let mockContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        return MemberListView(viewModel: MockViewModel(context: mockContext))
    }
}
