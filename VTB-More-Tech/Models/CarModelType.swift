//
//  CarModelType.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct CarModelType : Codable {
	let titleRus : String?
	let prefix : String?
	let alias : String?
	let id : Int?
	let title : String?
	let absentee : Bool?

	enum CodingKeys: String, CodingKey {

		case titleRus = "titleRus"
		case prefix = "prefix"
		case alias = "alias"
		case id = "id"
		case title = "title"
		case absentee = "absentee"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		titleRus = try values.decodeIfPresent(String.self, forKey: .titleRus)
		prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
		alias = try values.decodeIfPresent(String.self, forKey: .alias)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		absentee = try values.decodeIfPresent(Bool.self, forKey: .absentee)
	}

}
