//
//  GithubAPIModel.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/30.
//

import Combine
import Foundation

// Github APIを操作するための機能をまとめたenumです。
enum GithubAPI {
    static func searchRepos(page: Int, perPage: Int) -> AnyPublisher<[Repository], Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(GithubSearchResult.self, from: $0.data).items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

// Githubの検索結果をデコードするための構造体です。
struct GithubSearchResult: Codable {
    let items: [Repository]
}

// リポジトリ情報を表現する構造体です。Codableを採用しているためJSONからデコードできます。
struct Repository: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case stargazersCount = "stargazers_count"
    }
}
