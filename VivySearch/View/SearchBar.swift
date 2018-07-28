//
//  SearchBar.swift
//  VivySearch
//
//  Created by Anuraag Shakya on 27.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

protocol SearchActionDelegate {
    func searchBarDidRequestSearchFor(string: String)
}

class SearchBar: UISearchBar {
    var searchActionDelegate: SearchActionDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.delegate = self
    }
}

extension SearchBar: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        searchActionDelegate?.searchBarDidRequestSearchFor(string: searchText)
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
