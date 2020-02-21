//
//  ViewController.swift
//  TableViewExample
//
//  Created by Erick Araujo on 2020-02-21.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

/*
 * ViewController for Main Page
 */
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!;
    
    var planets = [
        "Mercury",
        "Venus",
        "Earth",
        "Mars",
        "Jupiter",
        "Saturn",
        "Uranus",
        "Neptune"];
    var planetsImgs = [
        UIImage(named: "Mercury"),
        UIImage(named: "Venus"),
        UIImage(named: "Earth"),
        UIImage(named: "Mars"),
        UIImage(named: "Jupiter"),
        UIImage(named: "Saturn"),
        UIImage(named: "Uranus"),
        UIImage(named: "Neptune")];
    
    var details = ["Mercury is the smallest and innermost planet in the Solar System. Its orbit around the Sun takes 87.97 days, the shortest of all the planets in the Solar System. It is named after the Roman deity Mercury, the messenger of the gods.", "Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the second-brightest natural object in the night sky after the Moon, Venus can cast shadows and, rarely, is visible to the naked eye in broad daylight.", "Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating and other evidence, Earth formed over 4.5 billion years ago.", "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System after Mercury. In English, Mars carries a name of the Roman god of war and is often referred to as the 'Red Planet'.", "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined.", "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth.", "Uranus (from the Latin name Ūranus for the Greek god Οὐρανός) is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. Uranus is similar in composition to Neptune, and both have bulk chemical compositions which differ from that of the larger gas giants Jupiter and Saturn. ", "Neptune is the eighth and farthest known planet from the Sun in the Solar System. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. "];
    
    var selectedItem:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueDetail" {
            let destinationVC = segue.destination as! DetailViewController;
            destinationVC.detailTitle = planets[selectedItem];
            destinationVC.detail = details[selectedItem];
            destinationVC.image = planetsImgs[selectedItem];
        }
    }
}

/*
 * ViewController for Planet Detail Screen
 */
class DetailViewController: UIViewController {
    var detailTitle:String = "";
    var detail:String = "";
    var image:UIImage?;
    
    @IBOutlet weak var txtLabelTitle: UILabel!
    @IBOutlet weak var txtLabelDetail: UITextView!
    @IBOutlet weak var planetImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        txtLabelTitle.text = detailTitle;
        txtLabelDetail.text = detail;
        planetImage.image = image!;
    }
    
    @IBAction func onClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
}

/*
* ViewController extension for Delegate actions
*/
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedItem = indexPath.row;
        
        self.performSegue(withIdentifier: "SegueDetail", sender: self);
        
        print("row: \(indexPath.row)");
    }
}

/*
 * ViewController extension for DataSource operations
 */
extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count;
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell;
        
        if let label = cell.txtLabelCustom {
            label.text = planets[indexPath.item];
        }
        
        if let img = cell.imageItem {
            img.image = planetsImgs[indexPath.item];
        }

        return cell;
    }
    
}

/*
 * Customize TableViewCell with new UI Elements
 */
class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var txtLabelCustom: UILabel!;
}
