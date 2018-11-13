//
//  Jurisdiction.swift
//  CaseLaw-iOS
//
//  Created by Massimo Savino on 2018-11-12.
//  Copyright © 2018 mpc. All rights reserved.
//

// NB:  This endpoint is also listed as 'Jurisdiction List'
//      https://api.case.law/v1/jurisdictions/

import Foundation

public struct JurisdictionResults: Codable {
    public let count: Int
    public let next: String
    public let previous: String? = nil
    public let results: [Jurisdiction]
}

public struct Jurisdiction: Codable {
    public let url: URL
    public let id: Int
    public let slug: String
    public let name: String
    public let nameLong: String
    public let whitelisted: Bool
    
    enum CodingKeys: String, CodingKey {
        case url
        case id
        case slug
        case name
        case nameLong = "name_long"
        case whitelisted
    }
}
