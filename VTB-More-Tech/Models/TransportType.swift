//
//  TransportType.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct TransportType : Codable {
	let alias : String?
	let id : Int?
	let title : String?

	enum CodingKeys: String, CodingKey {

		case alias = "alias"
		case id = "id"
		case title = "title"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		alias = try values.decodeIfPresent(String.self, forKey: .alias)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}

}
