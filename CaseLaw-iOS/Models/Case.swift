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
    
    init(count: Int, next: String, previous: String? = nil, results: [Case]) {
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
        let results = try container.decode([Case].self, forKey: .results)
        
        self.init(count: count, next: next, previous: previous, results: results)
    }
}

public struct Case: Codable {
    public let id: Int
    public let url: String
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
    
    init(id: Int, url: String, name: String, nameAbbreviation: String, decisionDate: String, docketNumber: String? = nil, firstPage: String?, lastPage: String?, citations: [Citation], volume: Volume, reporter: Reporter, court: Court, jurisdiction: Jurisdiction) {
        self.id = id
        self.url = url
        self.name = name
        self.nameAbbreviation = nameAbbreviation
        self.decisionDate = decisionDate
        self.docketNumber = docketNumber
        self.firstPage = firstPage
        self.lastPage = lastPage
        self.citations = citations
        self.volume = volume
        self.reporter = reporter
        self.court = court
        self.jurisdiction = jurisdiction
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let id = try container.decode( Int.self, forKey: .id)
        let url = try container.decode( String.self, forKey: .url)
        let name = try container.decode( String.self, forKey: .name)
        let nameAbbreviation = try container.decode( String.self, forKey: .nameAbbreviation)
        let decisionDate = try container.decode( String.self, forKey: .decisionDate)
        let docketNumber = try container.decode( String.self, forKey: .docketNumber)
        let firstPage = try container.decode( String.self, forKey: .firstPage)
        let lastPage = try container.decode( String.self, forKey: .lastPage)
        let citations = try container.decode( [Citation].self, forKey: .citations)
        let volume = try container.decode( Volume.self, forKey: .volume)
        let reporter = try container.decode( Reporter.self, forKey: .reporter)
        let court = try container.decode( Court.self, forKey: .court)
        let jurisdiction = try container.decode( Jurisdiction.self, forKey: .jurisdiction)
        
        self.init(id: id, url: url, name: name, nameAbbreviation: nameAbbreviation, decisionDate: decisionDate, firstPage: firstPage, lastPage: lastPage, citations: citations, volume: volume, reporter: reporter, court: court, jurisdiction: jurisdiction)
    }
}
