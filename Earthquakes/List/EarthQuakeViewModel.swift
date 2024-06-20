//
//  EarthQuakeViewModel.swift
//  Earthquakes
//
//

import Foundation

protocol EarthQuakeViewModelDelegate {
	func receivedEarthquakes()
}

class EarthQuakeViewModel {
	var service: EarthquakesService
	var earthquakes: [Earthquake] = []
	var error: Error?
	var delegate: EarthQuakeViewModelDelegate?
	
	init(service: EarthquakesService) {
		self.service = service
	}
	
	func fetch() {
		service.fetch() { earthquakes, error in
			self.earthquakes = earthquakes
			self.delegate?.receivedEarthquakes()
		}
	}
}
