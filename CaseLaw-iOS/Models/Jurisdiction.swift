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
    
    init(count: Int, next: String, previous: String? = nil, results: [Jurisdiction]) {
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
        let results = try container.decode([Jurisdiction].self, forKey: .results)
        
        self.init(count: count, next: next, previous: previous, results: results)
    }
}

public struct Jurisdiction: Codable {
    public let url: String
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
    
    init(url: String, id: Int, slug: String, name: String, nameLong: String, whitelisted: Bool) {
        self.url = url
        self.id = id
        self.slug = slug
        self.name = name
        self.nameLong = nameLong
        self.whitelisted = whitelisted
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let url = try container.decode( String.self, forKey: .url)
        let id = try container.decode( Int.self, forKey: .id)
        let slug = try container.decode( String.self, forKey: .slug)
        let name = try container.decode( String.self, forKey: .name)
        let nameLong = try container.decode( String.self, forKey: .nameLong)
        let whitelisted = try container.decode( Bool.self, forKey: .whitelisted)
        
        self.init(url: url, id: id, slug: slug, name: name, nameLong: nameLong, whitelisted: whitelisted)
    }
}
