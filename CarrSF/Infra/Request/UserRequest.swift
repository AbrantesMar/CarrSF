//
//  UserRequest.swift
//  Infra
//
//  Created by Márcio Abrantes on 13/06/23.
//

import Foundation
import Alamofire

public class UserRequest {
    public let url = "https://api.github.com/users"
    public var user = ""
    public var path: URL {
        return URL(string: url + user)!
    }
    
    public var headers: HTTPHeaders? = [
        "content-type": "text/plain",
        "x-github-api-version": "2022-11-28",
        "Accept": "application/vnd.github+json",
        "per_page": "10"
    ]
    public var method: HTTPMethod
    public var parameters: [String : Any]?
    public var body: [String : Any]?
    
    public init(headers: HTTPHeaders? = nil, method: HTTPMethod, parameters: [String : Any]? = nil, body: [String : Any]? = nil) {
        self.headers = headers
        self.method = method
        self.parameters = parameters
        self.body = body
    }
    
    
}
