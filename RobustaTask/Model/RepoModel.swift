

// MARK: - RepoModel
struct RepoModel: Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let repoModelPrivate: Bool?
    let owner: Owner?
    let htmlURL: String?
    let repoModelDescription: String?
    let fork: Bool?
    let url, forksURL: String?
    let keysURL, collaboratorsURL: String?
    let teamsURL, hooksURL: String?
    let issueEventsURL: String?
    let eventsURL: String?
    let assigneesURL, branchesURL: String?
    let tagsURL: String?
    let blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    let statusesURL: String?
    let languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    let subscriptionURL: String?
    let commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    let contentsURL, compareURL: String?
    let mergesURL: String?
    let archiveURL: String?
    let downloadsURL: String?
    let issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    let labelsURL, releasesURL: String?
    let deploymentsURL: String?

    
}

// MARK: - Owner
struct Owner: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?
   
    
}
enum CodingKeys: String, CodingKey {

           case login, id
           case nodeID = "node_id"
           case avatarURL = "avatar_url"
           case gravatarID = "gravatar_id"
           case url
           case htmlURL = "html_url"
           case followersURL = "followers_url"
           case followingURL = "following_url"
           case gistsURL = "gists_url"
           case starredURL = "starred_url"
           case subscriptionsURL = "subscriptions_url"
           case organizationsURL = "organizations_url"
           case reposURL = "repos_url"
           case eventsURL = "events_url"
           case receivedEventsURL = "received_events_url"
           case type
           case siteAdmin = "site_admin"
   }
