//
//  WebserviceManager.swift
//  AppAssignment
//
//  Created by Mohammad Zulqarnain on 27/03/2020.
//  Copyright © 2020. All rights reserved.
//

import UIKit
import Reachability
import Alamofire

protocol WebserviceManagerProtocol {
    func request<T: Codable>(headers: HTTPHeaders?, endpoint:Endpoint, type: HTTPMethod, parameters: [String: Any]?, _ completion: @escaping (ResultType<T>) -> Void)
}

/* WebserviceManager
 This class houses all the networking logic which is used for downloading the data from API Webservice
 */
final class WebserviceManager: NSObject, WebserviceManagerProtocol {
    
    private let API_CODE_TOKEN_EXPIRED = 201
    private var reachability: Reachability?
    
    override init() {
        super.init()
        setupReachability()
    }
    
    // Get Validated version response
    func request<T: Codable>(headers: HTTPHeaders? = nil, endpoint:Endpoint, type: HTTPMethod, parameters: [String: Any]? = nil, _ completion: @escaping (ResultType<T>) -> Void) {
        
        DispatchQueue.main.async {
            self.addActivityIndicatorOnTopView()
        }
        
        if reachability != nil, reachability?.connection.description != StringConstants.noConnection.rawValue {
            AF.request("\(config.baseURL)\(endpoint.rawValue)", method: type, parameters: parameters,encoding: URLEncoding.default, headers: headers).responseJSON { response in
                
                self.removeActivityIndicatorOnTopView()
                
                guard let data = response.data else { return }
                
                switch response.result {
          
                case .success(_):
                do {
                    let jsonData = data
                    let decodedResponse = try JSONDecoder().decode(T.self, from: jsonData)
                    completion(ResultType.Success(decodedResponse))
                } catch DecodingError.dataCorrupted(let context) {
                    completion(ResultType.Failure(e: DecodingError.dataCorrupted(context)))
                } catch DecodingError.keyNotFound(let key, let context) {
                    completion(ResultType.Failure(e: DecodingError.keyNotFound(key, context)))
                } catch DecodingError.typeMismatch(let type, let context) {
                    completion(ResultType.Failure(e: DecodingError.typeMismatch(type, context)))
                } catch DecodingError.valueNotFound(let value, let context) {
                    completion(ResultType.Failure(e: DecodingError.valueNotFound(value, context)))
                } catch {
                    completion(ResultType.Failure(e:JSONDecodingError.unknownError))
                }
                case .failure(let error):
                  completion(ResultType.Failure(e: error))
                }
            }
        } else {
            DispatchQueue.main.async {
                self.removeActivityIndicatorOnTopView()
                CommonFunctionality.displayErrorAlert()
                completion(ResultType.Failure(e: nil))
            }
        }
    }
    
    func addActivityIndicatorOnTopView() {
        
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        if let topController = keyWindow?.rootViewController {
            CommonFunctionality.addActivityIndicator(StringConstants.loading.rawValue, topController)
        }
        
    }
    
    func removeActivityIndicatorOnTopView() {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            
            if let topController = keyWindow?.rootViewController {
                CommonFunctionality.removeActivityIndicator(topController)
            }
        }
    }

    func callProductsListService(_ successHandler: @escaping ([Product]?) -> Void, _ failureHandler: @escaping (String) -> Void) {

        let headers: HTTPHeaders = [.defaultUserAgent]
        
        request(headers: headers, endpoint: Endpoint.getProducts, type: .get, parameters: [:]) { (itemsResponse: ResultType<[Product]?>) in
               
               switch itemsResponse  {
               case .Success(let itemsResponse):
                   successHandler(itemsResponse)
                   
               case .Failure(let error):
                failureHandler(error?.localizedDescription ?? "Network Not Available")
               }
           }
       }
    
    func setupReachability() {
        stopNotifier()
        do {
            self.reachability = try! Reachability()
            
            reachability?.whenReachable = { reachability in
                
            }
            reachability?.whenUnreachable = { reachability in
                
            }
        }
        startNotifier()
    }
    
    func startNotifier() {
        do {
            try reachability?.startNotifier()
        } catch {
            return
        }
    }
    
    func stopNotifier() {
        reachability?.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
        reachability = nil
    }
    
    
    deinit {
        stopNotifier()
    }
}
