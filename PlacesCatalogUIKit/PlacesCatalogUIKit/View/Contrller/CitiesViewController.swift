//
//  CitiesViewController.swift
//  PlacesCatalogUIKit
//
//  Created by Shrinivas Kalshetty on 11/09/24.
//

import UIKit


class CitiesViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var floatingBtn: UIButton!
    
    lazy var searchBar: UISearchBar = UISearchBar()
    let viewModel = CitiesViewModel()
    let debouncer = Debouncer(delay: 0.5)
    var isCitieHeader: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupFloatingButton()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupSearchBar()
        setupTblView()
        fetchData()
    }

    private func fetchData() {
        viewModel.loadData()
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            if !self.isCitieHeader {
                self.isCitieHeader.toggle()
                self.setTableViewHeader()
            }
        }
    }
    
    private func setupTblView() {
        tableView.register(UINib(nibName: HeaderTableCell.identifier, bundle: nil), forCellReuseIdentifier: HeaderTableCell.identifier)
        tableView.register(UINib(nibName: PlaceTableCell.identifier, bundle: nil), forCellReuseIdentifier: PlaceTableCell.identifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorInset = .zero
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = Constants.search
        searchBar.sizeToFit()
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        }
        searchBar.delegate = self
        searchBar.searchTextField.delegate = self
    }
    
    private func setupFloatingButton() {
        floatingBtn.layer.cornerRadius = floatingBtn.frame.height / 2
        floatingBtn.addShadow()
    }
    
    @IBAction func floatingBtnTapped(_ sender: UIButton) {
        let vc = DetailViewController.loadFromNib()
        vc.statisticsCombinedStr = viewModel.getStatistiCombinedStr()
        vc.modalPresentationStyle = .overCurrentContext
        navigationController?.present(vc, animated: true)
    }
}
