//
//  PetsRouter.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import Foundation
import UIKit

class PetsRouter {

    private static var instance: PetsRouter?
    var baseNavigationVC: UINavigationController?
    static let sharedInstance = PetsRouter()

    func launchApp() {

        let targetVC = PetsViewController()
        self.resetRoot(to: targetVC)
    }

    func resetRoot(to new: UIViewController) {
        let rootVC = UINavigationController(rootViewController: new)
        rootVC.navigationBar.isHidden = false
        let appDlgt = UIApplication.shared.delegate
        appDlgt?.window??.rootViewController = rootVC
        appDlgt?.window??.makeKeyAndVisible()
        self.baseNavigationVC = rootVC
    }
}
