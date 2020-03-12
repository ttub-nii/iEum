//
//  NetworkResult.swift
//  iEum
//
//  Created by 황수빈 on 31/10/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import Foundation

// 네트워크 상태의 5가지 결과 (성공, 요청 에러, 경로 에러, 서버 에러, 통신 실패)
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
