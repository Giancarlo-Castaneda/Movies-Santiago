import UIKit
import Nuke

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "cell"
    
    func configureCell(movie: PopularMoviesResult) {
        myLabel.text = movie.title
        let url = "https://image.tmdb.org/t/p/w500" + (movie.posterPath ?? "")
        Nuke.loadImage(with: url, into: imageView)
    }
}
