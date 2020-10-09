//
//  API.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct Car : Codable {
	let titleRus : String?
	let country : Country?
	let isOutbound : Bool?
	let alias : String?
	let logo : String?
	let id : Int?
	let title : String?
	let absentee : Bool?
	let currentModelsTotal : Int?
	let currentCarCount : Int?
	let models : [CarModel]?
	let generations : [String]?

	enum CodingKeys: String, CodingKey {

		case titleRus = "titleRus"
		case country = "country"
		case isOutbound = "isOutbound"
		case alias = "alias"
		case logo = "logo"
		case id = "id"
		case title = "title"
		case absentee = "absentee"
		case currentModelsTotal = "currentModelsTotal"
		case currentCarCount = "currentCarCount"
		case models = "models"
		case generations = "generations"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		titleRus = try values.decodeIfPresent(String.self, forKey: .titleRus)
		country = try values.decodeIfPresent(Country.self, forKey: .country)
		isOutbound = try values.decodeIfPresent(Bool.self, forKey: .isOutbound)
		alias = try values.decodeIfPresent(String.self, forKey: .alias)
		logo = try values.decodeIfPresent(String.self, forKey: .logo)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		absentee = try values.decodeIfPresent(Bool.self, forKey: .absentee)
		currentModelsTotal = try values.decodeIfPresent(Int.self, forKey: .currentModelsTotal)
		currentCarCount = try values.decodeIfPresent(Int.self, forKey: .currentCarCount)
		models = try values.decodeIfPresent([CarModel].self, forKey: .models)
		generations = try values.decodeIfPresent([String].self, forKey: .generations)
	}

}
