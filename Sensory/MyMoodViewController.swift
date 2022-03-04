//
//  MyMoodViewController.swift
//  Sensory
//
//  Created by Silas Guilherme on 25/08/21.
//

import iCarousel
import UIKit

class MyMoodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, iCarouselDataSource {
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .coverFlow
        return view
    }()
    
    let goToMySensations = UIButton(type: .system)

    @IBOutlet var otherPeopleCollection: UICollectionView!
    
    let botheringMe: [String] = ["Barulho!","Luz!","Cheiro!","Multidão!","Frio!","Calor!"]
    let moodFaces: [UIImage?] = [UIImage(named: "angry"), UIImage(named: "confused")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#CAB3F3ff")
        
        // Configures Status Carousel
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        myCarousel.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 400)
        
   //     goToMySensations.backgroundColor = UIColor(hex: "#DEEDC3ff")
       
        title = "Como está o ambiente?"
        otherPeopleCollection.register(PeopleCollectionViewCell.nib(), forCellWithReuseIdentifier: PeopleCollectionViewCell.identifier)
        otherPeopleCollection.delegate = self
        otherPeopleCollection.dataSource = self
        otherPeopleCollection.backgroundColor
        
        
        // Button
        view.addSubview(goToMySensations)
        goToMySensations.frame = CGRect(x: 20, y: 20, width: 150, height: 20)
        goToMySensations.tintColor = UIColor(hex: "#622CC6ff")
        goToMySensations.backgroundColor = UIColor(hex: "#DEEDC3ff")
        goToMySensations.setTitle("My Sensations", for: .normal)
        goToMySensations.layer.borderColor = UIColor(hex: "#622CC6ff")?.cgColor
        goToMySensations.layer.borderWidth = 4
        goToMySensations.layer.cornerRadius = 15
        goToMySensations.addTarget(self, action: #selector(goToAction(_:)), for: .touchUpInside)
        
       // cell.backgroundColor = UIColor(hex: "#DEEDC3ff")
      //  cell.layer.borderColor = UIColor(hex: "#622CC6ff")?.cgColor
        
        // AUTO-LAYOUT
             
        myCarousel.translatesAutoresizingMaskIntoConstraints = false
        myCarousel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // myCarousel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        myCarousel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        myCarousel.heightAnchor.constraint(equalToConstant: self.view.frame.height/3).isActive = true
        myCarousel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        
        goToMySensations.translatesAutoresizingMaskIntoConstraints = false
        goToMySensations.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    //    goToMySensations.topAnchor.constraint(equalTo: myCarousel.bottomAnchor).isActive = true
        self.view.addConstraint(NSLayoutConstraint(item: goToMySensations, attribute: .top, relatedBy: .equal, toItem: myCarousel, attribute: .bottom, multiplier: 1.0, constant: 20))
        
        otherPeopleCollection.translatesAutoresizingMaskIntoConstraints = false
        otherPeopleCollection.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        otherPeopleCollection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        otherPeopleCollection.widthAnchor.constraint(equalToConstant: self.view.frame.width*0.9).isActive = true
        otherPeopleCollection.heightAnchor.constraint(equalToConstant: self.view.frame.height/3).isActive = true
        self.view.addConstraint(NSLayoutConstraint(item: otherPeopleCollection!, attribute: .top, relatedBy: .equal, toItem: goToMySensations, attribute: .bottom, multiplier: 1.0, constant: 10))
            
    }
    
    @objc func goToAction(_ sender:UIButton!)
       {
          // print("Button tapped")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let sensationsViewController = mainStoryboard.instantiateViewController(withIdentifier: "sensationsViewController") as? MySensationsViewController else {
            print ("Coulnd't find the view controller")
            return
            
        }
        
        navigationController?.pushViewController(sensationsViewController, animated: true)
           

    }

        
        
        
  /*      PeopleNearbyLabel.translatesAutoresizingMaskIntoConstraints = false
        PeopleNearbyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        PeopleNearbyLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
  */
        
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 4
    }
  
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/1.4, height: 300))
        view.backgroundColor = .clear
        
        let imageview = UIImageView(frame: view.bounds)
        view.addSubview(imageview)
        imageview.contentMode = .scaleAspectFit
        imageview.image = UIImage(named: "mood\(index+1)")
        
        return view
    }
    
 // Cria e configura a collectionView "other people"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = otherPeopleCollection.dequeueReusableCell(withReuseIdentifier: PeopleCollectionViewCell.identifier, for: indexPath) as! PeopleCollectionViewCell
        cell.configure(with: botheringMe[indexPath.row], imageName: moodFaces[indexPath.row % 2])
        return cell
    
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Hide the navigation bar on the this view controller
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Show the navigation bar on other view controllers
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
//    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
