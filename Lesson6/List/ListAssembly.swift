//
//  ListAssembly.swift
//  Lesson6
//
//  Created by Matthew on 31.08.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import UIKit

class ListAssembly {
    static func assemble() -> UIViewController {
      let view = ListViewController()
      let presenter = ListPresenter()
      let networkService = NetworkService()
      let interactor = ListInteractor(networkService: networkService)
      let router = ListRouter()

      view.presenter = presenter
      presenter.view = view
      presenter.router = router
      presenter.interactor = interactor
      interactor.output = presenter
      router.view = view

      return view
    }
}
