//
//	Thumbnail.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Thumbnail : Codable {

	let pathExtension : String?
	let path : String?


	enum CodingKeys: String, CodingKey {
		case pathExtension = "extension"
		case path = "path"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        pathExtension = try values.decodeIfPresent(String.self, forKey: .pathExtension)
		path = try values.decodeIfPresent(String.self, forKey: .path)
	}
    
}

extension Thumbnail{
    func fullString() -> String{
        guard let path = self.path, let pathExtension = self.pathExtension else{return  ""}
        return path + "." + pathExtension
    }
}
