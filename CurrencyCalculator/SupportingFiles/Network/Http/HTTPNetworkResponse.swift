//
//  HTTPNetworkResponse.swift
//  CurrencyCalculator
//
//  Created by Morenikeji on 2/24/22.
//

import UIKit
import Foundation
import SwiftyJSON
import Alamofire

struct HTTPNetworkResponse {
    //Properly checks and handles the status code of the response
    static func handleNetworkResponse(for response: DataResponse<Any, AFError>) -> Results<Any> {
     
        guard let res = response.data else {
            return Results.failure(HTTPNetworkError.UnwrappingError)
           
        }
         
        guard let statusCode = response.response?.statusCode else {
            return Results.failure(HTTPNetworkError.UnwrappingError)
        }
         
        let responseObject = JSON(res)
         
        switch statusCode {
            case 200:
                if (responseObject["hasError"].boolValue) {
                    return .failure(NSError(domain: "", code: responseObject["errors"]["code"].intValue, userInfo: [NSLocalizedDescriptionKey: responseObject["errors"]["message"].stringValue]))
                } else {
                    return .success(responseObject)
                }
            case 105:
                if (responseObject["hasError"].boolValue) {
                    return .failure(NSError(domain: "", code: responseObject["error"]["code"].intValue, userInfo: [NSLocalizedDescriptionKey: responseObject["error"]["type"].stringValue]))
                } else {
                    return .success(responseObject)
                }
            default: return .failure(HTTPNetworkError.failed)
            
        }
    }
}

