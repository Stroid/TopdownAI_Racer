class Chunk {
  float posX; //X Possition of the cunk
  float posY; //Y Possition of the cunk
  float size; //width and height of the chunk
  float trackWidth; // Track width
  int type; //with type of chunk it is
  int id;   //the id of the cunk

  Chunk(float posX, float posY, float size, int type, int id) {
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.type = type;
    this.id = id;
    this.trackWidth = size * 0.75;
  }


  boolean onTrack(float racer_x, float racer_y) {
    float delta_x = racer_x - this.posX;
    float delta_y = racer_y - this.posY;

    float line1 = (size - trackWidth) / 2; 
    float line2 = line1 + trackWidth;

    if (this.type == 1) {
      //Horisontal lines
      if (delta_y > line1) {
        if (delta_y < line2) {
          return true;
        }
      }
    } else if (this.type == 2) {
      //Vertical lines
      if (delta_x > line1) {
        if (delta_x < line2) {
          return true;
        }
      }
    } else if (type == 3) {
      //Arc top-left
      if (dist(0, 0, delta_x, delta_y) > line1) {
        if (dist(0, 0, delta_x, delta_y) < line2) {
          return true;
        }
      }
    } else if (type == 4) {
      //Arc top-right
      if (dist(size, 0, delta_x, delta_y) > line1) {
        if (dist(size, 0, delta_x, delta_y) < line2) {
          return true;
        }
      }
    } else if (type == 5) {
      //Arc bottom-left
      if (dist(size, size, delta_x, delta_y) > line1) {
        if (dist(size, size, delta_x, delta_y) < line2) {
          return true;
        }
      }
    } else if (type == 6) {
      //Arc bottom-right
      if (dist(0, size, delta_x, delta_y) > line1) {
        if (dist(0, size, delta_x, delta_y) < line2) {
          return true;
        }
      }
    }  
    return false;
  }


  void display() {
    textAlign(LEFT, TOP);
    fill(255, 0, 0);
    strokeWeight(3);
    pushMatrix();
    translate(this.posX, this.posY);
    //rect(0, 0, size, size);
    if (this.type == 0) {
      //Blank chunk
      rect(0, 0, this.size, this.size);
    } else if (this.type == 1) {
      //Strait horisontal chunk
      drawStraitChunk(0);
    } else if (this.type == 2) {
      //Strait vertical chunk
      drawStraitChunk(1);
    } else if (this.type == 3) {
      //top left curved chunk
      drawCurvedChunk(0);
    } else if (this.type == 4) {
      //top right curved chunk
      drawCurvedChunk(1);
    } else if (this.type == 5) {
      //bottom right curved chunk
      drawCurvedChunk(2);
    } else if (this.type == 6) {
      //bottom left curved chunk
      drawCurvedChunk(3);
    }
    popMatrix();
  }

  private void drawCurvedChunk(int dir) {
    stroke(strokeColor);
    pushMatrix();
    if (dir == 1) {
      rotate(HALF_PI);
      translate(0, -size);
    } else if (dir == 2) {
      rotate(PI);
      translate(-size, -size);
    } else if (dir == 3) {
      rotate(PI + HALF_PI);
      translate(-size, 0);
    }

    float outside_curve = size + trackWidth;
    float inside_curve = size - trackWidth;
    fill(trackColor);
    arc(0, 0, outside_curve, outside_curve, 0, HALF_PI);
    fill(gameBoardColor);
    arc(0, 0, inside_curve, inside_curve, 0, HALF_PI);
    popMatrix();
  }

  private void drawStraitChunk(int dir) {
    float line1 = size/2 + trackWidth/2; 
    float line2 = size/2 - trackWidth/2;
    pushMatrix();
    if (dir == 1) {
      rotate(PI / 2);
      translate(0, -size);
    }
    noStroke();
    fill(trackColor);
    rect(0, line2, size, trackWidth);
    stroke(strokeColor);
    line(0, line1, size, line1);
    line(0, line2, size, line2);
    popMatrix();
  }
}
