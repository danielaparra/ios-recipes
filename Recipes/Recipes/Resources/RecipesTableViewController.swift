//
//  RecipesTableViewController.swift
//  Recipes
//
//  Created by Daniela Parra on 9/10/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        
        cell.textLabel?.text = recipes[indexPath.row].name

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewRecipe" {
            guard let destinationVC = segue.destination as? RecipeDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            
            destinationVC.recipe = recipes[indexPath.row]
        }
    }
    
    var recipes: [Recipe] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}
