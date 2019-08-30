//
//  Interceptor.swift
//  Series
//
//  Created by julio vargas bautista on 8/29/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AccessTokenAdapter: RequestAdapter, RequestRetrier {
    private let accessToken: String
    
    init(_ accessToken: String) {
        self.accessToken = accessToken
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix("https://api.thetvdb.com") || urlString.hasPrefix("https://omdbapi.com"){
            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
           
        }
        
        return urlRequest
    }
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        
        
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            UserDefaults.standard.set(false, forKey: "session")
            UserDefaults.standard.set(nil, forKey: "token")
            DispatchQueue.main.async {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.initialViewController()
            }
            
        } else {
            completion(false, 0.0)
        }
    }
}
