//
//  JsonParserService.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import Foundation

class JsonParserService {

    func parseData(fileName: String, withExtension: String) -> [PetsDataUIModel]? {
        let pathUrl = Bundle.main.url(forResource: fileName, withExtension: withExtension)
        if let path = pathUrl {
            do {
                let data = try Data(contentsOf: path)
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(PetsResponseModel.self, from: data)
                var uimodel: [PetsDataUIModel] = []
                for item in jsonData.pets {
                    uimodel.append(PetsDataUIModel(imageURL: item.imageURL, title: item.title, contentURL: item.contentURL))
                }
                return uimodel
            } catch {
                print("Error is parsing")
            }
        }
        return nil
    }
}


class CheckWorkingHours {
    static func checkForWorkingHours() -> Bool {
        let url = Bundle.main.url(forResource: "config", withExtension: "json")
        print(url)
        if let url = url {
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let openingTimings = try jsonDecoder.decode(OpeningTimingResponse.self, from: data)
                let response = openingTimings.settings.workHours
                let pattern = Constants.openingHoursRegex
                let regex = try! NSRegularExpression(pattern: pattern)
                if let match = regex.matches(in: response, range: .init(response.startIndex..., in: response)).first,
                   match.numberOfRanges == 3 {
                    match.numberOfRanges
                    let start = match.range(at: 1)
                    print(response[Range(start, in: response)!])
                    let startTime = response[Range(start, in: response)!]
                    let startTimeInSeconds = String(startTime).secondFromString
                    let end = match.range(at: 2)
                    print(response[Range(end, in: response)!])
                    let endTime = response[Range(end, in: response)!]
                    let endTimeInSeconds = String(endTime).secondFromString
                    let calender = Calendar.current
                    let dateComponets = calender.dateComponents([.hour], from: Date())
                    if let hour = dateComponets.hour {
                        let hoursInSeconds = hour * 60 * 60
                        if hoursInSeconds >= startTimeInSeconds && hoursInSeconds <= endTimeInSeconds {
                            return true
                        } else {
                            return false
                        }
                    }
                }

            } catch {
                print("Opening hours are not fetched")
                return false
            }
        }
        return false
    }
}
