//
//  Model.swift
//  CarrSFDomain
//
//  Created by Márcio Abrantes on 14/06/23.
//

import Foundation

public protocol Model: Codable { }

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
