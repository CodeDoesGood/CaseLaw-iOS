//
//  Citation.swift
//  CaseLaw-iOS
//
//  Created by Massimo Savino on 2018-11-12.
//  Copyright © 2018 mpc. All rights reserved.
//

// NB:  This endpoint is also listed as 'Citation List'
//      https://api.case.law/v1/citations/

import Foundation

public struct CitationResults: Codable {
    public let count: Int
    public let next: String
    public let previous: String? = nil
    public let results: [Citation]
}

public struct Citation: Codable {
    public let type: String
    public let cite: String
    public let caseID: Int
    public let caseURL: String
    
    enum CodingKeys: String, CodingKey {
        case type
        case cite
        case caseID = "case_id"
        case caseURL = "case_url"
    }
}
