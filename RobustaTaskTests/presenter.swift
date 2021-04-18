//
//  NetworkingTest.swift
//  RobustaTaskTests
//
//  Created by mac on 17/04/2021.
//

import XCTest
@testable import RobustaTask

class presenter: XCTestCase {
    
    func testWebSevice(){
        ApiService.instance.dataRequest(url:Constants.APIDetails.baseUrl ,objectType: [RepoModel].self, params: nil, method: "Get") { response in
            switch response{
            case .success:
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
                
            }
            
            
        }
        
        
    }
    
    
    
    
}
