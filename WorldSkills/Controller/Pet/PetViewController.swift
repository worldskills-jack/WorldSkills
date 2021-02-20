//
//  PetViewController.swift
//  WorldSkills
//
//  Created by Jack on 20/2/2021.
//

import UIKit

class PetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let petManager = PetManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        petManager.petsList() { data, erorr in
            
        }

    }

}

// MARK: - TableView

extension PetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petManager.pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let pets = petManager.pets[indexPath.row]
        cell.textLabel?.text = pets.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
}
