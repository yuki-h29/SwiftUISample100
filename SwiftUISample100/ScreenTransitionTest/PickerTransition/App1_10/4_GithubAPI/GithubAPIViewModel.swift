//
//  GithubAPIViewModel.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/30.
//

import Foundation
import Combine

// リポジトリの情報と状態を管理するViewModelです。
class GithubAPIViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    private var page = 1
    var isFetching = false
    private var subscriptions = Set<AnyCancellable>()
    @Published var showingAlert = false
    @Published var errorMessage = ""
    
    // Github APIからリポジトリ情報を非同期に取得します。
    func fetchRepositories() {
        guard !isFetching else { return }
        
        isFetching = true
        GithubAPI.searchRepos(page: self.page, perPage: 30)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isFetching = false
                    break
                case let .failure(error):
                    self.isFetching = false
                    self.showingAlert = true
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { repositories in
                self.repositories += repositories
                self.page += 1
            })
            .store(in: &self.subscriptions)
    }
}
