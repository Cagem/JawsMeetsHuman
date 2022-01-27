// @author Kyra Muhl
// @author Jona König

Human human;

// Function to draw the human object at given coordinates.
void drawHuman() {
  imageMode(CENTER);
  image(humanImg, human.position.x, human.position.y, human.width, human.height);
}

// Initializes the human vectors.
void initHuman() {
  PVector position = new PVector(paths.get(0).x + paths.get(0).width/2, paths.get(0).y + paths.get(0).height/2);
  PVector velocity = new PVector(0, 0);
  velocity.mult(3);

  human = new Human(position, velocity, humanImg.width, humanImg.height);
}

// Class for creating Human Objects.
class Human {
  PVector position;
  PVector velocity;
  float width;
  float height;
  float maxSpeed;
  float currentSpeed;
  float standardSpeed;
  int timeDelta;
  boolean isSwimming;

  // Constructor that is being called while creating a new Human Object.
  public Human(PVector position, PVector velocity, float humanWidth, float humanHeight) {
    this.position = position;
    this.velocity = velocity;
    this.width = humanWidth;
    this.height = humanHeight;

    this.maxSpeed = difficulty * 2; // Defines for how many frames the object can accelerate.
    this.standardSpeed = difficulty * 0.85;
    this.currentSpeed = this.standardSpeed; // Current speed of the human
    this.timeDelta = 0;

    this.isSwimming = false;
  }

  // Setter for currentSpeed
  void setCurrentSpeed(float currentSpeed) {
    this.currentSpeed = currentSpeed;
  }

  // Setter for position
  void setPosition(PVector position) {
    this.position = position;
  }

  // Setter for the velocity vector
  void setVelocity(float x, float y) {
    this.velocity.x = x;
    this.velocity.y = y;
  }

  // Function to increase the speed of the human depending on its environment.
  void increaseSpeed(float accelerationFactor) {
    if (this.isSwimming) {
      this.currentSpeed = difficulty * 0.45;
      this.resetTimeDelta();
    } else if (this.currentSpeed < this.maxSpeed) {
      this.currentSpeed = accelerationFactor * this.timeDelta + this.currentSpeed;
    }
  }

  // Function to let the human move
  void move() {
    this.position.add(this.velocity);
  }

  // Function to change the velocity (used if key gets pressed).
  void changeVelocity(float x, float y, float accelerationFactor) {
    this.increaseSpeed(accelerationFactor);
    this.setVelocity(x, y);
    this.velocity.mult(this.currentSpeed);
    this.increaseTimeDelta();
  }

  // Function to reverse the x coordinate of the velocity.
  void reverseXVelocity() {
    this.velocity.x *= -1;
  }

  // Function to reverse the y coordinate of the velocity.
  void reverseYVelocity() {
    this.velocity.y *= -1;
  }

  // Function to let the human respawn at the paths beginning.
  void respawn() {
    this.position = new PVector(paths.get(0).x + paths.get(0).width/2, paths.get(0).y + paths.get(0).height/2);
  }

  // Function to increase the time delta.
  void increaseTimeDelta() {
    this.timeDelta = this.timeDelta + 1;
  }

  // Function to reset the time delta.
  void resetTimeDelta() {
    this.timeDelta = 0;
  }
}
