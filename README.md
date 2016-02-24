# space-shooter
## Game Description:
This is a competitive game for 2-4 players. In this game, each player controls a spaceship. The goal of the game is to destroy other players. The spaceship is affected by gravity, and can fire missiles(or other weapons). The spaceships have limited power which automatically replenishes. There will be obstacles and power-ups in the map. 

## Game Objects:
* Spaceship
	Basically the avatar of the player. Takes damage when hit by a projectile or asteroid. Affected by a constant downward gravity, and the pulling force from the black holes. Has a direction. Can only accelerate and fire towards where it is facing. The power of the ship recovers automatically. Accelerations costs power. 
* Asteroid:
	Obstacles that have their own velocities. Can be destroyed by some projectiles. Occasionally fall from the space. 
* Black hole:
	Obstacles that have their own velocities. Draws the ships and certain projectiles. If a ship is pulled into the black hole, it will be trapped there for some time before the black hole disappears. 
* Projectiles:
  * Missile: Affected by gravity and black holes. Can damage asteroids. 
  * Beam: Unaffected by gravity or black holes. Costs power to fire. 
  * Blaster: Affected by gravity and black holes. Can damage asteroids. Deals low damage. Explodes when hits a target, blasting away everything in the range. 
  * Flame: Short range high damage weapon. Unaffected by gravity or black holes. Costs power to fire. 
  * Dark Matter: Flies slowly. Unaffected by gravity or black holes. Creates a black hole when hits the target or an asteroid. Deals no damage. Cost power to fire. 
* Power-ups:
Each power up lasts for a different amount of time. 
  * Speed-up: You accelerate faster for some time. 
  * Health pack: Heals you. 
  * Power generator: You generate power faster for some time. 
  * Anti-gravity: You ignore gravity and black holes for some time. 
  * Faster projectile: Your projectiles travel faster for some time. 
  * Scatter shot: You fire 3 projectiles at a time for some time. 
* The ground:
You die if you crash on it. 

## Game Control
* Rotate: Change the direction of the spaceship. The spaceship has no angular momentum. 
* Accelerate: Increase the velocity of the spaceship towards where it is facing. 
* Fire: Fire the selected weapon towards where the spaceship is facing. 
* Switch weapon: Change the selected weapon. 

## Game Flow

The game starts with the player selection screen. There can be up to 4 players. The players join by pressing the “firing” button for that player. The joined players then choose 3 weapons.(or randomly assign weapons). After all the players have chosen their weapons, press <Enter> to start the game. 

After 3 seconds of preparation time, the players can start fighting each other. Each game is expected to last for about 5 minutes. After the game ends, it goes back to the player selection screen. 
