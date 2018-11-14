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
    
    init(count: Int, next: String, previous: String? = nil, results: [Citation]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let count = try container.decode(Int.self, forKey: .count)
        let next = try container.decode(String.self, forKey: .next)
        let previous = try container.decode(String.self, forKey: .previous)
        let results = try container.decode([Citation].self, forKey: .results)
        
        self.init(count: count, next: next, previous: previous, results: results)
    }
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
    
    init(type: String, cite: String, caseID: Int, caseURL: String) {
        self.type = type
        self.cite = cite
        self.caseID = caseID
        self.caseURL = caseURL
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let type = try container.decode(String.self, forKey: .type)
        let cite = try container.decode(String.self, forKey: .cite)
        let caseID = try container.decode(Int.self, forKey: .caseID)
        let caseURL = try container.decode(String.self, forKey: .caseURL)
        
        self.init(type: type, cite: cite, caseID: caseID, caseURL: caseURL)
    }
}
