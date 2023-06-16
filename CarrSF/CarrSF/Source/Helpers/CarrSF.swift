//
//  CarrSF.swift
//  CarrSF
//
//  Created by Márcio Abrantes on 15/06/23.
//

import Foundation
import CoreData
import Infra

public class CarrSFFactory {
    static func makeRegisterServices() {
        let container = CarrSFCotainerDI.shared
        let request: UserRequest = UserRequest(headers: nil,
                                               method: .get,
                                               parameters: nil,
                                               body: nil)
        let httpClientProtocol: HttpClientProtocol = AlamofireAdapter()
        container.register(type: UsersListProtocol.self, service: UsersList(request: request, httpClientProtocol: httpClientProtocol))
        container.register(type: UserDetailsUseCaseProtocol.self, service: UserDetailsUseCase(request: request, httpClientProtocol: httpClientProtocol))
    }
    
    static func makeUsers() -> UsersListProtocol {
        let usersResult = CarrSFCotainerDI.shared.resolve(type: UsersListProtocol.self)
        return usersResult
    }
    
    static func makeUserUseCase() -> UserDetailsUseCaseProtocol {
        let usersResult = CarrSFCotainerDI.shared.resolve(type: UserDetailsUseCaseProtocol.self)
        return usersResult
    }
}
