//
//  QuickFeatureDevelopmentAssessmentTests.swift
//  QuickFeatureDevelopmentAssessmentTests
//
//  Created by MCS on 9/4/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//


import XCTest
@testable import QuickFeatureDevelopmentAssessment

class QuickFeatureDevelopmentAssessmentTests: XCTestCase {
  
  var sut: FriendsViewModel!
  
  
  override func setUp() {
    super.setUp()
    sut = FriendsViewModel()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testNumberOfEpisodesBeforeGettingAnEpisode() {
    let expectedValue = 0
    XCTAssertEqual(expectedValue, sut.numberOfEpisodes())
  }
  
  func testNumberOfEpisodesFromMockSession() {
    let newEpisode = Episode()
    let newEpisodeContainer = EpisodeContainer(array: [newEpisode])
    let newEpisodeContainerData = try! JSONEncoder().encode(newEpisodeContainer)
   
    sut.getData(session: MockSession(data: newEpisodeContainerData)) {
      XCTAssertEqual(self.sut.numberOfEpisodes(), 1)
    }
  }
  func testIfCompletiongHandlerReturnsEmpty() {
    //let newEpisode = Episode()
    let newEpisodeContainer = EpisodeContainer(array: [])
    let newEpisodeContainerData = try! JSONEncoder().encode(newEpisodeContainer)
    //let emptyContainer = nil
    
    sut.getData(session: MockSession(data: newEpisodeContainerData)) {
      XCTAssertEqual(self.sut.numberOfEpisodes(), 0)
    }
  }
  
  
  func testNumberOfEpisodesAfterCallingAPI() {
    let newEpisodesExpectation = expectation(description: "")
    
    sut.getData(session: URLSession.shared) {
      XCTAssertEqual(self.sut.numberOfEpisodes(), 236)
      newEpisodesExpectation.fulfill()
    }
    waitForExpectations(timeout: 2, handler: nil)
  }
  
  func testEpisodeAtIndex() {
    let newEpisode = Episode()
    let newEpisodeContainer = EpisodeContainer(array: [newEpisode])
    let newEpisodeContainerData = try! JSONEncoder().encode(newEpisodeContainer)
    
    sut.getData(session: MockSession(data: newEpisodeContainerData)) {
      //XCTAssertEqual(self.sut.numberOfEpisodes(), 1)
      let newEpisode = self.sut.episode(for: 0)
      let airDate = newEpisode.airDate
      let airStamp = newEpisode.airStamp
      let name = newEpisode.airStamp
      let runTime = newEpisode.runtime
      let summary = newEpisode.summary
      let image = newEpisode.image

      
      let originalEpisode = Episode()
      let originalAirDate = originalEpisode.airDate
      let originalAirStamp = originalEpisode.airStamp
      let originalName = originalEpisode.airStamp
      let originalRunTime = originalEpisode.runtime
      let originalSummary = originalEpisode.summary
      let originalImage = originalEpisode.image
      
      XCTAssertEqual(originalAirDate, airDate)
      XCTAssertEqual(originalAirStamp, airStamp)
      XCTAssertEqual(originalName, name)
      XCTAssertEqual(originalRunTime, runTime)
      XCTAssertEqual(originalSummary, summary)
      XCTAssertEqual(originalImage, image)
      
    }
  }

 
  func testGetNewEpisodeOfFriends() {
    sut.getTDDData {
      XCTAssert(self.sut.episode(for: 0).name.contains("fishing"))
    }
  }
  
  
}

struct MockSession: Session {
  let data: Data?

  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
    completion?(data, nil)
  }
}

