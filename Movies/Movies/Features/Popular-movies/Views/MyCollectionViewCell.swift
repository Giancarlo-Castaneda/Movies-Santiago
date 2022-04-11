import UIKit
import Kingfisher

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "cell"
    
    func configureCell(movie: PopularMoviesResult) {
        let url = "https://image.tmdb.org/t/p/w500" + (movie.posterPath ?? "")
        if let URL = URL(string: url) {
            let process = DownsamplingImageProcessor(size: imageView.bounds.size)
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: URL, placeholder: nil, options: [.processor(process)], completionHandler: nil)
        }
        contentView.backgroundColor = UIColor.red
    }
}
