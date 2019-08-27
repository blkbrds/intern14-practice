//
//  Ex11ViewController.swift
//  TableView
//
//  Created by PCI0008 on 8/20/19.
//  Copyright © 2019 Tien Le P. All rights reserved.
//

import UIKit

class Ex11ViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: config
    override func setupUI() {
        super.setupUI()
        self.title = "Ex11"
        tableView.register(UINib(nibName: "NameUserCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension Ex11ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? NameUserCell, indexPath.row < Data.planets.count else { return UITableViewCell() }
        cell.nameLabel.text = Data.planets[indexPath.row]
        return cell
    }
}

extension Ex11ViewController {
    struct Data {
        static let planets: [String] = ["The Sun. The heart of our solar system is a yellow dwarf star, a hot ball of glowing gases.Parker Solar Probe Completes Download of Science Data from First Two Solar Encounters Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest particles of debris in its orbit. Electric currents in the Sun generate a magnetic field that is carried out through the solar system by the solar wind a stream of electrically charged gas blowing outward from the Sun in all directions. The connection and interactions between the Sun and Earth drive the seasons, ocean currents, weather, climate, radiation belts and aurorae. Though it is special to us, there are billions of stars like our Sun scattered across the Milky Way galaxy.",
                                        "The smallest planet in our solar system and nearest to the Sun, Mercury is only slightly larger than Earth's Moon. The Moon and Mercury May Have Thick Ice Deposits From the surface of Mercury, the Sun would appear more than three times as large as it does when viewed from Earth, and the sunlight would be as much as seven times brighter. Despite its proximity to the Sun, Mercury is not the hottest planet in our solar system that title belongs to nearby Venus, thanks to its dense atmosphere.",
                                        "Jan. 31, 2019: A Japanese research group has identified a giant streak structure among the clouds covering Venus based on observation from the spacecraft Akatsuki. Swirling clouds on Venus. The team also revealed the origins of this structure using large scale climate simulations. The group was led by Project Assistant Professor Hiroki Kashimura (Kobe University, Graduate School of Science) and these findings were published on January 9 in Nature Communications. Second planet from the Sun and our closest planetary neighbor, Venus is similar in structure and size to Earth, but it is now a very different world. Venus spins slowly in the opposite direction most planets do. Its thick atmosphere traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system with surface temperatures hot enough to melt lead. Glimpses below the clouds reveal volcanoes and deformed mountains.",
                                        "Our home planet is the third planet from the Sun, and the only place we know of so far that’s inhabited by living things. Remembering Chris Kraft While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface. Just slightly larger than nearby Venus, Earth is the biggest of the four planets closest to the Sun, all of which are made of rock and metal. The name Earth is at least 1,000 years old. All of the planets, except for Earth, were named after Greek and Roman gods and goddesses. However, the name Earth is a Germanic word, which simply means “the ground.”",
                                        "The fourth planet from the Sun, Mars is a dusty, cold, desert world with a very thin atmosphere. New Finds for Mars Rover, Seven Years After Landing. This dynamic planet has seasons, polar ice caps and weather and canyons and extinct volacanoes, evidence of an even more active past. Mars is one of the most explored bodies in our solar system, and it's the only planet where we've sent rovers to roam the alien landscape. NASA currently has three spacecraft in orbit, one rover and one lander on the surface and another rover under construction here on Earth. India and ESA also have spacecraft in orbit above Mars. These robotic explorers have found lots of evidence that Mars was much wetter and warmer, with a thicker atmosphere, billions of years ago.",
                                        "Asteroids, sometimes called minor planets, are rocky, airless remnants left over from the early formation of our solar system about 4.6 billion years ago. How Historic Jupiter Comet Impact Led to Planetary Defense. The current known asteroid count is: 796,541 . Most of this ancient space rubble can be found orbiting the Sun between Mars and Jupiter within the main asteroid belt. Asteroids range in size from Vesta. The largest at about 329 miles (530 kilometers) in diameter to bodies that are less than 33 feet (10 meters) across. The total mass of all the asteroids combined is less than that of Earth's Moon.",
                                        "Jupiter has a long history surprising scientists all the way back to 1610 when Galileo Galilei found the first moons beyond Earth. That discovery changed the way we see the universe. How Historic Jupiter Comet Impact Led to Planetary Defense. Fifth in line from the Sun, Jupiter is, by far, the largest planet in the solar system more than twice as massive as all the other planets combined. Jupiter's familiar stripes and swirls are actually cold, windy clouds of ammonia and water, floating in an atmosphere of hydrogen and helium. Jupiter’s iconic Great Red Spot is a giant storm bigger than Earth that has raged for hundreds of years. One spacecraft NASA's Juno orbiter is currently exploring this giant world.",
                                        "Saturn is the sixth planet from the Sun and the second largest planet in our solar system. Scientists Finally Know What Time It Is on Saturn. Adorned with thousands of beautiful ringlets, Saturn is unique among the planets. It is not the only planet to have rings made of chunks of ice and rock but none are as spectacular or as complicated as Saturn's. Like fellow gas giant Jupiter, Saturn is a massive ball made mostly of hydrogen and helium.",
                                        "April 24, 2018: The jokes, they write themselves. The science is pretty interesting, too. What do the clouds of Uranus have in common with rotten eggs? The composition of Uranus' clouds had long been a mystery. In April 2017, a global research team found hydrogen sulfide, the odiferous gas that most people avoid, in Uranus’ cloud tops a striking difference from the gas giant planets located closer to the Sun. The first planet found with the aid of a telescope, Uranus was discovered in 1781 by astronomer William Herschel, although he originally thought it was either a comet or a star. It was two years later that the object was universally accepted as a new planet, in part because of observations by astronomer Johann Elert Bode. Herschel tried unsuccessfully to name his discovery Georgium Sidus after King George III. Instead the planet was named for Uranus, the Greek god of the sky, as suggested by Johann Bode.​",
                                        "Dark, cold and whipped by supersonic winds, ice giant Neptune is the eighth and most distant planet in our solar system. Tiny Neptune Moon May Have Broken from Larger Moon More than 30 times as far from the Sun as Earth, Neptune is the only planet in our solar system not visible to the naked eye and the first predicted by mathematics before its discovery. In 2011 Neptune completed its first 165 year orbit since its discovery in 1846. NASA's Voyager 2 is the only spacecraft to have visited Neptune up close. It flew past in 1989 on its way out of the solar system."]
    }
}
