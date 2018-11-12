//
//  Courts.swift
//  CaseLaw-iOS
//
//  Created by Massimo Savino on 2018-11-12.
//  Copyright © 2018 mpc. All rights reserved.
//

// NB:  This endpoint is also listed as 'Court List'
//      https://api.case.law/v1/courts/

import Foundation

public struct Court: Codable {
    public let count: Int
    public let next: String
    public let previous: String? = nil
    public let results: Results
}

public struct CourtResult: Codable {
    public let id: Int
    public let url: URL
    public let name: String
    public let nameAbbreviation: String
    public let jurisdiction: String
    public let jurisdictionURL: String
    public let slug: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case nameAbbreviation = "name_abbreviation"
        case jurisdiction
        case jurisdictionURL = "jurisdiction_url"
        case slug
    }
}
