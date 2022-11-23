//
//  PetsRouterTests.swift
//  ios-pet-appsTests
//
//  Created by Md Mozammil on 23/11/22.
//

import XCTest
@testable import ios_pet_apps

final class PetsRouterTests: BaseUnitTest {

    var targetVC = PetsViewController()
    override func setUp() {
        PetsRouter.sharedInstance.baseNavigationVC = UINavigationController.init()
    }

    func testLaunchApp() {
        PetsRouter.sharedInstance.launchApp()
        let topVC = PetsRouter.sharedInstance.baseNavigationVC?.topViewController
        XCTAssert(topVC is PetsViewController)
    }

    func testDetailsVC() {
        self.testLaunchApp()
        sleep(5)
        targetVC.petsList = [PetsDataUIModel(imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Cat_poster_1.jpg/1200px-Cat_poster_1.jpg", title: "Cat", contentURL: "https://en.wikipedia.org/wiki/Cat")]
        targetVC.tableView(targetVC.petsTableView ?? UITableView(), didSelectRowAt: IndexPath.init(row: 0, section: 0))
        sleep(5)
    }
}
