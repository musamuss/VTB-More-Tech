//
//  CarBody.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct CarBody : Codable {
	let doors : Int?
	let alias : String?
	let photo : String?
	let typeTitle : String?
	let type : String?
	let title : String?

	enum CodingKeys: String, CodingKey {

		case doors = "doors"
		case alias = "alias"
		case photo = "photo"
		case typeTitle = "typeTitle"
		case type = "type"
		case title = "title"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		doors = try values.decodeIfPresent(Int.self, forKey: .doors)
		alias = try values.decodeIfPresent(String.self, forKey: .alias)
		photo = try values.decodeIfPresent(String.self, forKey: .photo)
		typeTitle = try values.decodeIfPresent(String.self, forKey: .typeTitle)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}

}
