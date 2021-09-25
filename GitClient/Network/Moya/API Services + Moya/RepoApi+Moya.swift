//
//  RepoApi+Moya.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
import Moya
extension RepoApi : TargetType,AccessTokenAuthorizable {
    var baseURL: URL {
        return  URL(string: APIServiceConstants.baseURL)!.appendingPathComponent("/user")
    }

    var path: String {
        switch self {
        case .getRepos:
            return "/repos"
        }
    }

    var method: Moya.Method {
        return .post
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        nil
    }

    var authorizationType: AuthorizationType? {
        .bearer
    }

}

//[
//  {
//    "id": 1296269,
//    "node_id": "MDEwOlJlcG9zaXRvcnkxMjk2MjY5",
//    "name": "Hello-World",
//    "full_name": "octocat/Hello-World",
//    "owner": {
//      "login": "octocat",
//      "id": 1,
//      "node_id": "MDQ6VXNlcjE=",
//      "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//      "gravatar_id": "",
//      "url": "https://api.github.com/users/octocat",
//      "html_url": "https://github.com/octocat",
//      "followers_url": "https://api.github.com/users/octocat/followers",
//      "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//      "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//      "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//      "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//      "organizations_url": "https://api.github.com/users/octocat/orgs",
//      "repos_url": "https://api.github.com/users/octocat/repos",
//      "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//      "received_events_url": "https://api.github.com/users/octocat/received_events",
//      "type": "User",
//      "site_admin": false
//    },
//    "private": false,
//    "html_url": "https://github.com/octocat/Hello-World",
//    "description": "This your first repo!",
//    "fork": false,
//    "url": "https://api.github.com/repos/octocat/Hello-World",
//    "archive_url": "https://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}",
//    "assignees_url": "https://api.github.com/repos/octocat/Hello-World/assignees{/user}",
//    "blobs_url": "https://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}",
//    "branches_url": "https://api.github.com/repos/octocat/Hello-World/branches{/branch}",
//    "collaborators_url": "https://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}",
//    "comments_url": "https://api.github.com/repos/octocat/Hello-World/comments{/number}",
//    "commits_url": "https://api.github.com/repos/octocat/Hello-World/commits{/sha}",
//    "compare_url": "https://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}",
//    "contents_url": "https://api.github.com/repos/octocat/Hello-World/contents/{+path}",
//    "contributors_url": "https://api.github.com/repos/octocat/Hello-World/contributors",
//    "deployments_url": "https://api.github.com/repos/octocat/Hello-World/deployments",
//    "downloads_url": "https://api.github.com/repos/octocat/Hello-World/downloads",
//    "events_url": "https://api.github.com/repos/octocat/Hello-World/events",
//    "forks_url": "https://api.github.com/repos/octocat/Hello-World/forks",
//    "git_commits_url": "https://api.github.com/repos/octocat/Hello-World/git/commits{/sha}",
//    "git_refs_url": "https://api.github.com/repos/octocat/Hello-World/git/refs{/sha}",
//    "git_tags_url": "https://api.github.com/repos/octocat/Hello-World/git/tags{/sha}",
//    "git_url": "git:github.com/octocat/Hello-World.git",
//    "issue_comment_url": "https://api.github.com/repos/octocat/Hello-World/issues/comments{/number}",
//    "issue_events_url": "https://api.github.com/repos/octocat/Hello-World/issues/events{/number}",
//    "issues_url": "https://api.github.com/repos/octocat/Hello-World/issues{/number}",
//    "keys_url": "https://api.github.com/repos/octocat/Hello-World/keys{/key_id}",
//    "labels_url": "https://api.github.com/repos/octocat/Hello-World/labels{/name}",
//    "languages_url": "https://api.github.com/repos/octocat/Hello-World/languages",
//    "merges_url": "https://api.github.com/repos/octocat/Hello-World/merges",
//    "milestones_url": "https://api.github.com/repos/octocat/Hello-World/milestones{/number}",
//    "notifications_url": "https://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}",
//    "pulls_url": "https://api.github.com/repos/octocat/Hello-World/pulls{/number}",
//    "releases_url": "https://api.github.com/repos/octocat/Hello-World/releases{/id}",
//    "ssh_url": "git@github.com:octocat/Hello-World.git",
//    "stargazers_url": "https://api.github.com/repos/octocat/Hello-World/stargazers",
//    "statuses_url": "https://api.github.com/repos/octocat/Hello-World/statuses/{sha}",
//    "subscribers_url": "https://api.github.com/repos/octocat/Hello-World/subscribers",
//    "subscription_url": "https://api.github.com/repos/octocat/Hello-World/subscription",
//    "tags_url": "https://api.github.com/repos/octocat/Hello-World/tags",
//    "teams_url": "https://api.github.com/repos/octocat/Hello-World/teams",
//    "trees_url": "https://api.github.com/repos/octocat/Hello-World/git/trees{/sha}",
//    "hooks_url": "http://api.github.com/repos/octocat/Hello-World/hooks"
//  }
//]
