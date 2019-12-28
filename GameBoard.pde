class GameBoard {
  private int[][] track = {

    {5, 1, 1, 6}, 
    {2, 5, 1, 3}, 
    {2, 4, 1, 6}, 
    {4, 1, 1, 3}, 
  };
  private int[] startingChunk = {1, 3};
  private int startingHeading = 0; //0 = right, 1 = down, 2 = left, 3 = up
  Chunk[] chunks;

  int numberOfColumns;
  int numberOfRows;
  int gamePosX;
  int gamePosY;

  float chunkSize;

  GameBoard(int gamePosX, int gamePosY, int gameWidth, int gameHeight) {
    this.gamePosX = gamePosX;
    this.gamePosY = gamePosY;

    numberOfColumns = track[0].length;
    numberOfRows = track.length;

    if (gameWidth / numberOfColumns > gameHeight / numberOfRows) {
      chunkSize = gameHeight / numberOfColumns;
    } else {
      chunkSize = gameWidth / numberOfRows;
    }

    chunks = loadChunks(track);
  }

  void display() {
    stroke(0);
    strokeWeight(3);
    pushMatrix();
    translate(this.gamePosX, this.gamePosY);
    fill(gameBoardColor);
    rect(0, 0, gameSize, gameSize);
    for (Chunk chunk : chunks) {
      chunk.display();
      noFill();
      strokeWeight(1);
      //rect(chunk.posX, chunk.posY, chunkSize, chunkSize);
    }
    PVector start = this.getStartingPos();
    strokeWeight(10);
    stroke(255, 0, 0);
    point(start.x, start.y);
    popMatrix();
  }

  Chunk[] loadChunks(int[][] track) {
    int nRow = track.length;
    int nCol = track[0].length;
    int id = 0;

    Chunk[] chunks = new Chunk[nRow * nCol];
    for (int i = 0; i < nRow; i++) {
      for (int j = 0; j < nCol; j++) {
        int type = track[i][j];
        float posX = chunkSize * j;
        float posY = chunkSize * i;
        chunks[id] = new Chunk(posX, posY, chunkSize, type, id);
        id++;
      }
    }
    return chunks;
  }
  PVector getStartingPos() {
    float x = startingChunk[0]*chunkSize + chunkSize/2 ;
    float y = startingChunk[1]*chunkSize + chunkSize/2 ;
    return new PVector(x, y);
  }
  float getStartingHeading() {
    return startingHeading * HALF_PI;
  }
  int getCurrentChunkID(float x, float y) {
    int col = (int)map(x, 0, gameSize, 0, numberOfColumns);
    int row = (int)map(y, 0, gameSize, 0, numberOfRows);
    int ID = row * numberOfRows + col;
    return ID;
  }
  Chunk getCurrentChunk(int ID) {
    for (Chunk chunk : chunks) {
      if (chunk.id == ID) {
        return chunk;
      }
    }
    return null;
  }
}
