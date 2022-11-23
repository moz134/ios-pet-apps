//
//  PetsProtocol.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import Foundation
import UIKit

/// PetsProtocolDelegate
protocol PetsProtocolDelegate: AnyObject {
    func successData(data: [PetsDataUIModel])
}
