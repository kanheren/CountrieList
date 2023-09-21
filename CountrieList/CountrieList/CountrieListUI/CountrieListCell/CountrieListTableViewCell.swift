//
//  CountrieListTableViewCell.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import UIKit

class CountrieListTableViewCell: UITableViewCell {

    @IBOutlet weak var countrieNameWithRegion: UILabel!
    @IBOutlet weak var CountrieCode: UILabel!
    @IBOutlet weak var CountrieCapital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCellView(countrieListModel: CountrieListModel) {
        countrieNameWithRegion.text = countrieListModel.name + ", " + countrieListModel.region
        CountrieCode.text = countrieListModel.code
        CountrieCapital.text = countrieListModel.capital
    }
}
