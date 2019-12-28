//
//  APIRequest.swift
//  Hiring
//
//  Created by Armando Gonzalez on 2/28/19.
//  Copyright © 2019 Twenty. All rights reserved.
//

import Foundation

struct APIRequest: Request {
    let id: String
    let preIDURL: String
    let postIDURL: String
    var urlRequest: URLRequest {
        let urlString = preIDURL + "\(id)" + postIDURL
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
}
