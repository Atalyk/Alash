//
//  MainViewController.swift
//  Alash
//
//  Created by Admin on 9/19/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let screenBounds = UIScreen.mainScreen().bounds

    var persons = ["Алпысбай Қалменов", "Аспандияр Кенжин", "Ахмет Байтұрсынұлы", "Әбубәкір Алдияров", "Әлихан Бөкейхан", "Елдес Омаров", "Ережеп Итбаев", "Жанша Досмұхамедов", "Ілияс Жансүгіров", "Мағжан Жұмабай", "Міржақып Дулатұлы", "Мұстафа Шоқай", "Мұхаметжан Тынышбайұлы", "Мырзағазы Есполов", "Мұқыш Боштаев", "Садық Аманжолов", "Сейілбек Жанайдаров", "Халел Ғаббасов",  "Халел Досмұхамедов", "Тел Жаманмұрынов",  "Уәлитхан Танашев", "Хамит Тоқтамышев", "Шонанов Телжан"]
    
    var index = 0
    
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = .None
        
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        let attributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName: UIFont(name: "Helvetica", size: screenBounds.width*0.05)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        
        self.automaticallyAdjustsScrollViewInsets = true
        
        title = "Қайраткерлер"
        
        setup()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setup() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height))
        tableView.rowHeight = screenBounds.height/10
        tableView.registerClass(PersonTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonTableViewCell
        cell.personLabel.text = persons[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        index = indexPath.row
        performSegueWithIdentifier("SeguePerson", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SeguePerson" {
            let personViewController = segue.destinationViewController as! PersonViewController
            personViewController.index = index
        }
    }

}
