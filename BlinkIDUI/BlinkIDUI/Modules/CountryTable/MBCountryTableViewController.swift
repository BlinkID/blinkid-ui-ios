//
//  MBCountrySelectViewController.swift
//  MicroBlinkUI
//
//  Created by Dino Gustin on 28/08/2018.
//  Copyright © 2018 Dino Gustin. All rights reserved.
//

import MicroBlink

/// Protocol that defines the events that can be received from `MBCountryTableViewController`.
@objc public protocol MBCountryTableViewControllerDelegate: AnyObject {
    /// Method notifies the delegate of the country that was selected through `MBCountryTableViewController`
    ///
    /// - Parameter country: `MBCountry` instance that represents the selected country
    func didSelectCountry(country: MBCountry)

    /// Method request the delegate to provide the last selected country to `MBCountryTableViewController`
    ///
    /// - Returns: `MBCountry` instance that represents the last country that was selected.
    func lastSelectedCountry() -> MBCountry?
}

/// Class that presents a table view containing all the countries allowed by
/// `MBCountryFilter` used.
@objc public class MBCountryTableViewController: UIViewController {
    /// Delegate used to notify the that the country did change
    @objc public weak var delegate: MBCountryTableViewControllerDelegate?
    
    // MARK: - Outlets -
    
    @IBOutlet private weak var _closeButton: UIBarButtonItem! {
        didSet {
            _closeButton.tintColor = UIColor.mb_primaryColor
            _closeButton.title = MBBlinkSettings.sharedInstance.languageSettings.closeText
        }
    }
    @IBOutlet private weak var _countryTableView: UITableView! {
        didSet {
            _setupCountryTableView()

            _countryTableView.delegate = self
            _countryTableView.dataSource = self
        }
    }
    
    // MARK: - Private -
    
    private var _countryListManager: MBCountryListManager! {
        didSet {
            _countryTableView.reloadData()
        }
    }

    private var _lastSelectedCountry: MBCountry! {
        return delegate?.lastSelectedCountry() ?? MBCountry()
    }
    
    private var _searchController: UISearchController?

    // MARK: - Initializer -
    
    /// Initliazer that create the instance of `MBCountryTableViewController` from the storyboard.
    ///
    /// - Parameter delegate: `MBCountryTableViewControllerDelegate` instance
    @objc public class func initFromStoryboard(delegate: MBCountryTableViewControllerDelegate) -> UINavigationController {
        let storyboard = UIStoryboard(name: MBConstants.Name.CountryTableViewController.storyboard, bundle: Bundle(for: self))
        guard let viewController = storyboard.instantiateViewController(withIdentifier: MBConstants.Name.CountryTableViewController.countrySelectIdentifier) as? UINavigationController,
            let selectionViewController = viewController.viewControllers.first as? MBCountryTableViewController else {
                fatalError("Unable to instantiate viewController \(MBConstants.Name.CountryTableViewController.countrySelectIdentifier) from storyboard \(MBConstants.Name.CountryTableViewController.storyboard)")
        }

        selectionViewController.delegate = delegate

        return viewController
    }
    
    // MARK: - Setup -

    private func _setupCountryTableView() {
        _countryTableView.delegate = self
        _countryTableView.dataSource = self

        _countryTableView.keyboardDismissMode = .onDrag
        _countryTableView.sectionIndexColor = UIColor.mb_primaryColor
        _countryTableView.sectionIndexMinimumDisplayRowCount = MBBlinkSettings.sharedInstance.documentChooserSettings.sectionIndexMinimumDisplayRowCount
    }

    private func _setup(searchBar: UISearchBar) {
        searchBar.placeholder = MBBlinkSettings.sharedInstance.languageSettings.searchPlaceholderText
        searchBar.tintColor = UIColor.mb_primaryColor
    }

    private func _setupCountrySearch() {
        if #available(iOS 11, *) {
            // Setup search controller in the navigation bar
            let searchController = UISearchController(searchResultsController: nil)
            
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.dimsBackgroundDuringPresentation = false
            
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            definesPresentationContext = true
            
            _searchController = searchController
            searchController.searchBar.delegate = self
            _setup(searchBar: searchController.searchBar)
        } else {
            // Setup a search bar in the navigation bar
            let searchBarFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: view.frame.width, height: 44))
            let searchBar = UISearchBar(frame: searchBarFrame)
            
            searchBar.delegate = self
            navigationItem.titleView = searchBar
            
            _setup(searchBar: searchBar)
        }
    }

    // MARK: - Lifecycle -
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        _countryListManager = MBCountryListManager()

        navigationItem.title = MBBlinkSettings.sharedInstance.languageSettings.selectCountryTitleText
        navigationController?.navigationBar.tintColor = UIColor.mb_primaryColor

        _setupCountrySearch()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _countryTableView.reloadData()
        _countryTableView.scrollToRow(at: _countryListManager.indexPath(forCountry: _lastSelectedCountry), at: .top, animated: false)
    }

    // MARK: - Actions -
    
    @IBAction private func _didTapCloseButton(_ sender: Any) {
        _countryListManager.resetFilter()
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Filtering -
    
    private func _filterCountryList(withSearchText searchText: String) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            self._countryListManager.filterCountries(withSearchText: searchText)
            
            DispatchQueue.main.async {
                self._countryTableView.reloadData()
                if !searchText.isEmpty, self._countryListManager.numberOfCountries > 0 {
                    self._countryTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                }
            }
        }
    }
}

// MARK: - UITableViewDataSource -

extension MBCountryTableViewController: UITableViewDataSource {

    public func numberOfSections(in _: UITableView) -> Int {
        return _countryListManager.numberOfSections()
    }

    public func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
       return _countryListManager.numberOfRowsInSection(section: section)
    }

    public func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        return _countryListManager.titleFor(section: section)
    }

    public func sectionIndexTitles(for _: UITableView) -> [String]? {
        return _countryListManager.sectionTitles()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let country = _countryListManager.countryFor(indexPath: indexPath)
        // No need for caching, it's fast enough
        let cellConfigurator = MBTableCellConfigurator<MBCountryTableViewCell, MBCountry>(item: country)
        
        let reuseIdentifier = type(of: cellConfigurator).reuseId
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }

        cellConfigurator.configure(cell: cell)
        
        return cell
    }
}

// MARK: - UITableViewDelegate -

extension MBCountryTableViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let searchController = _searchController,
            searchController.isActive {
            searchController.searchBar.endEditing(true)
            searchController.dismiss(animated: false, completion: {
                self._didSelectRow(atIndexPath: indexPath)
            })
        } else {
           _didSelectRow(atIndexPath: indexPath)
        }
    }
        
    private func _didSelectRow(atIndexPath indexPath: IndexPath) {
        let country = _countryListManager.countryFor(indexPath: indexPath)
        _countryListManager.resetFilter()
        delegate?.didSelectCountry(country: country)
        dismiss(animated: true, completion: nil)
    }

    public func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.setHighlighted(_countryListManager.countryFor(indexPath: indexPath).countryCode == _lastSelectedCountry.countryCode, animated: false)
    }

    public func tableView(_: UITableView, willDisplayHeaderView view: UIView, forSection _: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.textColor = UIColor.mb_primaryColor
        }
    }
}

// MARK: - UISearchResultsUpdating -

extension MBCountryTableViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        _filterCountryList(withSearchText: searchText)
    }
}

// MARK: - UISearchBarDelegate -

// This is used for older iOS versions that don't support UISearchController
extension MBCountryTableViewController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        _filterCountryList(withSearchText: searchText)
    }
}
