//
//  ListRouter.swift
//  Lesson6
//
//  Created by Matthew on 31.08.2021.
//  Copyright © 2021 Alex Apriamashvili. All rights reserved.
//

import UIKit

final class ListRouter {
    weak var view: UIViewController?
}

extension ListRouter: ListRouterInput {
    func gotoDetails(id: Int) {
        let details = DetailAssembly.assemble(artistId: id)
        view?.navigationController?.pushViewController(details, animated: true)
    }
}
