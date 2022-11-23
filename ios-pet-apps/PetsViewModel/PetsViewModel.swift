//
//  PetsViewModel.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import Foundation

class PetsViewModel {

    var delegate: PetsProtocolDelegate?

    init(delegate: PetsProtocolDelegate? = nil) {
        self.delegate = delegate
    }

    func parsedData() {
        let jsonParserService = JsonParserService()
        if let data = jsonParserService.parseData(fileName: Constants.petsFileName,
                                                  withExtension: Constants.fileExtension) {
            self.delegate?.successData(data: data)
        }
    }
}
