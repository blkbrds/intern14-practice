//
//  Ex09ViewController.swift
//  ExAutoLayout
//
//  Created by PCI0010 on 8/29/19.
//  Copyright © 2019 PCI0010. All rights reserved.
//

import UIKit

final class Ex09ViewController: UIViewController {
    
    
    @IBOutlet weak var imagesScrollView: UIScrollView!
    @IBOutlet weak var infoLabel: UILabel!
    
    let infoLabelText: [String] = ["Just as higher states of energy seek a lower level, the Spectre known as Mercurial is a being of intense and violent energy who finds herself irresistibly drawn to scenes of strife as they unfold in the physical world. While her normal spectral state transcends sensory limitations, each time she takes on a physical manifestation, she is stricken by a loss of self—though not of purpose. In the clash of combat, her identity shatters and reconfigures, and she begins to regain awareness. She grasps that she is Mercurial the Spectre—and that all of her Haunts are but shadows of the one true Spectre. Focus comes in the struggle for survival; her true mind reasserts itself; until in the final moments of victory or defeat, she transcends matter and is restored once more to her eternal form",
                                   "Davion, the Dragon Knight, is a durable melee strength hero with a relatively straightforward and yet versatile skill set. He has both an area-of-effect nuke and a lengthy single-target stun, giving him excellent farming and ganking capabilities. Though he has no real escape ability, his Dragon Blood provides him a hefty amount of armor and regen, making him capable of withstanding strong physical hits and recovering quickly. He is still very vulnerable in the early game, however, and needs to farm and stay alive in order to be effective in later stages. If he has enough levels and farm, Dragon Knight is very formidable in the late game due to his strong ultimate, Elder Dragon Form, which transforms him into a legendary dragon with a ranged attack, capable of eliminating multiple enemies at once.",
                                   "Darkterror the Faceless Void is a melee agility hero played as an offlaner or carry. Given a little time, he becomes a terrifying hero capable of destroying entire enemy teams in seconds.Wielding his cosmically powered mace, each blow can lock his foes in time, stopping them in place. He can jump into or out of combat using Time Walk while simultaneously reverting any damage he has taken in the last few seconds. Darkterror can also pause his foes' cooldowns with Time Dilation, lowering their movement speed in the process. His ultimate, Chronosphere, freezes time for everything within its area of effect, giving him time to pummel any enemies caught within without resistance for several seconds. It's one of the most devastating initiation spells in the game and can win team fights before his opponents can even react.",
                                   "Traxex, the Drow Ranger, is a ranged agility hero whose greatest assets are her incredible damage and ability to keep threats at bay. Traxex is a carry who, though lacking survivability, provides a worthwhile contribution through her damage alone. The Drow Ranger can be extremely powerful at any point in the game.",
                                   "Carl, the Invoker, is a ranged intelligence hero who is very difficult to master. He is unique in that he possesses a total of 14 abilities in his arsenal; three of them - Quas, Wex, and Exort - are reagents and one is his special ultimate Invoke. The three abilities he learns throughout leveling up can have three instances, which serve as the basic ingredients or components for him to create a new ability using his ultimate. Once the reagents or elements are combined, he can invoke one out of ten different abilities. All of his invoked abilities are capable of a multitude of actions, from damaging enemies to aiding his allies, and even saving himself from danger.",
                                   "Gondar the Bounty Hunter is a melee agility hero that excels at hunting, chasing down and killing single targets. His skill set allows him to roam and gank very effectively, as his Shadow Walk allows him to sneak up to unsuspecting targets to initiate. Shadow Walk is also an effective escape and mobility spell, as he can run from dangerous situations and roam invisibly around the map to keep the enemy guessing even if they have Observer Wards active. His ability to deal medium amounts of damage with Jinada, interrupt their Town Portal Scrolls with Shuriken Toss, and keep perfect tabs on their location and movements with Track all make him a powerful and ruthless ganker who is all but impossible to escape once he has his sights locked in. Bounty Hunter's ability to roam, scout and get important kills for his team while bolstering their gold gain with Track can secure his team a strong gold advantage, and give his foes no safe place to hide.",
                                   "Kunkka, the Admiral, is a versatile melee strength hero built with an arsenal of powerful area-of-effect (AoE) spells. Two of his active spells are nukes that have long delay times, but can disable and disrupt the enemies' position. He is mostly played as a carry, initiator, or even as a ganking support. Kunkka is known for his Tidebringer sword, giving him the ability to cleave a large area around him with heavy potential damage on his next attack, which refreshes at a given period of time. Torrent calls upon the element of water to rise and burst out, dealing damage, disabling them up high, and slowing them on impact. There's a delay on this ability before it activates, so Kunkka must be wise in using this ability.",
                                   "Lina, the Slayer, is a ranged Intelligence hero, adept at destroying enemy heroes quickly by delivering massive bursts of magical damage, making her one of the most effective gankers in the game. She possesses immense damaging capabilities all throughout the game, but is very fragile. Two of her fiery spells are her main source of damage, Dragon Slave sends a wave of fire to burn enemies in her path while Light Strike Array stuns them with a concentrated pillar of solar flame. Each of her spells deals great damage early on and has a low cooldown. Her Fiery Soul bolsters her attack and movement speed every time she casts a spell, which gives her scaling damage for the later game. Laguna Blade, her ultimate, is her ace in the hole. Lina fires off a huge bolt of lightning at a single target, dealing colossal damage. Laguna Blade's damage is staggering in early-mid game, and late game is still enough to destroy frail enemy heroes. Dragon Slave, Light Strike Array, and Laguna Blade are incredible flaming nukes that can incinerate her target instantly, and Fiery Soul allows her to transition into a strong and fast physical attacker. Though her power falls from its peak late game, mana-boosting and damage-increasing items can be purchased to keep herself up.",
                                   "Lion, the Demon Witch, is a ranged intelligence hero, most commonly played as a support, who serves as a powerful offensive spellcaster. While exceptionally frail and vulnerable at all stages of the game due to his low health pool, armor, and movement speed, he has a tremendous amount of disabling and nuking power, allowing him to provide the necessary lockdown and burst damage to his team to bring down elusive and shifty enemies. Earth Spike is an area-of-effect line-based stun that also deals a moderate amount of damage. If Lion uses it at max level combined with his Hex, which briefly transfigures an enemy into a harmless critter, he can disable a single opponent for almost 7 seconds, more than enough time to bring down a lone enemy, especially if an ally is present. His ultimate, Finger of Death, serves as a powerful nuke and his primary source of burst damage to aid him in his endeavors.",
                                   "Meepo, the Geomancer, is a melee agility hero who is notorious for being one of the hardest carries in the game to play effectively due to his heavy reliance on micromanagement. Meepo's defining ultimate, Divided We Stand, allows Meepo to create up to 3 additional clones of himself, (4 with Aghanim's Scepter), each of which has its own mana and hit points, as well as individual cooldowns on Meepo's spells. The clones cannot use any items besides the boots that the main Meepo himself wears, but each clone can gain experience and gold additively with the original Meepo, allowing him to gain levels and gold extremely fast. This means that a well-played Meepo can gain experience faster than any other hero, capable of reaching maximum level extremely early into the game and overpowering his unsuspecting opponents; however, Meepo's greatest strength is also his greatest weakness, as the death of any Meepo, including the clones, spells death for all Meepos."
    ]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = infoLabelText[0]
        title = " Ex09 "
    }
    
    @IBAction func nextButton(_ sender: Any) {
        next()
    }
    
    @IBAction func backButton(_ sender: Any) {
        back()
    }
    
    func back() {
        if imagesScrollView.contentOffset.x < 294 {
            index = 9
            imagesScrollView.contentOffset.x = 2646
        } else {
            index -= 1
            imagesScrollView.contentOffset.x = imagesScrollView.contentOffset.x - 294
        }
        infoLabel.text = infoLabelText[index]
    }
    
    func next() {
        if imagesScrollView.contentOffset.x >= imagesScrollView.contentSize.width - 294 {
            imagesScrollView.contentOffset.x = 0
            index = 0
        } else {
            imagesScrollView.contentOffset.x = imagesScrollView.contentOffset.x + 294
            index += 1
        }
        infoLabel.text = infoLabelText[index]
    }
}
