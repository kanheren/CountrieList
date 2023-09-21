//
//  ViewController.swift
//  CountrieList
//
//  Created by Nandkishore Kanhere on 9/20/23.
//

import UIKit

protocol ViewController_ViewControllerProtocol: AnyObject {
    func countrieListResponse(countrieListResponse: [CountrieList.Response])
}

class ViewController: UIViewController, ViewController_ViewControllerProtocol {

    var countrieListArray = [CountrieList.Response]()
    var presenter: ViewController_PresenterProtocol?
    
    var landscapeConstraints: [NSLayoutConstraint] = []
    @IBOutlet var IBConstraints: [NSLayoutConstraint]!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        presenter = ViewController_Presenter(self)
        presenter?.fatchCountrieListsData()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.orientationChanged),
                                               name: UIApplication.didChangeStatusBarOrientationNotification,
                                               object: nil)

        applyPortraitConstraints()
    }
    
    @objc func orientationChanged(notification: NSNotification) {
            let deviceOrientation = UIApplication.shared.statusBarOrientation

            switch deviceOrientation {
            case .portrait:
                fallthrough
            case .portraitUpsideDown:
                print("Portrait")
                applyPortraitConstraints()

            case .landscapeLeft:
                fallthrough
            case .landscapeRight:
                print("landscape")
                applyLandscapeConstraints()
            case .unknown:
                print("unknown orientation")
            @unknown default:
                print("unknown case in orientation change")
            }
    }
    
    func applyLandscapeConstraints() {
       // NSLayoutConstraint.deactivate(IBConstraints)
    }
    
    func applyPortraitConstraints() {
        NSLayoutConstraint.deactivate(landscapeConstraints)
        view.addConstraints(IBConstraints)
    }
    
    func countrieListResponse(countrieListResponse: [CountrieList.Response]) {
        self.countrieListArray = countrieListResponse
    }

    // launch Countrie list View
    fileprivate func launchCountrieListView() {
        
        var tempCountrieListArray = [CountrieListModel]()
        
        for countrieList in countrieListArray {
            let tempCountrieList = CountrieListModel(name: countrieList.name,
                                                     region: countrieList.region,
                                                     code: countrieList.code,
                                                     capital: countrieList.capital,
                                                     flag: countrieList.flag)
            tempCountrieListArray.append(tempCountrieList)
        }
        
        if !tempCountrieListArray.isEmpty {
            //launch Countrie list view location
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "CountrieListView") as? CountrieListViewController
            if let vc = viewController {
                if !tempCountrieListArray.isEmpty {
                    vc.countrieLists = tempCountrieListArray
                }
                self.navigationController?.show(vc, sender: nil)
            }
        } else {
            showErrorMessage()
        }
    }
    
    fileprivate func showErrorMessage() {
        let alert = UIAlertController(title: "Countrie List", message: "\nNo FCountrie List NOT avalible, please try again later.",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func onDisplayTapped(_ sender: Any) {
        
        print("User selected: onDisplayTapped")
        
        launchCountrieListView()
    }
}

