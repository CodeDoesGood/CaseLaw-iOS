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
    
    init(count: Int, next: String, previous: String? = nil, results: [Reporter]) {
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
        let results = try container.decode([Reporter].self, forKey: .results)
        
        self.init(count: count, next: next, previous: previous, results: results)
    }
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
    
    init(id: Int, url: String, fullName: String, shortName: String, startYear: Int, endYear: Int, jurisdictions: [Jurisdiction]) {
        self.id = id
        self.url = url
        self.fullName = fullName
        self.shortName = shortName
        self.startYear = startYear
        self.endYear = endYear
        self.jurisdictions = jurisdictions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let id = try container.decode(Int.self, forKey: .id)
        let url = container.decode( String.self, forKey: .url)
        let fullName = container.decode( String.self, forKey: .fullName)
        let shortName = container.decode( String.self, forKey: .shortName)
        let startYear = container.decode( Int.self, forKey: .startYear)
        let endYear = container.decode( Int.self, forKey: .endYear)
        let jurisdictions = container.decode( [Jurisdiction].self, forKey: .jurisdictions)
        
        self.init(id: id, url: url, fullName: fullName, shortName: shortName, startYear: startYear, endYear: endYear, jurisdictions: jurisdictions)
        
        
    }
}
