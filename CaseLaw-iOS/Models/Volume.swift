//
//  Volumes.swift
//  CaseLaw-iOS
//
//  Created by Massimo Savino on 2018-11-12.
//  Copyright © 2018 mpc. All rights reserved.
//

// NB:  This endpoint is also listed as 'Volumes List'
//      https://api.case.law/v1/volumes/

import Foundation

public struct VolumeResults: Codable {
    public let count: Int
    public let next: String
    public let previous: String? = nil
    let results: [Volume]
    
    init(count: Int, next: String, previous: String? = nil, results: [Volume]) {
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
        let results = try container.decode([Volume].self, forKey: .results)
        
        self.init(count: count, next: next, previous: previous, results: results)
    }
}

public struct Volume: Codable {
    public let url: String
    public let barcode: Int
    public let volumeNumber: Int? = nil
    public let title: String? = nil
    public let publisher: String? = nil
    public let publicationYear: Int? = nil
    public let startYear: Int? = nil
    public let endYear: Int? = nil
    public let nominativeVolumeNumber: Int? = nil
    public let nominativeName: Int? = nil
    public let seriesVolumeNumber: Int? = nil
    public let reporter: String? = nil
    public let reporterURL: String
    public let jurisdictions: [Jurisdiction]

    enum CodingKeys: String, CodingKey {
        case url
        case barcode
        case volumeNumber = "volume_number"
        case title
        case publisher
        case publicationYear = "publication_year"
        case startYear = "start_year"
        case endYear = "end_year"
        case nominativeVolumeNumber = "nominative_volume_number"
        case nominativeName = "nominative_name"
        case seriesVolumeNumber = "series_volume_number"
        case reporter
        case reporterURL = "reporter_url"
        case jurisdictions
    }
    
    init(url: String,
         barcode: Int,
         volumeNumber: Int,
         title: String? = nil,
         publisher: String? = nil,
         publicationYear: Int? = nil,
         startYear: Int? = nil,
         endYear: Int? = nil,
         nominativeVolumeNumber: Int? = nil,
         nominativeName: Int? = nil,
         seriesVolumeNumber: Int? = nil,
         reporter: String? = nil,
         reporterURL: String,
         jurisdictions: [Jurisdiction]) {
        
        self.url = url
        self.barcode = barcode
        self.volumeNumber = volumeNumber
        self.title = title
        self.publisher = publisher
        self.publicationYear = publicationYear
        self.startYear = startYear
        self.endYear = endYear
        self.nominativeVolumeNumber = nominativeVolumeNumber
        self.nominativeName = nominativeName
        self.seriesVolumeNumber = seriesVolumeNumber
        self.reporter = reporter
        self.reporterURL = reporterURL
        self.jurisdictions = jurisdictions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let url = try container.decode( String.self, forKey: .url)
        let barcode = try container.decode( Int.self, forKey: .barcode)
        let volumeNumber = try container.decode( Int.self, forKey: .volumeNumber)
        let title = try container.decode( String.self, forKey: .title)
        let publisher = try container.decode( String.self, forKey: .publisher)
        let publicationYear = try container.decode( Int.self, forKey: .publicationYear)
        let startYear = try container.decode( Int.self, forKey: .startYear)
        let endYear = try container.decode( Int.self, forKey: .endYear)
        let nominativeVolumeNumber = try container.decode( Int.self, forKey: .nominativeVolumeNumber)
        let nominativeName = try container.decode( String.self, forKey: .nominativeName)
        let seriesVolumeNumber = try container.decode( Int.self, forKey: .seriesVolumeNumber)
        let reporter = try container.decode( String.self, forKey: .reporter)
        let reporterURL = try container.decode( String.self, forKey: .reporterURL)
        let jurisdictions = try container.decode( [Jurisdiction].self, forKey: .jurisdictions)
        
        self.init(url: url, barcode: barcode, volumeNumber: volumeNumber, title: title, publisher: publisher, publicationYear: publicationYear, startYear: startYear, endYear: endYear, nominativeVolumeNumber: nominativeVolumeNumber, nominativeName: nominativeName, seriesVolumeNumber: seriesVolumeNumber, reporter: reporter, reporterURL: reporterURL, jurisdictions: jurisdictions)
    }
}
