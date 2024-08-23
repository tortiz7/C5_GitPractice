#!/bin/bash

play_again="Y"
shopt -s nocasematch
while [ "$play_again" = "Y" ] || [ "$play_again" = "y" ]
do
 	 echo -e "Hello, brave space traveller. It is a cold, lonely universe out there - the choices you make will determine if you'll make it back home alive. \nI fear the wrong choice could lead to....certain doom!"

	 echo -e "Surely you embarked on this journey with your trusty robot companion B4SH, yes? (Yes\No)"
	  read companion

	 if [[ "$companion" == Yes* ]]; then
           echo -e  "B4SH informs you that your starship is no longer space-ready, and you have been marooned on the planet Doomfall. \nB4SH is an experienced starflight technician however, and can repair the hyperdrive if you can find it a dense crystal of Pythonioum. \nWill you procure the Pythonioum? (Yes/No)"
           read choice
         elif [[ "$companion" == No ]]; then
           echo -e "Without your trusty robot companion B4SH, you realize you are utterly alone on this desolate planet. You try to repair the starship by yourself, but do not have the expertise, and are thus stranded forever. Bad Ending :( ." 
         #else
          # echo -e "You'll never escape fooling around! Choose from the two options presented!"
	 fi

	 if [[ "$choice" == Yes* ]]; then
           echo -e "B4SH seems emboldened by your bravery, it's chirps signaling joy. \nIt produces a holographic map of your imposing surroundings, the surface of Doomfall full of craters, valleys, and icesheets from a bombardment long forgotten. \nB4SH highlights a glowing cavern several clicks away, steam pouring out of its mouth. The Pythonium will surely be found here, B4SH signals. \nYou begin your trek towards the smoke-breathing cavern, delicately traversing the ice sheets underfoot. \n4 clicks from B4SH, you hear a faint grumbling sound, and feel a rumbling shaking the ice from the direction of the sound. To your right, a jagged mountain beckons. Do you proceed forward, or mantle the mountain? (Forward\Mantle)?"
           read movement
         elif [[ "$choice" == No* ]]; then
           echo -e "You decide that it is too dangerous to venture out for Pythonioum. B4SH, sensing your hesitation, tries to find alternative solutions, but the reality of the situation dawns on both of you. \nWithout Pythonioum, the hyperdrive cannot be repaired. As days pass, your supplies dwindle, and the cold, unforgiving environment of Doomfall slowly takes its toll. \nIn the end, the harsh planet claims you, your starship forever grounded. THE END - Bad Ending :( "
         #else
          # echo -e "You'll never escape fooling around! Choose from the two options presented!"
         fi

	 if [[ "$movement" == Mantle* ]]; then
           echo -e "You wisely decide to take your chances climbing the mountain. You check your thrusters and are relieved to see fuel reserves remain intact after your crash landing. \nYou begin climbing the icy rockface of the mountain, boosting with your thrusters at the midway point when the ice becomes too slippery, and the surface too steep.\nOnce at the top of the moutain, you see the source of the sound - an ashen space-dragon, nostrils flared, tail blazing an icy blue. \nYou steel yourself, and contemplate the next move: do you return to B4SH in the hopes of charting another course to the Pythonium, or do you try to circumvent the space dragon? \n(Return/Circumvent)"
           read space_dragon
         elif [[ "$movement" == Forward* ]]; then
           echo -e "You decide to push forward toward the cave, ignoring the ominous sounds around you. As you proceed, the rumbling grows louder, and the ground beneath you suddenly gives way. \nYou plummet into a deep fissure in the planet, the darkness swallowing you whole. Without B4SH by your side, there is no one to rescue you, and your adventure ends in a cold, lonely abyss. \nTHE END - Bad Ending :("
         #else
           #echo -e "You'll never escape fooling around! Choose from the two options presented!"
	 fi

	 if [[ "$space_dragon" == Circumvent* ]]; then
           echo -e "Deciding you've ventured too far to go back now, you begin to descend the mountain, hoping to sneak around the dragon. \nAs you reach the foot of the mountain, the sheer size of the dragon comes into view, it's towering scales an omen of doom. \nHow to get past the dragon? Do you make a run for it, \nor fashion a distraction out of your remaining thruster fuel, making the trek back from the cave more dangerous? \n(Run/Distraction)"
           read sneak
	 elif [[ "$space_dragon" == Return* ]]; then
           echo -e "You decide to return to B4SH and inform it about the space dragon. B4SH calculates the risk and determines that the mission is too dangerous. \nWith no alternative plan, you both hunker down in the starship, but as days turn to weeks, the reality sets in that without the Pythonioum, you will never leave Doomfall. THE END - Bad Ending :("
         #else
           #echo -e "You'll never escape fooling around! Choose from the two options presented!"
	 fi

	 if [[ "$sneak" == Distraction* ]]; then
           echo -e "You remove the fuel reserves from your ankle, rendering your thrusters useless. \nWith your trusty Space igniter, you light the thruster fluid on fire and quickly launch it in the direction of the space dragon. \nThe fuel roars forward, stealing all the attention of the dragon, who flies after the shooting star, hoping for a good meal. \nWith the space dragon gone, you proceed towards the smoke-spewing cave, now only a handful of clicks away. \nThe rest of the trek is relatively smooth, and you now stand before the mouth of the cave. \nThe smoke is hot and dense, and your sensors indicate it is noxious too. \nTo avoid a poisonous death, you'll need to triple your Oxygen usage, in order to create a synthetic Oxygen membrane to keep the poison out of your suit. \nThis could prove disastrous, but your only other option would be to return to B4SH and come back to the cave with the poison-immune robot - but then who will repair the ship? \n(Oxygen/Return)"
           read cave_choice
         elif [[ "$sneak" == Run* ]]; then
           echo -e "You decide to make a run for it, hoping that your speed and agility will help you evade the space dragon. \nHowever, the dragon spots you immediately, and with a deafening roar, it swoops down, icy flames spewing from its maw. \nYou try to outrun the dragon, but its icy breath quickly catches up, freezing you in place. \nYou become a permanent fixture of Doomfall's frozen landscape, a grim reminder to future explorers. \nTHE END - Bad Ending :( ."
         #else
           #echo -e "You'll never escape fooling around! Choose from the two options presented!"
	 fi

	 if [[ "$cave_choice" == Oxygen* ]]; then
           echo -e "Knowing a return trip to the ship could be fatal without functioning thrusters, you triple your oxygen consumption, creating a protective membrane around your helmet and keeping the poisonious gas at bay. \nYour oxygen tank is now running dangerously low, however, so time is of the essence. \nYou rush forward into the oppressive darkness of the cave, light emitting diodes from your helmet your only solace. \nAfter squeezing through a tight opening in the cave, you fall into an open expense within the cave system. \nTowards the end of the expanse, you see a gelatinous creature, oozing the noxious fumes, startled by the sound of your entrance. \nAs the creature moves closer to you, you notice two holes devoid of light where its eyes should be. \nYou flicker your lights on and off to test your hypothesis, and indeed: the creature is blind. \nJust like the space dragon, you are presented two options: do you distract the creature with noise, or sneak around it to find a path forward? \n(Distract/Sneak)"
           read creature
	 elif [[ "$cave_choice" == Return* ]]; then
           echo -e "You decide to return to B4SH, hoping to figure out a better plan. However, the trek back proves too difficult without proper oxygen levels, and you find yourself struggling to breathe. \nAs you gasp for air, your vision blurs, and you collapse onto the icy ground, never to rise again. \nTHE END - Bad Ending :( ."
         #else
          # echo -e "You'll never escape fooling around! Choose from the two options presented!"
	 fi

         if [[ "$creature" == Sneak* ]]; then
           echo -e "Any other resource sacrifice will make it nearly impossible to return to the ship with the Pythonioum, so you decide to sneak around the creature. \nYou carefully move to the edge of the cave, hugging the wall as you move towards the creature. As you approach the creature, you spy the motherload it defends: \na gleaming pile of Pythonioum! You hold back your excitement, modulating your emotions so you can continue to sneak without making a sound. \nYou finally make it to the stockpile, and are now within inches of the creature. You take the most dense chunks of Pythonioum you can carry, place them in your back cargo space, and face the creature, fearful of the trek back out the cave. \nDo you risk sneaking back around the creature, with all the Pythonioum on you, or do you attempt to battle the creature? (Sneak/Battle)"
           read fight
	 elif [[ "$creature" == Distract* ]]; then
           echo -e "You attempt to distract the creature by making noise, hoping it will move away from the Pythonioum. \nHowever, the creature is not easily fooled, and it quickly locates the source of the noise. \nWith surprising speed, it charges at you, its massive bulk knocking you to the ground. \nAs the creature looms over you, the last thing you see is its gaping maw closing in. \nTHE END - Bad Ending :( ."
         #else
          # echo -e "You'll never escape fooling around! Choose from the two options presented!"
	 fi

	 if [[ "$fight" == Battle* ]]; then
           echo -e "You know the risk of sneaking with the heavy Pythonium in your cargo hold - potentially smashing into each other - is too great. \nYou think back to your Star Training before you were given the keys to your own Starship, \nand recall that Pythonioum is universally poisonious to those without proper exterior protection. \nThinking fast, you grab a chunk of Pythonioum and chuck it at the gelatinous creature. It hits the creature with a thud, and it turns around and emits a monstrous roar. \nYou close your eyes, anticipating death, but instead are greeted with silence. Eyes opened, you see that the Pythonioum is gone, and the creature is deconstituting. \nThe Pythonioum seeped into the ooze of the creature, and poisoned it instantly, causing it to lose all integrity and begin to fall apart. \nYour path out the cave secured, you head out with your Pythonioum haul. Outside of the cave, you think of the best way back to the Starship with your minimal amount of Oxygen and lack of Thruster fuel. \nB4SH said the pythonioum can fuel the Hyperdrive - you wonder if it could also fule your thrusters. There is a risk of overcharging the thrusters, potentially causing a fatal explosion. \nDo you foot it back, risking oxygen deprivation, or try to fuel up with Pythonioum? (Walk/Fuel)"
           read homestretch
         elif [[ "$fight" == Sneak* ]]; then
           echo -e "Attempting to sneak around the creature with the heavy Pythonioum proves to be a poor decision. The weight of the minerals causes a misstep, and the creature immediately senses your presence. \nIt lets out a guttural roar and lunges towards you. With the Pythonioum weighing you down, you find it difficult to move quickly enough to escape. \nDespite your best efforts, the creature catches up to you and attacks, breaking your helmet, its noxious fumes overwhelming you in an instant. \nAs the darkness takes over, you realize that sneaking was a fatal mistake. \nTHE END - Bad Ending :( ."
         #else
           #echo -e "You'll never escape fooling around! Choose from the two options presented!"
	 fi

	 if [[ "$homestretch" == Fuel* ]]; then
           echo -e "Knowing you have mere minutes of oxygen left in the tank, you throw caution to the wind and melt down a chunk of Pythonioum with your Space Igniter to refuel your thrusters. \nYour thrusters quickly top out, and you activate them, fearful of an imminent explosion. Instead, you blast off into the sky, the fuel hyper boosting your thruster speeds! \nYou navigate back to the starship, where landing proves more difficult than flying. Thankfully, B4SH spots you hurtling towards the ground and helps to break your fall. \nB4SH is overjoyed to see you, in its robotic way. It signals to you that the repairs are complete, and gestures for the Pythonioum. \nYou hand over the dense minerals, and B4SH begins to melt it down. It melts halfway through your Pythonioum haul, when the space dragon descends out of the blue! \nYou have to think  quick! Do you: "
           echo -e "1. Abandon B4SH to it's fate as a decoy, take the rest of the Pythonioum, and fly off of Doomfall?"
           echo -e "2. Load the remaining Pythonioum into the starship weapons system and attempt to defeat the space dragon?"
           echo -e "3. Take B4SH and the remaining Pythonioum and hightail it out of Doomfall?" 
         read ch
         case $ch in
           1) echo -e "You leave B4SH behind as it attempts to distract the dragon with it's light laser defense system. \nWith the remaining Pythonioum in tow, you start the starship engines, and wait impatiently as all systems checkout OK. \nAs all the flight systems turn green, you watch the space dragon breath icy blue fire upon B4SH. \nAll it's lights flicker off as it freezes into a solid chunk of ice. The space dragon sets it's sights on you, but the systems are all go, and you engage the hyperdrive! \nBefore you can take off, however, tragedy strikes - the space dragon breathes it's ice flame on one of your starship's main thrusters, and hyperdrive is disengaged. \nYou narrowly escape complete devestation by the space dragon, but your ship can only hobble a few hundred clicks before it hurdles back again on Doomfall. \nWithout your trusty starship engineer, you appear to be marooned for good now. \nAll that effort and sacrifice in vain, you reflect on where it all went wrong, as your fate is left to the mercy of the cold, uncaring galaxy. \nTHE END - Bad Ending :( ."
              ;; 
           2) echo -e "You and B4SH rush over to the starship, Pythonioum in tow. You order B4SH to load the remaining Pythonioum into the starship's weapons system as you start the engine and hyperdrive. \nThe space dragon begins to breath it's icy flame onto the hull of the ship, and the onboard computer system reports hull integrity at 70% and falling. \nYou order B4SH to hurry as you sit in the targeting seat, readying the weapons. B4SH chirps in the affirmative, indicating the Plutonioum is armed and ready for fire. \nYou aim right at the space dragon's gaping maw, and fire all the plutonioum into the beast. \nIt pierces through it's icy breath, and it chokes on the poisonious minerals. Delighted with your aim, you shake off any excitement and initiate hyper jump. \nThe ship enters hyper space, but B4SH informs you that there is not enough plutonioum in the fuel tank to make a jump all the way home. \nYou will have to enter cryo sleep as you travel the second leg of the trip manually, with B4SH at the helm. You lament not being able to make a quick trip home, and hope that your loved ones are still alive when you finally arrive. \nB4SH cannot tell you how long the trip will take, so all you have is hope. You settle down for your long sleep, grateful to still be alive. \nTHE END - Good Ending!!"
              ;;
           3) echo -e "You and B4SH storm into the starship, determined to make it off the godforsaken planet that aims to be your tomb. \nB4SH starts all the starships systems, as you store the remaining Pythonioum in a cryosafe so that it can be melted down later for fuel. \nB4SH indicates the weapons system is online, so you can buy some time whle B4SH readies the Hyperdrive for a Hyper jump. \nYou shoot lasers a the space dragon, but it is completely ineffectual. \nAs the space dragon bears down on the starship, it's icy flame coating the starship in thick crystals of ice, the starships systems begin to fail. \nB4SH chirps frantically, and the cold truth begins to settle in - there is not enough time for the Hyperdrive to fully power on. \nAs the ice begins to break through the hull, you look at B4SH regretfully, knowing that Doomfall will be the final stop on your expedition. \nYou think back to your loved ones on Earth, and hope to see them again....on the otherside. /nTHE END - Bad Ending :( ."
              ;;
           *) echo -e "You'll never escape fooling around like this! Pick a valid option, 1 - 3!"
              ;;
         esac
         elif [[ "$homestretch" == Walk* ]]; then
	   echo -e "You decide to play it safe and walk to the ship, believing your superior conditioning will allow you to outrun your dwindling oxygen supply. /nYou begin running along the slippery icescape at a rapid clip, making great time. However, out of nowhere, the space dragon reappears! With no thruster fuel remaining or weapons to speak of, you spring harder than you've ever sprinted in your life. /nIt is not enough, however, as the space dragon swoops down on you, and with a thunderous roar, freezes you solid with it's icy flames. Doomfall will be your tomb. \nBad Ending :( ."
         fi

    echo -e "Would you like to try and escape Doomfall again? (Y/N): "
    read play_again
done
echo "Thank you for playing! Doomfall eagerly anticipated your return..."

