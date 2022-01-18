//
//  A2BCoreTests.swift
//  A2BCoreTests
//
//  Created by Marcelo Bogdanovicz on 08/03/2021.
//

import XCTest
import A2BCore

class A2BCoreTests: XCTestCase {

    func testActiveServiceList() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/linkbeyond/develop/backend/dev/srv/backend/activeservices"
        URLSession.shared.dataTask(with: url, headers: getHeaders(), parameters: getMcParameters()) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    func testUpdateService() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/linkbeyond/qual/backend/dev/srv/backend/updateservicestatus"
        URLSession.shared.dataTask(with: url, headers: getHeaders(), parameters: getUpdateServiceParameters()) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    private func getUpdateServiceParameters() -> [String: Any] {

        return [
            "activityStepId" : "6193b1a3dbf0d379fa724c68",
            "changeRequestStatus" : "ACTIVE",
            "userAccessRequest" : [
                "lang" : "PT",
                "alternativeLang" : "PT",
                "authToken" : ""
            ]
          ]
    }
    
//    func testFail() throws {
//        let expectation = XCTestExpectation(description: "Get and update user")
//
//        let url = "https://dev.a-to-be.com/linkbeyond/qual/backend/dev/srv/backend/updateservicestatus"
//        URLSession.shared.dataTask(with: url, headers: getHeaders(), parameters: getMcParameters()) { (data: UserActivityStepResponse?, response, statusCode, error) in
//            XCTAssertNil(data)
//            XCTAssertNotNil(error)
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 60)
//    }
    
    private func getMcParameters() -> [String: Any] {
        
        return [
            "activityStepId" : "607d5532ed0fb86da34a7a77",
            "changeRequestStatus" : "ACTIVE",
            "userAccessRequest" : [
                "lang" : "PT",
                "alternativeLang" : "PT",
                "authToken" : ""
            ]
          ]
    }
    
    func testListcard() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/linkbeyond/develop/backend/dev/srv/backend/regionbootstrap"
        URLSession.shared.dataTask(with: url, headers: getHeaders(), parameters: getListcardParameters()) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    func testLogin() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/linkbeyond/qual/gateway/viaverde/app/"
        URLSession.shared.dataTask(with: url, headers: getHeaders(), parameters: ["email": "andreamaralcosta@gmail.com", "password": "P@ssw0rd"]) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    func testPinCardGET() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/linkbeyond/qual/backend/dev/srv/backend/pincard"
        URLSession.shared.dataTask(with: url, method: .get, headers: getHeaders(), parameters: getPinCardParameters()) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    private func getPinCardParameters() -> [String: Any] {
        return [
            "publisher": "MobiE",
            "locationId": "PT+MUV+TACW2244320G0144"
        ]
    }
    
    func testPinCardPOST() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/linkbeyond/qual/backend/dev/srv/backend/pincard"
        URLSession.shared.dataTask(with: url, headers: getHeaders(), parameters: getPinCardPOSTParameters()) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    private func getPinCardPOSTParameters() -> [String: Any] {
        let text = """
        {
          "offer": [
            {
              "offerId": "619e2bf37beaaf3b8b2a5431",
              "location": {}
            }
          ],
          "position": {
            "type": "point",
            "coordinates": [
              [
                [
                  [
                    -9.19768055,
                    38.743217
                  ]
                ]
              ]
            ]
          }
        }
        """
        
        if let data = text.data(using: .utf8) {
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                return json
            }
        }
        
        return ["":""]
    }
    
    private func getListcardParameters() -> [String: Any] {
        return [
//            "lastRegionDate" : 1607624523650000,
            "position" : [
              "type" : "POINT",
              "coordinates" : [
                [
                  [
                    [
                        -9.301880623096839,
                        38.69195369124714
                    ]
                  ]
                ]
              ]
            ]
          ]
    }
    
    private func getHeaders() -> [String: String] {
        return ["Content-Type": "application/json",
                "AppId": "1",
                "userToken": "UNDEFINED",
                "osVersion": "14.4",
                "Connection": "close",
                "VersionName": "2.0.2(1)",
                "type": "UNDEFINED",
                "Merchant": "VIA_VERDE_DEMO",
                "device": "1F6CD888-F004-4E2A-A536-2A0F2E5AFD5E",
                "make": "Apple Inc.",
                "APIKey": "hl09T6PvvfdFAX4hGsMrIIJvktrizRt9",
                "VoiceLang": "PT",
                "communications": "UNDEFINED",
                "osName": "iOS",
                "network": "UNDEFINED",
                "LabelLang": "PT",
                "user": "andreamaralcosta@gmail.com",
                "AppVersion": "1",
                "model": "iPhone",
                "ContentLang": "PT"]
    }
    
    func testDTollingLogin() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/mtolling/services/mtolling/login"
        URLSession.shared.dataTask(with: url, headers: getHeaders(), parameters: ["email": "mbogdanovicz@aubay.com", "password": "gohhos-quxver-3mIzwi"]) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    func testDTollingVehicles() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/mtolling/services/mtolling/vehicles"
        URLSession.shared.dataTask(with: url, method: .get, headers: getDTollingHeaders(), parameters: getVehiclesParameters()) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    private func getVehiclesParameters() -> [String: Any] {
        return [
            "defaultValue": true,
            "vehicleCategory": "default",
            "value": ""
        ]
    }
    
    func testDTollingVersion() throws {
        let expectation = XCTestExpectation(description: "Get and update user")
        
        let url = "https://dev.a-to-be.com/mtolling/os-versions/IOS"
        URLSession.shared.dataTask(with: url, method: .get) { (data: [String: Any]?, response, statusCode, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 60)
    }
    
    private func getDTollingHeaders() -> [String: String] {
        return ["Content-Type": "application/json",
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYm9nZGFub3ZpY3pAYXViYXkuY29tIiwicm9sZXMiOiJST0xFX01PQklMRV9BUFAiLCJpc3MiOiJNVG9sbGluZ0JhY2tlbmQiLCJleHAiOjkyMjMzNzIwMzY4NTQ3NzV9.9fPrv_rmf86yQ2TPyjmqozRN91BtBaROyN2xBVGiEdc"
        ]
    }
}
