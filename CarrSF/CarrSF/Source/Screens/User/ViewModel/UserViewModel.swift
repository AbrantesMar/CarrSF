//
//  UserViewModel.swift
//  CarrSF
//
//  Created by Márcio Abrantes on 15/06/23.
//

import Foundation
import Infra
import RxSwift

public class UserViewModel {
    private var userName: String
    private var user: UserDetailsDomain?
    private let useCase: UserDetailsUseCaseProtocol
    
    var showError: ((String) -> Void)?
    
    var login: Observable<String?> {
        return Observable.just(user?.login)
    }
    
    var name: Observable<String?> {
        return Observable.just(user?.name)
    }
    
    var avatarURL: Observable<URL?> {
        return Observable.just(URL(string: user?.avatarURL ?? ""))
    }
    
    var profileURL: Observable<URL?> {
        return Observable.just(URL(string: user?.url ?? ""))
    }
    
    public init(useCase: UserDetailsUseCaseProtocol, userName: String) {
        self.useCase = useCase
        self.userName = userName
    }
    
    public func fetchUser() {
        useCase.fetchUser(userName: userName) { [weak self] result in
            self?.handleFetchUser(result: result)
        }
    }
    
    public func handleFetchUser(result: Result<UserDetailsDomain, HttpError>) {
        switch result {
        case .success(let user):
            self.user = user
        case .failure(let error):
            self.showError?(error.localizedDescription)
        }
        
    }
}
