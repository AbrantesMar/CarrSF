//
//  HttpFactories.swift
//  Infra
//
//  Created by Márcio Abrantes on 13/06/23.
//

import Foundation

public class HttpFactories {
    static func makeUsersList() -> UsersList {
        let request: UserRequest = UserRequest(headers: nil,
                                               method: .get,
                                               parameters: nil,
                                               body: nil)
        let httpClientProtocol: HttpClientProtocol = AlamofireAdapter()
        let usersList = UsersList(request: request, httpClientProtocol: httpClientProtocol)
        return usersList
    }
    
    static func makeUser() -> UserDetailsUseCase {
        let request: UserRequest = UserRequest(headers: nil,
                                               method: .get,
                                               parameters: nil,
                                               body: nil)
        let httpClientProtocol: HttpClientProtocol = AlamofireAdapter()
        let usersList = UserDetailsUseCase(request: request, httpClientProtocol: httpClientProtocol)
        return usersList
    }
}
