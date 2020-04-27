//
//  NetworkLayerProjectTests.swift
//  NetworkLayerProjectTests
//
//  Created by mcs on 4/16/20.
//  Copyright © 2020 mcs. All rights reserved.
//

import XCTest
@testable import NetworkLayerProject

class NetworkLayerProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    var sut: ViewModel!
      
      
      override func setUp() {
        super.setUp()
        sut = ViewModel()
      }
      
      override func tearDown() {
        sut = nil
        super.tearDown()
      }
//      
//      func testNumberOfEpisodesBeforeGettingAnEpisode() {
//        let expectedValue = 0
//        XCTAssertEqual(expectedValue, sut.numberOfEpisodes())
//      }
//      
//      func testNumberOfEpisodesFromMockSession() {
//        let newEpisode = Episode()
//        let newEpisodeContainer = EpisodeContainer(array: [newEpisode])
//        let newEpisodeContainerData = try! JSONEncoder().encode(newEpisodeContainer)
//       
//        sut.getData(session: MockSession(data: newEpisodeContainerData)) {
//          XCTAssertEqual(self.sut.numberOfEpisodes(), 1)
//        }
//      }
//      func testIfCompletiongHandlerReturnsEmpty() {
//        //let newEpisode = Episode()
//        let newEpisodeContainer = EpisodeContainer(array: [])
//        let newEpisodeContainerData = try! JSONEncoder().encode(newEpisodeContainer)
//        //let emptyContainer = nil
//        
//        sut.getData(session: MockSession(data: newEpisodeContainerData)) {
//          XCTAssertEqual(self.sut.numberOfEpisodes(), 0)
//        }
//      }
//      
//      
//      func testNumberOfEpisodesAfterCallingAPI() {
//        let newEpisodesExpectation = expectation(description: "")
//        
//        sut.getData(session: URLSession.shared) {
//          XCTAssertEqual(self.sut.numberOfEpisodes(), 236)
//          newEpisodesExpectation.fulfill()
//        }
//        waitForExpectations(timeout: 2, handler: nil)
//      }
//      
//      func testEpisodeAtIndex() {
//        let newEpisode = Episode()
//        let newEpisodeContainer = EpisodeContainer(array: [newEpisode])
//        let newEpisodeContainerData = try! JSONEncoder().encode(newEpisodeContainer)
//        
//        sut.getData(session: MockSession(data: newEpisodeContainerData)) {
//          //XCTAssertEqual(self.sut.numberOfEpisodes(), 1)
//          let newEpisode = self.sut.episode(for: 0)
//          let airDate = newEpisode.airDate
//          let airStamp = newEpisode.airStamp
//          let name = newEpisode.airStamp
//          let runTime = newEpisode.runtime
//          let summary = newEpisode.summary
//          let image = newEpisode.image
//
//          
//          let originalEpisode = Episode()
//          let originalAirDate = originalEpisode.airDate
//          let originalAirStamp = originalEpisode.airStamp
//          let originalName = originalEpisode.airStamp
//          let originalRunTime = originalEpisode.runtime
//          let originalSummary = originalEpisode.summary
//          let originalImage = originalEpisode.image
//          
//          XCTAssertEqual(originalAirDate, airDate)
//          XCTAssertEqual(originalAirStamp, airStamp)
//          XCTAssertEqual(originalName, name)
//          XCTAssertEqual(originalRunTime, runTime)
//          XCTAssertEqual(originalSummary, summary)
//          XCTAssertEqual(originalImage, image)
//          
//        }
//      }
//
//     
//      func testGetNewEpisodeOfFriends() {
//        sut.getTDDData {
//          XCTAssert(self.sut.episode(for: 0).name.contains("fishing"))
//        }
//      }
//      
//      
//    }
}

    struct MockSession: Session {
      let data: Data?

      func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
        completion?(data, nil)
      }
    }

