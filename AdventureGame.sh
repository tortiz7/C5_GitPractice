#!/bin/bash

shopt -s nocasematch
echo -e "Hello, brave space traveller. It is a cold, lonely universe out there - the choices you make will determine if you'll make it back home alive. \nI fear the wrong choice could lead to....certain doom!"

while true; do
  echo -e "Surely you embarked on this journey with your trusty robot companion B4SH, yes? (Yes\No)"
  read companion

  if [[ "$companion" == Yes* ]]; then
    echo -e  "B4SH informs you that your starship is no longer space-ready, and you have been marooned on the planet Doomfall. \nB4SH is an experienced starflight technician however, and can repair the hyperdrive if you can find it a dense crystal of Pythonioum. \nWill you procure the Pythonioum? (Yes or No)"
    read choice
  fi
 
  if [[ "$choice" == Yes* ]]; then
    echo -e "B4SH seems emboldened by your bravery, it's chirps signaling joy. \nIt produces a holographic map of your imposing surroundings, the surface of Doomfall full of craters, valleys, and icesheets from a bombardment long forgotten. \nB4SH highlights a glowing cavern several clicks away, steam pouring out of its mouth. The Pythonium will surely be found here, B4SH signals. \nYou begin your trek towards the smoke-breathing cavern, delicately traversing the ice sheets underfoot. \n4 clicks from B4SH, you hear a faint grumbling sound, and feel a rumbling shaking the ice from the direction of the sound. To your right, a jagged mountain beckons. Do you proceed forward, or mantle the mountain? (Forward\Mantle)?"
    read movement
  fi
   
  if [[ "$movement" == Mantle* ]]; then
    echo -e "You wisely decide to take your chances climbing the mountain. You check your thrusters and are relieved to see fuel reserves remain intact after your crash landing. \nYou begin climbing the icy rockface of the mountain, boosting with your thrusters at the midway point when the ice becomes too slippery, and the surface too steep.\n Once at the top of the moutain, you see the source of the sound - an ashen space-dragon, nostrils flared, tail blazing an icy blue. \nYou steel yourself, and contemplate the next move: do you return to B4SH in the hopes of charting another course to the Pythonium, or do you try to circumvent the space dragon? \n(Return/Circumvent)"
    read space_dragon
  fi

  if [[ "$space_dragon" == Circumvent* ]]; then
    echo "Deciding you've ventured too far to go back now, you begin to descend the mountain, hoping to sneak around the dragon. \nAs you reach the foot of the mountain, the sheer size of the dragon comes into view, it's towering scales an omen of doom. \nHow to get past the dragon? Do you make a run for it, or fashion a distraction out of your remaining thruster fuel, making the trek back from the cave more dangerous? (Run/Distraction)"
    read sneak
  fi

  if [[ "$sneak" == Distraction* ]]; then
    echo "You remove the fuel reserves from your ankle, rendering your thrusters useless. With your trusty Space igniter, you light the thruster fluid on fire and quickly launch it in the direction of the space dragon. \n The fuels roars forward, stealing all the attention of the dragon, who flies after the shooting star, hoping for a good meal. With the space dragon gone, you proceed towards the smoke spewing cave, now only a handful of clicks away. \n The rest of the trek is relatively smooth, and you now stand before the mouth of the cave. The smoke is hot and dense, and your sensors indicate it is noxious too. To avoid a poisonous death, you'll need to triple your Oxygen usage, in order to create a synthetic Oxygen net to keep the poison out of your suit. \n This could prove disatrous, but your only other option would be to return to B4SH and come back to the cave with the poison-immune robot - but then who will repair the ship? (Oxygen/Return)"
    read cave_choice
  fi

  
# Ask if the player wants to play again
  echo "Do you want to play again? (yes\no)"
  read play_again

  if [ "$play_again" != "yes" ]; then
    echo "Thanks for playing! Goodbye!"
    break
  fi

done
