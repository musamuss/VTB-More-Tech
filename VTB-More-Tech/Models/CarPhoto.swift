//
//  CarPhoto.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct CarPhoto : Codable {
	let path : String?
	let width : Int?
	let height : Int?

	enum CodingKeys: String, CodingKey {

		case path = "path"
		case width = "width"
		case height = "height"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		path = try values.decodeIfPresent(String.self, forKey: .path)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
	}

}
