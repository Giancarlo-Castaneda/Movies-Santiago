import Foundation

class PopularMoviesViewModel {
    private let service: PopularMoviesService
    
    init(service: PopularMoviesService) {
        self.service = service
    }
    
    func fechPopularMovies(callBack: @escaping ([PopularMoviesResult])->Void) {
        service.getPopularMovies { result in
            switch result{
            case .success(let data):
                callBack(data.results ?? [])
            case .failure(_):
                callBack([])
            }
        }
    }
}
