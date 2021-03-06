//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Angel Buenrostro on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell, BookTableViewCellDelegate {
    
    var book: Book?

    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBAction func checkButtonTapped(_ sender: UIButton!) {
        print("Check toggled")
       delegate?.toggleHasBeenRead(for: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews(){
        guard let book = book else { return }
        bookLabel.text = book.title
        let image = book.hasBeenRead ? UIImage(named: "checked.png") as UIImage? : UIImage(named: "unchecked.png") as UIImage?
        checkButton.setImage(image, for: .normal)
    }
    
    
    // Delegate Implemenation
    
    weak var delegate : BookTableViewCellDelegate?
    
    func toggleHasBeenRead(for cell: BookTableViewCell) { // Not sure if any logic is needed in this
        guard let checkButton = cell.checkButton else { return }
        let image = UIImage(named: "checked.png")
        checkButton.setImage(image, for: .normal)
        updateViews()
    }
    

}
