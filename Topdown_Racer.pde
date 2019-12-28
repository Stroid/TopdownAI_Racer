ArrayList<Character> input_keys = new ArrayList();
color backgroundColor = #000000;
color gameBoardColor = #000000;
color trackColor = #000000;
color strokeColor = #00BC14;

int gamePosX = 0;
int gamePosY = 0;
int gameWidth = 800;
int gameHeight = 800;
int gameSize;
GameBoard gameBoard;
Racer racer;
GUI gui;

void setup() {
  size(1000, 800);
  if (gameWidth < gameHeight) {
    gameSize = gameWidth;
  } else {
    gameSize = gameHeight;
  }
  gameBoard = new GameBoard(gamePosX, gamePosY, gameSize, gameSize);
  racer = new Racer(gameBoard);
  gui = new GUI(800,0,200,800);
}

void draw() {
  //println(frameRate);
  background(backgroundColor);

  gameBoard.display();
  racer.display();
  racer.update();
  
  gui.addText("Topdown racer");
  gui.addSpaces(4);
  gui.addText("Last laptime:");
  gui.addLaptime(racer.lastLapTime);
  gui.addText("Best laptime:");
  gui.addLaptime(racer.bestLapTime);
  gui.display();
}




void keyHandler() {
  if (input_keys.contains('w')) ;
  if (input_keys.contains('a')) ;
  if (input_keys.contains('d')) ;
  if (input_keys.contains('s')) ;
}

void keyPressed() {
  if (!input_keys.contains(key)) {
    input_keys.add(key);
  }
}

void keyReleased() {
  if (input_keys.contains(key)) {
    input_keys.remove((Character) key);
  }
}
