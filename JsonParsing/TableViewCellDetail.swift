//
//  TableViewCellDetail.swift
//  JsonParsing
//
//  Created by Vijay Parmar on 28/10/20.
//

import UIKit

class TableViewCellDetail: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAge: UILabel!
    
    @IBOutlet weak var lblEmp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
