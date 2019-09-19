//
//  SeriesTests.swift
//  SeriesTests
//
//  Created by Salvador Kano on 9/17/19.
//  Copyright © 2019 SalvadorKano. All rights reserved.
//

import XCTest

@testable import Series

class SeriesTests: XCTestCase {



    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAsyncCalbacks() {
       
        
        // 1. Define an expectation
        let expectationObtainToken = expectation(description: "El token se obtiene con exito")
        
        // 2. Exercise the asynchronous code
        let expectationSearcSeries = expectation(description: "Se realizo la busqueda con exito")
       
        LoginService.obtainToken { (token, error, succes) in
            guard let succes = succes else {
                return
            }
            XCTAssertTrue(succes)
            XCTAssertNil(error)
            expectationObtainToken.fulfill()
        }
        SeriesServices.getSearchSeries(byId: "Game") { (lista, error, succes) in
            guard let succes = succes else {
                return
            }
            XCTAssertTrue(succes)
             XCTAssertNil(error)
            expectationSearcSeries.fulfill()
            
        }
        
        // 3. Wait for the expectation to be fulfilled
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    func testValidationText(){
        let textField  = UITextField()
        let text = "julio@gmail.com"
        textField.text = text
        XCTAssertEqual(try textField.validatedText(validationType: .email), text)
    }
    func testAsyncCalback(){
        let expectations = expectation(description: "HOLA")
        let search = SearchViewModel()
         
        SeriesServices.getSearchSeries(byId: "Game") { (lista, error, succes) in
            guard let lista = lista?.data.count else{
                return
            }
            let listaSearc = search.items.count
            XCTAssertEqual(lista, listaSearc)
            expectations.fulfill()
        }
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
