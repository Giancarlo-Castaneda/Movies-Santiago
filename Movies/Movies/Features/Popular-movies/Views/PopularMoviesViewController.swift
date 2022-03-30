import UIKit

class PopularMoviesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var array: [PopularMoviesResult]? = []
    
    let viewModel = PopularMoviesViewModel(service: PopularMoviesService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        getPopularData()
    }
    
    private func getPopularData() {
        viewModel.fechPopularMovies{ movies in
            self.array = movies
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension PopularMoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        let item = array![indexPath.row]
        cell.configureCell(movie: item)
        return cell
    }
}
