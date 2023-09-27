//
//	Thumbnail.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Thumbnail : Codable {

	let extension : String?
	let path : String?


	enum CodingKeys: String, CodingKey {
		case extension = "extension"
		case path = "path"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		extension = try values.decodeIfPresent(String.self, forKey: .extension)
		path = try values.decodeIfPresent(String.self, forKey: .path)
	}


}