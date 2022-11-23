//
//  PetsViewController.swift
//  ios-pet-apps
//
//  Created by Md Mozammil on 21/11/22.
//

import UIKit

class PetsViewController: UIViewController {
    @IBOutlet var petsTableView: UITableView?
    var petsList: [PetsDataUIModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if CheckWorkingHours.checkForWorkingHours() {
            self.setUpNavBar()
            self.petsTableView?.delegate = self
            self.petsTableView?.dataSource = self
            let nib = UINib(nibName: "PetsTableViewCell", bundle: nil)
            self.petsTableView?.register(nib, forCellReuseIdentifier: "PetsTableViewCell")
            self.setUpUI()
        } else {
            let alertVC = UIAlertController(title: "Pet Store", message: "Pet store is closed.", preferredStyle: .alert)
            let okActionButton = UIAlertAction(title: "Ok", style: .default)
            alertVC.addAction(okActionButton)
            self.present(alertVC, animated: false)
            return
        }
    }

    func setUpNavBar() {
        self.title = "Pets Information"
        self.navigationController?.navigationBar.isHidden = false
    }

    func setUpUI() {
        let viewModel = PetsViewModel(delegate: self)
        viewModel.parsedData()
    }
}

extension PetsViewController: UITableViewDelegate, UITableViewDataSource, PetsProtocolDelegate {

    func successData(data: [PetsDataUIModel]) {
        self.petsList = data
        self.petsTableView?.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.petsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetsTableViewCell") as? PetsTableViewCell
        cell?.setData(title: self.petsList[indexPath.row].title, imageUrl: self.petsList[indexPath.row].imageURL)
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let targetVC = PetsDetailsViewController()
        targetVC.url = self.petsList[indexPath.row].contentURL
        PetsRouter.sharedInstance.baseNavigationVC?.pushViewController(targetVC, animated: true)
    }

}


extension String {

    var integer: Int {
        return Int(self) ?? 0
    }

    var secondFromString : Int{
        var components: Array = self.components(separatedBy: ":")
        let hours = components[0].integer
        let minutes = components[1].integer
        return Int((hours * 60 * 60) + (minutes * 60))
    }
}
