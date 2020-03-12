//
//  SignupSerive.swift
//  iEum
//
//  Created by 황수빈 on 02/11/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import Foundation
import Alamofire

/* 회원 가입 메소드 */
class SignupService {
    
    // singleton pattern
    // 생애 주기에서 딱 한번 객체가 생성되고 전역으로 접근이 가능
    static let shared = SignupService()
    
    func signup(_ id : String, _ pwd : String, _ name : String, _ phone : String, completion : @escaping (NetworkResult<Any>) -> void) {
        
        let header : HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body : Parameters = [
            "id": id,
            "pwd": pwd,
            "name": name,
            "phone": phone
        ]
        
        Alamofire.request(APIConstants.SignupURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData { response in
            
            switch response.result {
                
            // 네트워크 통신 성공
            case.success :
                
                // value는 byte로 되어있음 print(value)
                if let value = response.result.value {
                    
                    // response의 response 안에 있는 statusCode를 추출
                    if let status = response.response?.statusCode {
                        
                        // Http Status Code 상태 코드에 따라 분기 처리
                        // 200 성공, 300 리다이렉션, 400 클라오류, 500 서버오류
                        switch status {
                        case 200:
                            
                            // decoding 시작
                            // 선언했던 decodable Protocol 사용
                            do {
                                let decoder = JSONDecoder()
                                
                                let result = try decoder.decode(ResponseDefault.self, from: value)
                                
                                // decoding 성공했는지 확인
                                switch result.success {
                                case true:
                                    
                                    // 진짜 성공!!
                                    completion(.success(result.data))
                                    
                                case false:
                                    completion(.requestErr(result.message))
                                }
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                                print(APIConstants.LoginURL)
                                
                            } // 여기까지가 디코딩
                            
                        case 400:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        } // status code로 분기처리 switch가 여기까지
                    }
                }
                break
                
            // 네트워크 통신 실패
            case .failure(let err) :
                print(err.localizedDescription)
                completion(.networkFail)
                // .networkFail이라는 반환 값이 넘어감
                break
            } // response.result switch
        } // alamofire.request
    } // func login
} // struct
