import Foundation

// MARK: - PopularMoviesModel

struct PopularMoviesModel: Codable {
    let page: Int?
    let results: [PopularMoviesResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
