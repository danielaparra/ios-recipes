//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Daniela Parra on 9/10/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    private func updateViews() {
        guard let recipe = recipe else { return }
        if isViewLoaded {
            titleLabel.text = recipe.name
            recipeTextView.text = recipe.instructions
        }
    }

    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var recipeTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
}
