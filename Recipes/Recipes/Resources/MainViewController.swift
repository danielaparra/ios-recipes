//
//  MainViewController.swift
//  Recipes
//
//  Created by Daniela Parra on 9/10/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchRecipes { (recipes, error) in
            if let error = error{
                NSLog("Error fetching recipes: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.allRecipes = recipes ?? []
            }
        }
    }
    
    @IBAction func searchRecipes(_ sender: UITextField) {
        sender.resignFirstResponder()
        filterRecipes()
    }
    
    
    private func filterRecipes() {
        
        guard let searchWords = searchTextField.text else {
            filteredRecipes = allRecipes
            return }
        filteredRecipes = allRecipes.filter { $0.name.contains(searchWords) || $0.instructions.contains(searchWords)}
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedRecipesTVC" {
            recipesTableViewController = (segue.destination as! RecipesTableViewController)
        }
    }
    
    let networkClient = RecipesNetworkClient()
    
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    private var recipesTableViewController: RecipesTableViewController? {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    @IBOutlet weak var searchTextField: UITextField!
    
}
