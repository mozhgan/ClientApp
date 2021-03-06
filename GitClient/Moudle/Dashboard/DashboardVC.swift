//
//  DashboardVC.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import UIKit

class DashboardVC: UITableViewController {
    var interactor : DashboardBusinessLogic?
    var router : (DashboardRoutingLogic & DashboardDataPassing)?
    var user : Dashboard.UserViewModel?
    var repos : Dashboard.ReposViewModel?
    let profileReuseIdentifier = "\(ProfileTableCell.self)"
    let repoReuseIdentifier = "\(RepoTableCell.self)"
    let shimmerReuseIdentifier = "\(ShimmerTableViewCell.self)"

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.getUserProfile()

    }
    override func loadView() {
        super.loadView()
        self.tableView.register(ProfileTableCell.self, forCellReuseIdentifier: profileReuseIdentifier)
        self.tableView.register(RepoTableCell.self, forCellReuseIdentifier: repoReuseIdentifier)
        self.tableView.register(UINib(resource: R.nib.shimmerTableViewCell), forCellReuseIdentifier: shimmerReuseIdentifier)
        self.tableView.separatorInset = .zero
        self.tableView.separatorStyle = .singleLine
        self.tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
        return 1
        default:
            return repos?.repos?.count ?? 15
        }
    }

    // swiftlint:disable force_cast
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
        guard self.user != nil else {
            return tableView.dequeueReusableCell(withIdentifier: shimmerReuseIdentifier,
                                                     for: indexPath) as! ShimmerTableViewCell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: profileReuseIdentifier,
                                             for: indexPath) as! ProfileTableCell
        cell.configCell(viewModel: self.user!)
        return cell
        default:
        guard self.repos != nil else {
            return tableView.dequeueReusableCell(withIdentifier: shimmerReuseIdentifier,
                                                     for: indexPath) as! ShimmerTableViewCell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: repoReuseIdentifier, for: indexPath) as! RepoTableCell
        cell.configCell(viewModel: repos!.repos![indexPath.row])
        return cell
        }
    }
    // swiftlint:enable force_cast

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 120.0
        default:
            return 45.0
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DashboardVC : DashboardDisplayLogic {
    func show(viewModel: Dashboard.ErrorViewModel) {
        self.showAlert(withTitle: viewModel.title ?? "",
                       withMessage: viewModel.message ?? "",
                       buttonTitle: viewModel.buttonTitles?.first ?? "")
    }

    func show(viewModel: Dashboard.UserViewModel) {
        self.user = viewModel
        self.tableView.reloadData()
    }

    func show(viewModel: Dashboard.ReposViewModel) {
        self.repos = viewModel
        self.tableView.reloadData()
    }

}
