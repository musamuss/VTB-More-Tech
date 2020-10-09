//
//  CarRenderPhotos.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import Foundation

struct CarRenderPhotos : Codable {
	let render_main : CarPhotos?
	let main : CarPhotos?
	let render_widget_right : CarPhotos?
	let render_side : CarPhotos?

	enum CodingKeys: String, CodingKey {

		case render_main = "render_main"
		case main = "main"
		case render_widget_right = "render_widget_right"
		case render_side = "render_side"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		render_main = try values.decodeIfPresent(CarPhotos.self, forKey: .render_main)
		main = try values.decodeIfPresent(CarPhotos.self, forKey: .main)
		render_widget_right = try values.decodeIfPresent(CarPhotos.self, forKey: .render_widget_right)
		render_side = try values.decodeIfPresent(CarPhotos.self, forKey: .render_side)
	}

}
