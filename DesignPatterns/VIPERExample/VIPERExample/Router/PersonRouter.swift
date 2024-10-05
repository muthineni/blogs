//
//  PersonRouter.swift
//  VIPERExample
//
//  Created by Sridhar Muthineni on 13/09/2024.
//

import UIKit

protocol PersonRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

class PersonRouter: PersonRouterProtocol {
    static func createModule() -> UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PersonViewController") as! PersonViewController
        
        let interactor = PersonInteractor()
        let presenter = PersonPresenter(view: viewController, interactor: interactor)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
