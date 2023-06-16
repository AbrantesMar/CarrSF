//
//  File.swift
//  CarrSFDomain
//
//  Created by Márcio Abrantes on 14/06/23.
//

import Foundation

public struct Repository: Model {
    var id: Int
    var nodeID: String
    var name: String
    var fullName: String
    var accessPrivate: Bool
    var owner: Owner

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case accessPrivate = "private"
        case owner
    }
}
