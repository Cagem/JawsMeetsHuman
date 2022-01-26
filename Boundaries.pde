// @author Kyra Muhl

boolean victory = false;

// Checks if the position vector is colliding with the boundary
// If it collides, the velocity will be inverted
void checkBoundaryCollision(PVector position, PVector velocity, float objWidth, float objHeight) {
  if (position.x + objWidth/2 + velocity.x > width) {
    velocity.x *= -1;
  } else if (position.x + velocity.x - objWidth/2 < 0) {
    velocity.x *= -1;
  } else if (position.y + objHeight/2 + velocity.y > height) {
    velocity.y *= -1;
  } else if (position.y + velocity.y - objHeight/2 < 0) {
    velocity.y *= -1;
  }
}

boolean isSharkHorizontallyOnTile(Path path) {
  return (shark.position.x + shark.width/2 + shark.velocity.x > path.x && 
    shark.position.x + shark.velocity.x - shark.width/2 < path.x + path.width && 
    shark.position.y + shark.height/2 > path.y && 
    shark.position.y < path.y + path.height);
}

boolean isSharkVerticallyOnTile(Path path) {
  return (shark.position.x + shark.width/2 > path.x && 
    shark.position.x < path.x + path.width && 
    shark.position.y + shark.height/2 + shark.velocity.y > path.y && 
    shark.position.y + shark.velocity.y - shark.height/2 < path.y + path.height);
}

void checkPathCollisionShark() {
  if (!shark.isJumping) {
    // iterate over the obstacles
    for (int i = 0; i < paths.size(); i++) {
      boolean hasSharkStoppedJumping = !shark.isAllowedToJump && blockedJumpTimer < 50;

      // check collision for this obstacle
      Path path = paths.get(i);

      // check X movment
      if (isSharkHorizontallyOnTile(path)) {
        if (hasSharkStoppedJumping) {
          resetBlockedJumpTimer();
          shark.respawn(width, height);
        } else {
          shark.reverseXVelocity();
        }
      }

      // check Y movement
      if (isSharkVerticallyOnTile(path)) {


        if (hasSharkStoppedJumping) {
          resetBlockedJumpTimer();
          shark.respawn(width, height);
        } else {
          shark.reverseYVelocity();
        }
      }
    }
  }
}

boolean isHumanHorizontallyOnTile(Path path) {
  return (human.position.x + human.width/2 + human.velocity.x > path.x && 
    human.position.x + human.velocity.x - human.width/2 < path.x + path.width && 
    human.position.y + human.height/2 > path.y && 
    human.position.y < path.y + path.height);
}

boolean isHumanVerticallyOnTile(Path path) {
  return (human.position.x + human.width/2 > path.x && 
    human.position.x < path.x + path.width && 
    human.position.y + human.height/2 + human.velocity.y > path.y && 
    human.position.y + human.velocity.y - human.height/2 < path.y + path.height);
}

boolean isHumanOnLastTile() {
  Path lastTile = paths.get(paths.size()-1);

  return (human.position.x + human.width / 2 > lastTile.x &&
    human.position.x + human.width / 2 < lastTile.x + lastTile.width &&
    human.position.y + human.height / 2 > lastTile.y &&
    human.position.y + human.height / 2 < lastTile.y + lastTile.width);
}

boolean isHumanOnPath() {
  for (int i = 0; i < paths.size(); i++) {
    Path path = paths.get(i);

    if (isHumanHorizontallyOnTile(path) && isHumanVerticallyOnTile(path)) {
      return true;
    }
  }

  return false;
}

void checkHumanTileBoundary() {
  if (!isHumanOnPath() && !showLifePreserver && !human.isSwimming) human.isSwimming = true;
  else if (isHumanOnPath() || showLifePreserver) human.isSwimming = false;

  // Checks whether the human got to the last tile of the path in which case he wins and the game should end (victory = true).
  if (isHumanOnLastTile()) {
    canvasImg = get(); // Takes a screenshot of the canvas which is then utilized in drawMenuScreen().
    victory = true;
  }
}

void checkFigureCollision() {
  if (shark.position.x + shark.width / 2 > human.position.x - human.width / 2 && 
    shark.position.x - shark.width / 2 < human.position.x + human.width / 2 && 
    shark.position.y + shark.height / 2 > human.position.y - human.height / 2 && 
    shark.position.y - shark.height / 2 < human.position.y + human.height / 2) {

    reduceLife();
    shark.respawn(width, height);
    human.respawn();
  }
}

void checkItemCollision() {
  if (human.position.x + human.width / 2 > rubberRing.x - rubberRingWidth / 2 && 
    human.position.x - human.width / 2 < rubberRing.x + rubberRingWidth / 2 && 
    human.position.y + human.height / 2 > rubberRing.y - rubberRingWidth / 2 && 
    human.position.y - human.height / 2 < rubberRing.y + rubberRingWidth / 2) {
    showLifePreserver = true;
    initRubberRing();
  }
}
