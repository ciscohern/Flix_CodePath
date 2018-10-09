//
//  movieCell.swift
//  Flix
//
//  Created by Francisco Hernanedez on 9/6/18.
//  Copyright © 2018 Francisco Hernanedz. All rights reserved.
//

import UIKit

class movieCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    var movie: Movie!{
        didSet {
            posterImageView.af_setImage(withURL: movie.posterUrl!)
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
