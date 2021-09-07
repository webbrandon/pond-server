# pond-server
Multiplayer gamer server for TheDuckyPond.com

## About TheDuckyPond.com

My son Laurence has began to love video games like most kids.  As he begins to enjoy games I remain cautious towards the benifits and drawbacks and thought how can I help engage gameplay to improve our bond and his intellect and understanding of technology.  We started with a simple game where we took a Google map of our neighborhood and a few sprites in a 2d game that we called "Glorywhite Street Monster Slayers".  That made him and me dream more about how he could engage with friends with his growing knowledge and wanted to expand our game to all the kids in the neighborhood.  So in order to fufill his desires I set out to learn the things needed to make a game like this and the result was a duck swimming in a pond with other ducks through a remote server.  I expand on this a bit and began deploying the game in a container to AWS Fargate.  

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
