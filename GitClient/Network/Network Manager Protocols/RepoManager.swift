//
//  RepoManager.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
import Combine
protocol RepoManager {
    func getRepos() -> AnyPublisher<RepoResponse,Error>
    func getRepoDetail(param : Repo) -> AnyPublisher<RepoDetailResponse,Error>
}