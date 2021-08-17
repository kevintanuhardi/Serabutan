//
//  Network.swift
//  MovieDict
//
//  Created by Kevin Tanuhardi on 04/07/21.
//

import Foundation
import Alamofire
import MapKit
import SwiftyJSON

enum Endpoints {
    case getNearbyJob
    case postJob
    
    public var url: String {
        let serabutanUrl = Constants.networking.serabutan.baseUrl
        switch self {
        case .getNearbyJob:
            return "\(serabutanUrl)/job/nearby"
        case .postJob:
            return "\(serabutanUrl)/job"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getNearbyJob:
            return .get
        case .postJob:
            return .post
        }
    }
}

class APIManager {
    
    enum RequestError: Error {
        case unknownError
        case connectionError
        case authorizationError(Any)
        case invalidRequest
        case notFound
        case invalidResponse
        case serverError
        case serverUnavailable
    }
    
    enum ApiResult {
        case success(Any)
        case failure(RequestError)
    }
    
    static func getNearbyJob(coordinate: CLLocationCoordinate2D, completion: @escaping (ApiResult)->Void ) {
        let parameters = ["lng": coordinate.longitude, "lat": coordinate.latitude]
        let headers: HTTPHeaders = [
            // TODO: think about the flow to save token
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjA4MTI4NzEzNDE3IiwidXNlcklkIjoxLCJpYXQiOjE2Mjc2NTQ0NDYsImV4cCI6MTY1OTE5MDQ0Nn0.YyW4CXT-RdRofBU1b1wTplc6Vy2zLPnA5f9DBDuZU1Y",
            "Accept": "application/json"
        ]
        AF.request(Endpoints.getNearbyJob.url, method: Endpoints.getNearbyJob.method, parameters: parameters, headers: headers)
            .validate()
            .responseJSON{ json in
                switch json.result {
                case .failure:
                    do {
                        if let data = json.data {
                            let data = try JSON(data: data)
                            print("error message:", data["message"])
                        }
                        completion(ApiResult.failure(.connectionError))
                    } catch {
                        completion(ApiResult.failure(.connectionError))
                    }
                    
                case .success(let jsonData):
                    if let json = try? JSONSerialization.data(withJSONObject: jsonData, options: .sortedKeys) {
                        do {
                            let data = try JSON(data: json)
                            
                            let jobs = data["records"].arrayValue.map{Job($0)}
                            completion(ApiResult.success(jobs))
                        } catch let error{
                            print("error:", error)
                            completion(ApiResult.failure(.connectionError))
                        }
                    } else {
                        
                        completion(ApiResult.failure(.connectionError))
                    }
                    
                    
                }
                
            }
    }
    
    static func postJob(jobToCreate: Job, completion: @escaping (ApiResult)->Void ) {
        
        let headers: HTTPHeaders = [
            // TODO: think about the flow to save token
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjA4MTI4NzEzNDE3IiwidXNlcklkIjoxLCJpYXQiOjE2Mjc2NTQ0NDYsImV4cCI6MTY1OTE5MDQ0Nn0.YyW4CXT-RdRofBU1b1wTplc6Vy2zLPnA5f9DBDuZU1Y",
            "Accept": "application/json"
        ]
        
        let body: [String: String] = [
            "latitude": String(jobToCreate.coordinate.latitude),
            "longitude": String(jobToCreate.coordinate.latitude),
            "urgency": jobToCreate.urgency.rawValue,
            "title": jobToCreate.title!,
            "genderPreference": jobToCreate.genderPreference,
            "agePreference": jobToCreate.agePreference,
            "desc": jobToCreate.desc!,
            "price": String(jobToCreate.price)
        ]
        AF.request(Endpoints.postJob.url, method: Endpoints.postJob.method, parameters: body, encoder: JSONParameterEncoder.default, headers: headers)
            .validate()
            .responseJSON{ json in
                switch json.result {
                case .failure:
                    do {
                        if let data = json.data {
                            let data = try JSON(data: data)
                            print("error message:", data["message"])
                        }
                        completion(ApiResult.failure(.connectionError))
                    } catch {
                        completion(ApiResult.failure(.connectionError))
                    }
                    
                case .success(let jsonData):
                    if let json = try? JSONSerialization.data(withJSONObject: jsonData, options: .sortedKeys) {
                        do {
                            let data = try JSON(data: json)
                            
                            let jobs = data["records"].arrayValue.map{Job($0)}
                            completion(ApiResult.success(jobs))
                        } catch let error{
                            print("error:", error)
                            completion(ApiResult.failure(.connectionError))
                        }
                    } else {
                        
                        completion(ApiResult.failure(.connectionError))
                    }
                    
                    
                }
                
            }
    }
    
}
