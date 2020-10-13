//
//  Created by Akash on 11/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import Foundation

struct Row : Codable {

	let descriptionField : String?
	let imageHref : String?
	let title : String?

	enum CodingKeys: String, CodingKey {
		case descriptionField = "description"
		case imageHref = "imageHref"
		case title = "title"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}


}
