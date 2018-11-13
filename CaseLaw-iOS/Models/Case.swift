//
//  Case.swift
//  CaseLaw-iOS
//
//  Created by Massimo Savino on 2018-11-12.
//  Copyright © 2018 mpc. All rights reserved.
//

// NB:  This endpoint is also listed as 'Case List'
//      https://api.case.law/v1/cases/

import Foundation

public struct CaseResults: Codable {
    public let count: Int
    public let next: String
    public let previous: String? = nil
    public let results: [Case]
}

public struct Case: Codable {
    public let id: Int
    public let url: URL
    public let name: String
    public let nameAbbreviation: String
    public let decisionDate: String
    public let docketNumber: String? = nil
    public let firstPage: String?
    public let lastPage: String?
    public let citations: [Citation]
    public let volume: Volume
    public let reporter: Reporter
    public let court: Court
    public let jurisdiction: Jurisdiction
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case nameAbbreviation = "name_abbreviation"
        case decisionDate = "decision_date"
        case docketNumber = "docket_number"
        case firstPage = "first_page"
        case lastPage = "last_page"
        case citations
        case volume
        case reporter
        case court
        case jurisdiction
    }
}

public struct Citation: Codable {
    public let type: String
    public let cite: String
}

