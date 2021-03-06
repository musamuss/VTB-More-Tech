//
//  API.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Alamofire
import UIKit
import Combine

enum APIError: Error {
    case carModelNameError
    case carInfoError
}

typealias CarInfo = (car: Car, choosedModel: CarModel)

class API {
    static let current = API()
    
    // MARK: Publishers
    
    func carModelName(from image: UIImage) -> Future<[String: Double], APIError> {

        let future = Future<[String: Double], APIError> { [unowned self] promise in
            self.recognizeCarModelName(from: image) { propabilities in
                if propabilities.isEmpty {
                    promise(.failure(.carModelNameError))
                } else {
                    promise(.success(propabilities))
                }
            }
        }
        
        return future
    }
    
    func carInfo(for modelName: String) -> Future<CarInfo, APIError> {
        
        let future = Future<CarInfo, APIError> { [unowned self] promise in
            self.getCarInfo(for: modelName) { carInfo in
                if let carInfo = carInfo {
                    promise(.success(carInfo))
                } else {
                    promise(.failure(.carInfoError))
                }
            }
        }
        
        return future
    }
    
    // MARK: API Methods
    
    func recognizeCarModelName(from image: UIImage, completion: @escaping ([String: Double]) -> Void) {
        guard let base64Image = image.jpegData(compressionQuality: 0.25)?.base64EncodedData(options: .endLineWithLineFeed),
              let base64String = String(data: base64Image, encoding: .utf8) else {
            completion([:])
            return
        }
        
        let parameters = ["content": base64String] as [String: Any]

        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])

        var request = URLRequest(url: baseURL.appendingPathComponent("/car-recognize"),
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        AF.request(request).response { response in
            guard let data = response.data,
                  let decodedData = try? JSONDecoder().decode([String: [String: Double]].self, from: data) else {
                completion([:])
                return
            }
            
            completion(decodedData["probabilities"] ?? [:])
        }
    }
    
    func getCarInfo(for modelName: String, completion: @escaping (CarInfo?) -> Void) {
        let components = modelName.components(separatedBy: " ")
        guard components.count == 2,
              let brand = components.first?.lowercased(),
              let model = components.last?.lowercased() else {
            completion(nil)
            return
        }
        
        AF.request(baseURL.appendingPathComponent("/marketplace"),
                   method: .get,
                   headers: afHeaders)
            .response { response in
                guard let data = response.data,
                      let decodedData = try? JSONDecoder().decode([String: [Car]].self, from: data) else {
                    completion(nil)
                    return
                }
            
                let cars = decodedData["list"]
                
                guard let car = cars?.first(where: { $0.alias?.lowercased() == brand }),
                      let model = car.models?.first(where: { $0.title?.lowercased() == model }) ?? car.models?.first else {
                    completion(nil)
                    return
                }
                
                completion((car, model))
            }
    }
    
    // MARK: Private
    
    private let baseURL = URL(string: "https://gw.hackathon.vtb.ru/vtb/hackathon")!
    
    private var headers: [String: String] {
        [
            "X-IBM-Client-Id": "235c5390021425cd7267252ee1e96453",
            "content-type": "application/json",
            "accept": "application/json",
        ]
    }
    
    private var afHeaders: HTTPHeaders {
        let items = headers.keys.map { name in
            HTTPHeader(name: name, value: headers[name]!)
        }
        
        return .init(items)
    }
}
