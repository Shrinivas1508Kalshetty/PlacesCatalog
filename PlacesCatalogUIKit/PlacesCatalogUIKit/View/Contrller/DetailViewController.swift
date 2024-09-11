//
//  DetailViewController.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    
    var statisticsCombinedStr: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    static func loadFromNib() -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let statisticsViewController = storyboard.instantiateViewController(withIdentifier: "StatisticsViewController") as! DetailViewController
        return statisticsViewController
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isOpaque = false
        
        titleLbl.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        subtitleLbl.font = UIFont.systemFont(ofSize: 16)
        okBtn.setTitleColor(.white, for: .normal)
        okBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        okBtn.layer.cornerRadius = 5
    }
    
    private func setupData() {
        titleLbl.text = Constants.statistics
        if let str = statisticsCombinedStr {
            subtitleLbl.text = str
        }
    }

    @IBAction func okBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

