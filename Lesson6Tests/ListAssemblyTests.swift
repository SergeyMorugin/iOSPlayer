//
//  ListAssemblyTests.swift
//  Lesson6Tests
//
//  Created by Matthew on 31.08.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import XCTest
@testable import Lesson6

final class ListAssemblyTests: XCTestCase {

    func testViewAssembly() {
        let controller = ListAssembly.assembly()
        XCTAssert(controller is ListViewController)

        let sut = controller as! ListViewController

        XCTAssertNotNil(sut.dataHandler)
        XCTAssertNotNil(sut.output)
    }

    func testPresenterAssembly() {
        let presenter = (ListAssembly.assembly() as! ListViewController).output
        XCTAssert(presenter is ListPresenter)

        let sut = presenter as! ListPresenter

        XCTAssertNotNil(sut.interactor)
        XCTAssertNotNil(sut.router)
        XCTAssertNotNil(sut.view)
    }

    func testInteractorAssembly() {
        let presenter = (ListAssembly.assembly() as! ListViewController).output
        let interactor = (presenter as! ListPresenter).interactor
        XCTAssert(interactor is ListInteractor)

        let sut = interactor as! ListInteractor
        XCTAssertNotNil(sut.output)
    }

    func testRouterAssembly() {
        let presenter = (ListAssembly.assembly() as! ListViewController).output
        let router = (presenter as! ListPresenter).router

        XCTAssert(router is ListRouter)

        let sut = router as! ListRouter
        XCTAssertNotNil(sut.view)
    }
}
