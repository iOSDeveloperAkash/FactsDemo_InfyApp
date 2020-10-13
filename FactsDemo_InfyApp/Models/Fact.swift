//
//  Created by Akash on 11/10/20.
//  Copyright © 2020 FactsDemo_InfyApp. All rights reserved.
//

import Foundation

struct Fact : Codable {

	let rows : [Row]?
	let title : String?

	enum CodingKeys: String, CodingKey {
		case rows = "rows"
		case title = "title"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rows = try values.decodeIfPresent([Row].self, forKey: .rows)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}


}
