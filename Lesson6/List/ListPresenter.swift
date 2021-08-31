//
//  ListPresenter.swift
//  Lesson6
//
//  Created by Matthew on 31.08.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

final class ListPresenter {
    weak var view: ListViewInput?
    var router: ListRouterInput?
    var interactor: ListInteractorInput?
    var artists: [Artist] = []
}

extension ListPresenter: ListViewOutput {
    func viewIsReady() {
        interactor?.obtainArtists()
    }
    
    var listCount: Int {
        artists.count
    }
    
    func obtainArtist(atIndex: Int) -> Artist? {
        if artists.indices.contains(atIndex) {
            return artists[atIndex]
        } else {
            return nil
        }
    }
    
    func onListItemClick(_ index: Int) {
        router?.gotoDetails(id: index)
    }
}

extension ListPresenter: ListInteractorOutput {
    func updateArtists(_ artists: [Artist]) {
        DispatchQueue.main.async {
            self.artists = artists
            self.view?.reloadData()
        }
    }
}
