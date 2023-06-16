//
//  Owner.swift
//  CarrSFDomain
//
//  Created by Márcio Abrantes on 14/06/23.
//

import Foundation

// MARK: - Owner
public struct Owner: Model {
    var login: String
    var id: Int

    enum CodingKeys: String, CodingKey {
        case login, id
    }
}
