//
//  UsersResult.swift
//  CarrSFDomain
//
//  Created by Márcio Abrantes on 13/06/23.
//

import Foundation

public struct User: Model {
    public var login: String
    public var id: Int
    public var url: String
    var nodeID: String
    public var avatarURL: String
    public var gravatarID: String
    public var type: String
    public var siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login, id, url
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case type
        case siteAdmin = "site_admin"
    }
}
