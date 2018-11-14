//
//  Court.swift
//  CaseLaw-iOS
//
//  Created by Massimo Savino on 2018-11-12.
//  Copyright © 2018 mpc. All rights reserved.
//

// NB:  This endpoint is also listed as 'Court List'
//      https://api.case.law/v1/courts/

import Foundation

public struct CourtResults: Codable {
    public let count: Int
    public let next: String
    public let previous: String? = nil
    public let results: [Court]
    
    init(count: Int, next: String, previous: String? = nil, results: [Court]) {
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
        let results = try container.decode([Court].self, forKey: .results)
        
        self.init(count: count, next: next, previous: previous, results: results)
    }
}

public struct Court: Codable {
    public let id: Int
    public let url: String
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
    
    init(id: Int, url: String, name: String, nameAbbreviation: String, jurisdiction: String, jurisdictionURL: String, slug: String) {
        self.id = id
        self.url = url
        self.name = name
        self.nameAbbreviation = nameAbbreviation
        self.jurisdiction = jurisdiction
        self.jurisdictionURL = jurisdictionURL
        self.slug = slug
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let id = try container.decode( .self, forKey: .id)
        let url = try container.decode( .self, forKey: .url)
        let name = try container.decode( .self, forKey: .name)
        let nameAbbreviation = try container.decode( .self, forKey: .nameAbbreviation)
        let jurisdiction = try container.decode( .self, forKey: .jurisdiction)
        let jurisdictionURL = try container.decode( .self, forKey: .jurisdictionURL)
        let slug = try container.decode( .self, forKey: .slug)
        
        self.init(id: id, url: url, name: name, nameAbbreviation: nameAbbreviation, jurisdiction: jurisdiction, jurisdictionURL: jurisdictionURL, slug: slug)
    }
}
