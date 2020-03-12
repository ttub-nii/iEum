//
//  APIConstants.swift
//  iEum
//
//  Created by 황수빈 on 01/11/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

struct APIConstants {
    
    // 전역 변수로 사용할 수 있게 APIConstants 선언하여 사용
    static let BaseURL = "http://106.10.59.71:3000/users"
    
    /* 유저(User) */
    static let LoginURL = BaseURL + "/signin" // 로그인
    static let SignupURL = BaseURL + "/signup" // 회원가입
}
