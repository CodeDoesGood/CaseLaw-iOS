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

public struct Reporters: Codable {
    public let count: Int
    public let next: String
    public let previous: String? = nil
    let results: Results
}

public struct ReporterResults: Codable {
    public let id: Int
    public let url: String
    public let fullName
}
