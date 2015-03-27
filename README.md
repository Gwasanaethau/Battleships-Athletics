# Battleships-Athletics #

Battleships reloaded (again!) using the MVp → MVP approach based on the following user stories:

```
As a player
So that I can play the game
I would like a board to play on

As a player
So that I can play a more interesting game
I would like to have a range of ship sizes to choose from

As a player
So that I can prepare for the game
I would like to place a ship in a board location

As a player
So that I can create a layout of ships to fox my opponent
I would like to be able to choose the directions my ships face in

As a player
So that I can have a coherent game
I would like ships to be constrained to be on the board

As a player
So that I can have a coherent game
I would like ships to be constrained not to overlap

As a player
So that I can consider my next shot
I would like an overview of my hits and misses so far

As a player
So that I can play against a human opponent
I would like to play a two-player game

As a player
So that I can win the game
I would like to be able to fire at my opponents board

As a player
So that I know when to finish playing
I would like to know when I have won or lost
```

##Roadmap##

We currently have the following road map for the BDD development process, focussing on the required behaviour from the user stories, building the simplist solution at each step.

```
1. A ship be placed in a cell, hit the ship and it sinks.

2. A ship can be placed in a location on the board, when the ship is hit it sinks.

3. A ship can be placed in a location on the board, when the ship is hit it sinks, if not hit a miss is reported.

4. A ship can be placed in a location on the board, when the ship is hit it sinks, if not hit a miss is recorded. The game can be declared won or not.

5. A ship can be placed in a location, when the ship is hit it sinks, if not hit a miss is recorded. A shot cannot be fired at a location more than once.

MVP 1
6. MVP 1 + the board can have a set grid size.

7. MVP 1 + the board can have a set grid size + a ship can have a size and a direction.
MVP 2
7. MVP2 + more than one ship can be in play at a time, ships cannot overlap.
MVP 3
```

##Class Interfaces##

Board
- place(*ship, coordinate*)
- takes_hit(coordinate)
- won?
- cells

Ship
- hit
- sunk?

