//
//  PracticeNineViewController.swift
//  AutoLayouts
//
//  Created by MBA0051 on 10/12/19.
//  Copyright © 2019 MBA0051. All rights reserved.
//

import UIKit

class PracticeNineViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var contentDisplayLabel: UILabel!
    

    var animals: [Animal] = []
    var startImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animals = [
            Animal(description: "Bulldogs originally were used to drive cattle to market and to compete in a bloody sport called bullbaiting. Today, they’re gentle companions who love kids. A brief walk and a nap on the sofa is just this dog breed‘s speed.", imageUrl: "firstImg.jpg"),
            Animal(description: "The Alaskan Malamute is a large breed of domestic dog (Canis lupus familiaris) originally bred for their strength and endurance to haul heavy freight,[1] and later as a sled dog. They are similar to other arctic breeds and spitz breeds, such as the Greenland Dog, Canadian Eskimo Dog, the Siberian Husky, and the Samoyed.", imageUrl: "secondImg.jpg"),
            Animal(description: "The Tibetan Mastiff known as 'Dogs-Khyi in Tibetan, reflects its use as a guardian of herds, flocks, tents, villages, monasteries, and palaces, much as the Old English Bandog (also meaning tied dog) was a dog tied outside the home as a guardian. However, in nomad camps and in villages, the 'Dogs-Khyi is traditionally allowed to run loose at night. This dog is known for its loyalty and has been used as a nomad dog for thousands of years.", imageUrl: "thirthImg.jpg"),
            Animal(description: "Cats have anatomy similar to the other members of the genus Felis. The genus has extra lumbar (lower back) and thoracic (chest) vertebrae. This helps to explain the cat's spinal mobility and flexibility. Unlike human arms, cat forelimbs are attached to the shoulder by free-floating clavicle bones. These allow cats to pass their body through any space into which they can fit their heads.", imageUrl: "fourthImg.jpeg"),
            Animal(description: "The dignified and docile Persian cat is known for being quiet and sweet. Although Persians tend to be relaxed and easygoing, they also command an air of royalty. They may not be quick to hiss or scratch, but that doesn’t mean they won’t become annoyed when bothered by loud children or pets.", imageUrl: "fifthImg.jpg"),
            Animal(description: "Calico cats aren't an actual cat breed. Calico is just a color pattern that occurs in numerous breeds of cats. There are long-haired calico cats and short haired calicos, and the genetics behind how this pattern is created are fascinating.", imageUrl: "sixthImg.jpg"),
            Animal(description: "The White Broiler or White Cornish Cross are the fastest growing meat chickens and are the ones used in the commercial broiler industry, producing the chicken one would buy at the grocery store. They are super efficient growers, consuming about 14 pounds of feed per bird to reach 5-6 pounds at 6-7 weeks of age.", imageUrl: "seventh.jpg"),
            Animal(description: "Black chicken usually refers to a breed of chicken which exhibits black color characterized by a uniform, black color across all feathers; see Solid black (chicken plumage). Silkie, a breed found in China that has black skin, black flesh, and black bones.", imageUrl: "eighth.jpeg"),
            Animal(description: "Phu Quoc is a kind of dog in Phu Quoc island, Vietnam only. Its distinguishing element, also the characteristic of the breed, is the quite strange ridge of hair running along its spine. When people came here to live and work, they domesticated the dogs living in the wild into the hounds for them. For now, many people still agree that this is a rare species of the dog with various outstanding features compared to many other ones in the world. Visiting dog farms is one of the most exciting things to do in Phu Quoc for tourists.", imageUrl: "ninethImg.jpg"),
            Animal(description: "Bristleback works himself up into a fury every time he casts a spell, increasing his movement speed and damage. Prevents gaining new stacks.", imageUrl: "tenth.png")
        ]
        // Load first image.
        loadAnimalInfomation()
    }

    private func loadAnimalInfomation() {
        title = String(startImage + 1) + "/" + String(animals.count)
        mainImageView.image = UIImage(named: animals[startImage].imageUrl)
        contentDisplayLabel.text = animals[startImage].description
    }
    @IBAction func changeImageButtonClick(_ sender: UIButton) {
        if (sender.tag == 1 && startImage < animals.count - 1) {
            // next image
            startImage += 1
            loadAnimalInfomation()
        } else if (sender.tag == 2 && startImage > 0) {
            // previous image.
            startImage -= 1
            loadAnimalInfomation()
        }
    }
    @IBAction func interactButtonClick(_ sender: UIButton) {
        if (sender.tag == 3) {
            print("Like button is clicked.")
        } else if (sender.tag == 4) {
            print("Comment button is clicked.")
        } else {
            print("Share button is clicked.")
        }
    }
}
