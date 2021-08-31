//
//  ListInteractor.swift
//  Lesson6
//
//  Created by Matthew on 31.08.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import Foundation

final class ListInteractor: ListInteractorInput {
    weak var output: ListInteractorOutput?
    private let networkService: NetworkServiceProtocol
    
    func obtainArtists() {
        networkService.fetchArtists { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(artists):
                self.output?.updateArtists(artists)
            case let .failure(error):
                print(error)
            }
                    
        }
    }
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
