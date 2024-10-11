//
//  CountrieListViewController.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import UIKit

class CountrieListViewController: BaseViewController {

    @IBOutlet weak var CountrieListTableView: UITableView!
    
    // Create inital countrie Lists data
    var countrieLists = [CountrieListModel]()
    
    //  filtered Countrie Lists by search results
    var filteredCountrieLists: [CountrieListModel] = []
    
    // Search controller
    let searchController = UISearchController(searchResultsController: nil)
    
    // text entered
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }

    // serch active or not
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Title
        title = NSLocalizedString("Countrie List", comment: "ListViewController: Set screen header title")
        
        // Hide back button
        navigationItem.setHidesBackButton(true, animated: true)
        
        setUpNavigationBar()
        setBackgroundImage_Gradient_Light(view: self.view)
        
        // Show home button
        createNavigationBarButton()
        
        // configure TableView
        configureListTableView()
        
        // configure Search Bar
        configureSearchBar()
    }
    
    // configure Search Bar
    func configureSearchBar() {
        // Inform this class of any text changes in search bar
        searchController.searchResultsUpdater = self
        // We don’t want to obscure anything
        searchController.obscuresBackgroundDuringPresentation = false
        // Place holder
        searchController.searchBar.placeholder = "Search Countrie"
        // Set to navigation
        navigationItem.searchController = searchController
        //  Visible for this view contoller only
        definesPresentationContext = true
    }
    
    // Home button at the top right corner on the navigation bar
    func createNavigationBarButton() {
        let mapButton = UIButton(type: .custom)
        mapButton.setImage(UIImage(named: ""), for: .normal)
        mapButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        mapButton.addTarget(self, action: #selector(showHomeView), for: .touchUpInside)
        mapButton.accessibilityIdentifier = "NAVIGATION_HOME_BUTTON"
        mapButton.accessibilityLabel = "HOME"
        mapButton.setTitleColor(UIColor.orange, for: .normal)
        mapButton.setTitle("Home", for: .normal)
        let navBarButtonItem = UIBarButtonItem(customView: mapButton)
        navigationItem.setRightBarButtonItems([navBarButtonItem], animated: true)
    }
    
    // Show Map view controller
    @objc
    func showHomeView() {
        print("Home button clicked")
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredCountrieLists = countrieLists.filter { (countrieListModel: CountrieListModel) -> Bool in
        return countrieListModel.name.lowercased().contains(searchText.lowercased()) ||
            countrieListModel.capital.lowercased().contains(searchText.lowercased())
      }
      
        CountrieListTableView.reloadData()
    }

}

// MARK: - UITableView Delegate
// Extensions for table view Delegate and Data source
extension CountrieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureListTableView() {
        //Set delegate and data source
        CountrieListTableView.delegate = self
        CountrieListTableView.dataSource = self
        CountrieListTableView.accessibilityIdentifier = "CountrieListTableView";

        // cell for Countrie Truck list
        CountrieListTableView?.register(UINib(nibName: "CountrieListTableViewCell", bundle: nil), forCellReuseIdentifier: "CountrieListTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCountrieLists.count
          }
        return countrieLists.count
    }
    
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "CountrieListTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CountrieListTableViewCell {
            let countrieListDataModel: CountrieListModel
            if isFiltering {
                countrieListDataModel = filteredCountrieLists[indexPath.row]
              } else {
                  countrieListDataModel = countrieLists[indexPath.row]
              }
            // Update view function from countrieList cell
            cell.updateCellView(countrieListModel: countrieListDataModel)
            let indexValue = String(format: "%d", indexPath.row)
            cell.accessibilityIdentifier = "CountrieListTableViewCell" + indexValue
            return cell
        } else {
            return CountrieListTableViewCell()
        }
    }
}

// MARK: - UISearchResultsUpdating Delegate
extension CountrieListViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
      let searchBar = searchController.searchBar
      filterContentForSearchText(searchBar.text!)
  }
}
