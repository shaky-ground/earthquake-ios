//
//  Earthquake.swift
//  Earthquakes
//
//

import Foundation

class Earthquake {
	internal init(title: String? = nil, magnitude: Double? = nil, date: Date? = nil) {
		self.title = title
		self.magnitude = magnitude
		self.date = date
	}
	
	var title: String?
	var magnitude: Double?
	var date: Date?
	
	init(json: [String: Any]) {
		let properties = json["properties"] as? [String: Any]
		self.title = properties?["title"] as? String
		self.magnitude = properties?["mag"] as? Double
		if let timeInMilliseconds = properties?["time"] as? TimeInterval {
			self.date = Date(timeIntervalSince1970: timeInMilliseconds / 1_000)
		}
	}
}
