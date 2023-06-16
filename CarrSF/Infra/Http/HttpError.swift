//
//  HttpError.swift
//  Infra
//
//  Created by Márcio Abrantes on 13/06/23.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
