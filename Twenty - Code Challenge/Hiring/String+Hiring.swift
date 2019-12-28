//
//  String+Hiring.swift
//  Hiring
//
//  Created by Armando Gonzalez on 2/28/19.
//  Copyright © 2019 Twenty. All rights reserved.
//

import Foundation

extension String {
    static var westworldID: String { get { return "1371" } }
    static var showPreIDURLComponent: String { get { return "https://api.tvmaze.com/shows/" } }
    static var showPostIDURLComponent: String { get { return "?embed=seasons" } }
    static var seasonPreIDURLComponent: String { get { return "https://api.tvmaze.com/seasons/" } }
    static var seassonPostIDURLComponent: String { get { return "/episodes" } }
}
