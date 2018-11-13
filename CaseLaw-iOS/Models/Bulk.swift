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
    public let next: String
    public let previous: String? = nil
    let results: [Bulk]
}

public struct Bulk: Codable {
    public let id: Int
    public let downloadURL: URL
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
}
