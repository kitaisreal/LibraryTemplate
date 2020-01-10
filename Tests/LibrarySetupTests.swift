//
//  LibraryTemplate.swift
//  LibraryTemplate
//
//  Created by Kita, Maksim on 12/29/19.
//  Copyright © 2019 Kita, Maksim. All rights reserved.
//

import XCTest
@testable import LibraryTemplate

class LibrarySetupTests: XCTestCase {

    func testGetPlatform() {
        let actual = LibraryTest.getPlatform()
        let expected = getPlatform()
        XCTAssertEqual(actual, expected)
    }

    private func getPlatform() -> String {
        let platform: String

        #if os(macOS)
            platform = "macOS"
        #elseif os(iOS)
            platform = "iOS"
        #elseif os(tvOS)
            platform = "tvOS"
        #elseif os(watchOS)
            platform = "watchOS"
        #endif

        return platform
    }
}
