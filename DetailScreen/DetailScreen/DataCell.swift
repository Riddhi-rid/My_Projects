//
//  DataCell.swift
//  DetailScreen
//
//  Created by admin on 03/10/24.
//

import UIKit

class DataCell: UITableViewCell {


    @IBOutlet weak var SetLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    
    @IBOutlet weak var punchlineLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
