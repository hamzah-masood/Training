//
//  LibraryContainer.swift
//  BookSearch
//
//  Created by mcs on 12/18/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct SearchContainer: Decodable {
    let numFound: Int
    let results: [Results]
    
    enum CodingKeys: String, CodingKey {
        
        case numFound
        case results = "docs"
        
    }
}

struct Results: Decodable {
    let title: String?
    let authorName: [String]?
    let publishYear: Int?
    let publishDate: [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case authorName = "author_name"
        case publishYear = "first_publish_year"
        case publishDate =  "publish_date"
        
    }
}



