//
//  Reporters.swift
//  CaseLaw-iOS
//
//  Created by Massimo Savino on 2018-11-12.
//  Copyright © 2018 mpc. All rights reserved.
//

// NB:  This endpoint is also listed as 'Reporters List'
//      https://api.case.law/v1/reporters/

import Foundation

public struct ReporterResults: Codable {
    public let count: Int
    public let next: String
    public let previous: String? = nil
    let results: [Reporter]
}

public struct Reporter: Codable {
    public let id: Int
    public let url: String
    public let fullName: String
    public let shortName: String
    public let startYear: Int
    public let endYear: Int
    public let jurisdictions: [Jurisdiction]
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case fullName = "full_name"
        case shortName = "short_name"
        case startYear = "start_year"
        case endYear = "end_year"
        case jurisdictions
    }
}
