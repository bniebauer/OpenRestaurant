//
//  MenuItemDetailViewController.swift
//  OpenRestaurant
//
//  Created by Brenton Niebauer on 6/16/21.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    @IBOutlet var itemDetailLabel: UILabel!
    @IBOutlet var addToOrderButton: UIButton!
    
    let menuItem: MenuItem
    
    init?(coder: NSCoder, menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemNameLabel.text = menuItem.name
        itemPriceLabel.text = FormatterController.shared.getStringFormatFor(price: menuItem.price)
        itemDetailLabel.text = menuItem.detailText
        itemImageView.image = UIImage(systemName: "photo")
        addToOrderButton.layer.cornerRadius = 5.0
        
        MenuController.shared.fetchMenuImage(for: menuItem) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.itemImageView.image = image
                case .failure(let error):
                    print("Could not obtain image:\n**\(error)")
                }
            }
            
        }
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        MenuController.shared.order.menuItems.append(menuItem)
    }

}
