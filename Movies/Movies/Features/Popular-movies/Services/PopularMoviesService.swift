import Foundation

class PopularMoviesService {
    
    var semaphore = DispatchSemaphore (value: 0)
    
    func getPopularMovies(callBack: @escaping (Result<PopularMoviesModel,Error>)->Void) {

            var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=78b22d2eba5c5dd6518c53cd3e7ade6c&language=en-US&page=1")!,timeoutInterval: Double.infinity)
            request.httpMethod = "GET"

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data1 = data else {
                    print(String(describing: error))
                    if let err = error{
                        callBack(.failure(err))
                    }
                    self.semaphore.signal()
                    return
                }
                do {
                    let model = try JSONDecoder().decode(PopularMoviesModel.self, from: data1)
                    callBack(.success(model))
                } catch {
                    print("error while parsing getPopularMovies::", error)
                    callBack(.failure(error))
                }
                self.semaphore.signal()
            }

            task.resume()
            semaphore.wait()
        }
}
