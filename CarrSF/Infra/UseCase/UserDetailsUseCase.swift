//
//  UserDetails.swift
//  Infra
//
//  Created by Márcio Abrantes on 15/06/23.
//

import Foundation

public protocol UserDetailsUseCaseProtocol {
    func fetchUser(userName: String,
                   completion: @escaping (Result<UserDetailsDomain, HttpError>) -> Void)
}

public final class UserDetailsUseCase: UserDetailsUseCaseProtocol {
    
    private let request: UserRequest
    private let httpClientProtocol: HttpClientProtocol
    
    public init(request: UserRequest,
                httpClientProtocol: HttpClientProtocol) {
        self.request = request
        self.httpClientProtocol = httpClientProtocol
    }
    
    public func fetchUser(userName: String,
                          completion: @escaping (Result<UserDetailsDomain, HttpError>) -> Void) {
        request.user = userName
        httpClientProtocol.fetchUser(url: request.path,
                                         headers: request.headers) { [weak self] result in
            self?.handlerFetchUser(result: result) { result in
                completion(result)
            }
        }
    }
    
    private func handlerFetchUser(result: Result<UserDetailsDomain, HttpError>,
                                  completion: @escaping (Result<UserDetailsDomain, HttpError>) -> Void) {
        switch result {
        case .failure(_):
            completion(.failure(.badRequest))
        case .success(let root):
            completion(.success(root))
        }
    }
}
