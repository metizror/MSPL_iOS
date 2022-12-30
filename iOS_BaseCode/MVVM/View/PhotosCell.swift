//
//  PhotosCell.swift

import UIKit

class PhotosCell: UICollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!

    var imageObj:ImagesData? {
        didSet{
            self.updateUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        self.imgView.image = nil
    }
    
    func updateUI(){
        guard let imageObj else {return}
        if let imageStringUrl = imageObj.userImageURL {
            self.imgView.loadImage(urlString: imageStringUrl)
        }
    }

}
