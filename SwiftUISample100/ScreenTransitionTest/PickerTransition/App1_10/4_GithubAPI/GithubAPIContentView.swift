//
//  GithubAPIContentView.swift
//  SwiftUISample100
//
//  Created by 平野裕貴 on 2023/07/30.
//

import SwiftUI

//SwiftUI用の活動指示器（spinner）のViewです。
//UIViewRepresentableを利用してUIKitのUIActivityIndicatorViewを使用しています。
struct Spinner: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

// リポジトリの情報を表示するViewです。
struct GithubAPIContentView: View {
    @ObservedObject private var viewModel = GithubAPIViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.repositories) { repository in
                VStack(alignment: .leading) {
                    Text(repository.name)
                        .font(Font.system(size: 24).bold())
                    Text(repository.description ?? "")
                    Text("Star: \(repository.stargazersCount)")
                }
                .onAppear {
                    if self.viewModel.repositories.last == repository {
                        self.viewModel.fetchRepositories()
                    }
                }
            }
            
            if self.viewModel.isFetching {
                Spinner()
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
        .onAppear {
            self.viewModel.fetchRepositories()
        }
        .alert(isPresented: self.$viewModel.showingAlert) {
            Alert(
                title: Text("Error"),
                message: Text(self.viewModel.errorMessage),
                dismissButton: .default(Text("Close")))
        }
    }
}

// プレビュープロバイダーは開発者がXcodeのキャンバスでViewのプレビューを作成するのを支援します。
struct GithubAPIContentView_Previews: PreviewProvider {
    static var previews: some View {
        GithubAPIContentView()
    }
}
