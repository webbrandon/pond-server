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
