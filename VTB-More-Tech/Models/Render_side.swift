//
//  Render_side.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct Render_side : Codable {
	let wagon : CarPhoto?
	let sedan : Sedan?
	let liftbek : Liftbek?
	let hatchback : Hatchback?

	enum CodingKeys: String, CodingKey {

		case wagon = "wagon"
		case sedan = "sedan"
		case liftbek = "liftbek"
		case hatchback = "hatchback"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wagon = try values.decodeIfPresent(CarPhoto.self, forKey: .wagon)
		sedan = try values.decodeIfPresent(Sedan.self, forKey: .sedan)
		liftbek = try values.decodeIfPresent(Liftbek.self, forKey: .liftbek)
		hatchback = try values.decodeIfPresent(Hatchback.self, forKey: .hatchback)
	}

}
