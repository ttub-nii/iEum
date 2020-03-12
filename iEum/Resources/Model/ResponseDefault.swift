//
//  ResponseDefault.swift
//  iEum
//
//  Created by 황수빈 on 02/11/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import Foundation

// MARK: - ResponseDefault
struct ResponseDefault: Codable {
    let success: Bool
    let message: String
    let data: Int
}
