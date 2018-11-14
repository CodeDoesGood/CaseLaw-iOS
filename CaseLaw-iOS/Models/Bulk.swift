//
//  Bulk.swift
//  CaseLaw-iOS
//
//  Created by Massimo Savino on 2018-11-11.
//  Copyright © 2018 mpc. All rights reserved.
//

// NB:  The Caselaw Access Project lists the Bulk API endpoint as 'Case Export List'
//      Bulk Endpoint:  https://api.case.law/v1/bulk/


import Foundation

public struct BulkResult: Codable {
    public let count: Int
    public let next: String? = nil
    public let previous: String? = nil
    let results: [Bulk]
    
    init(count: Int, next: String?, previous: String?, results: [Bulk]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)         // 1. Defines the keyed container we're going to use
        
        let count: Int = try container.decode(Int.self, forKey: .count)
        let next: String? = try container.decode(String.self, forKey: .next)
        let previous: String? = try container.decode(String.self, forKey: .previous)
        
        self.init(count: count, next: next, previous: previous, results: results)
    }
}

public struct Bulk: Codable {
    public let id: Int
    public let downloadURL: String
    public let zipFilename: String
    public let exportDate: String
    public let publicStatus: Bool
    public let filterType: FilterType
    public let filterID: Int
    public let bodyFormat: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case downloadURL = "download_url"
        case zipFilename = "file_name"
        case exportDate = "export_date"
        case publicStatus = "public"
        case filterType = "filter_type"
        case filterID = "filter_id"
        case bodyFormat = "body_format"
    }
    
    init(id: Int, downloadURL: String, zipFilename: String, exportDate: String, publicStatus: Bool, filterType: FilterType, filterID: Int, bodyFormat: String) {
        self.id = id
        self.downloadURL = downloadURL
        self.zipFilename = zipFilename
        self.exportDate = exportDate
        self.publicStatus = publicStatus
        self.filterType = filterType
        self.filterID = filterID
        self.bodyFormat = bodyFormat
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let id: Int = try container.decode(Int.self, forKey: .id)
        let downloadURL: String  = try container.decode( String.self, forKey: .downloadURL)
        let zipFilename: String  = try container.decode( String.self, forKey: .zipFilename)
        let exportDate = try container.decode( String.self, forKey: .exportDate)
        let publicStatus: String = try container.decode( String.self, forKey: .publicStatus)
        let filterType: FilterType = try container.decode( FilterType.self, forKey: .filterType)
        let filterID = try container.decode( Int.self, forKey: .filterID)
        let bodyFormat = try container.decode( String.self, forKey: .bodyFormat)
        
        self.init(id: id, downloadURL: downloadURL, zipFilename: zipFilename, exportDate: exportDate, publicStatus: publicStatus, filterType: filterType, filterID: filterID, bodyFormat: bodyFormat)
    }
}
