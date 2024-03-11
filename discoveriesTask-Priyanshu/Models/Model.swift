struct Item: Codable {
    let date: String
    let items: [NestedItem]
}

struct NestedItem: Codable {
    let title: String
    let type: String
    let location: String
    let imageName: String
}
