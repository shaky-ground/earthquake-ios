//
//  EarthquakesService.swift
//  Earthquakes
//
//

import Foundation

class EarthquakesService {
	var urlSession = URLSession.shared
	
	func fetch(_ completion: (([Earthquake], Error?) -> Void)?) {
		let url = URL(string: "https://barfooz.net/earthquakes")!
		let urlRequest = URLRequest(url: url)
		urlSession.dataTask(with: urlRequest) { data, response, error in
			guard let data else {
				return
			}
			
			do {
				let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
				let features = json?["features"] as? [[String: Any]]
				let earthquakes = features?.map { Earthquake(json: $0) } ?? []
				completion?(earthquakes, nil)
			} catch {
				completion?([], error)
			}
		}
		.resume()
	}
}
