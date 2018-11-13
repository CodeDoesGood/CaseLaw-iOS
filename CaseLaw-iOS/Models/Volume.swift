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
    public let jurisdictions: [Results]

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
}
