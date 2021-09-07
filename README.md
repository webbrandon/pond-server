# pond-server
Multiplayer gamer server for TheDuckyPond.com

## USAGE

**Environment Values**  
- POND_SERVER_PORT(default: 3000): Set port game server gets served from.
- POND_SERVER_MAX_PLAYERS(default: 50): Set how many players can join game server.

To launch the game server on a localhost you can use the "Makefile" included with this repository to build and run.

### Build a local container:

First you will need to build in your local Godot editor for linux headless deployment export.  Move exports to relative path of repository base `./release` then run the below command.

```
make build
```

You now have a local container that you can push publicly or run on localhost with the following command:

```
make run
```

## About TheDuckyPond.com

My son Laurence has began to love video games like most kids.  As he begins to enjoy games I remain cautious towards the benefits and drawbacks and thought how can I help engage gameplay to improve our bond and his intellect and understanding of technology.  

We started with a simple game where we took a Google map of our neighborhood and a few sprites in a 2D game that we called "Glorywhite Street Monster Slayers".  That made him and I dream about how to engage with his friends in Covid conditions and he wanted to expand our game to all the kids in the neighborhood.  He also wanted a 3D game and I needed an easier way to make his characters and thought there would be value in a simple game model to learn from in 3D from my experience.  

So in order to fulfill his desires I set out to learn the things needed to make his game and the result was a duck swimming in a pond with other ducks through a remote server. It is basically a multiplayer "hello world" Godot tutorial I created for myself. 

I expand on this a bit and began deploying the game in a container to AWS Fargate.  In the end I am trying to understand how to help him making his imagination come to life and how to develop an end to end testing and release framework for his games with friends. Guess we're starting a small game company for kids where games are designed by kids but we don't make any money.
