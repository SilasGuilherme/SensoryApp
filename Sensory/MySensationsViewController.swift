//
//  MySensationsViewController.swift
//  Sensory
//
//  Created by Silas Guilherme on 25/08/21.
//

import UIKit

class MySensationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let mySenses: [String] = ["sound","light","smell","crowd","cold","heat"]
    let myImages: [UIImage?] = [UIImage(named: "sound"), UIImage(named: "light"), UIImage(named: "smell"), UIImage(named: "crowd"), UIImage(named: "cold"), UIImage(named: "heat")]
       
    
    let table = UITableView()
    let cellSpacingHeight: CGFloat = 20
    
    let concluirButton = UIButton(type: .system)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#CAB3F3ff")
        title = "My Sensations"


        view.addSubview(table)
        table.dataSource = self
        table.frame = CGRect(x: 0, y: 50, width: 200, height: 200)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        
        self.table.register(CollapsibleTableViewCell.self, forCellReuseIdentifier: "CollapsibleTableViewCell")
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        table.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
        table.widthAnchor.constraint(equalToConstant: self.view.frame.width/1.5).isActive = true
        
        // Button
        view.addSubview(concluirButton)
        concluirButton.frame = CGRect(x: 20, y: 20, width: 150, height: 20)
        concluirButton.tintColor = UIColor(hex: "#622CC6ff")
        concluirButton.backgroundColor = UIColor(hex: "#DEEDC3ff")
        concluirButton.setTitle("Concluir", for: .normal)
        concluirButton.layer.borderColor = UIColor(hex: "#622CC6ff")?.cgColor
        concluirButton.layer.borderWidth = 4
        concluirButton.layer.cornerRadius = 15
        concluirButton.addTarget(self, action: #selector(concluirAction(_:)), for: .touchUpInside)
    
        concluirButton.translatesAutoresizingMaskIntoConstraints = false
        concluirButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.view.addConstraint(NSLayoutConstraint(item: concluirButton, attribute: .top, relatedBy: .equal, toItem: table, attribute: .bottom, multiplier: 1.0, constant: 20))
    
    
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.senses.count
    }
    
    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
    
 /*   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
 */
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
        
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: "CollapsibleTableViewCell") as? CollapsibleTableViewCell
            else { return UITableViewCell() }
            cell.setUI(with: indexPath.section)
          //  cell.frame = CGSize
            cell.backgroundColor = UIColor(hex: "#DEEDC3ff")
            cell.layer.borderColor = UIColor(hex: "#622CC6ff")?.cgColor
            cell.layer.borderWidth = 4
            cell.layer.cornerRadius = 15
            cell.clipsToBounds = true
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            self.table.performBatchUpdates(nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.table.cellForRow(at: indexPath) as? CollapsibleTableViewCell {
            cell.hideDetailView()
        }
    }
    
    @objc func concluirAction(_ sender:UIButton!)
       {
          // print("Button tapped")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let moodViewController = mainStoryboard.instantiateViewController(withIdentifier: "moodViewController") as? MyMoodViewController else {
            print ("Coulnd't find the view controller")
            return
            
        }
        
        navigationController?.pushViewController(moodViewController, animated: true)
           

    }
    
}

enum Constants {
    static let senses = ["sound","light","smell","crowd","cold","heat"]
}
    
    /*#imageLiteral(resourceName: "Screen Shot 2021-10-21 at 18.18.22.png")
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


