class GUI {
  int x;
  int y;
  int w;
  int h;
  ArrayList<String> textList;
  int textSize = 20;
  GUI(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    textList = new ArrayList();
  }

  void display() {
    pushMatrix();
    translate(this.x, this.y);
    stroke(strokeColor);
    fill(gameBoardColor);
    rect(10, 10, this.w - 20, this.h - 20);
    fill(strokeColor);
    textSize(textSize);
    displayText();
    popMatrix();
    textList.clear();
  }
  void displayText() {
    pushMatrix();
    for (String text : textList) {
      text(text, 20, textSize / 2);
      translate(0, textSize);
    }
    popMatrix();
  }
  void addText(String text) {
    textList.add(text);
  }
  void addSpaces(int spaces) {
    for (int i = 0; i < spaces; i++) {
      this.addText("");
    }
  }
  void addLaptime(int time) {
    int seconds = floor(time / 1000);
    int millis = time % 1000;
    addText(seconds + ":" + millis);
  }
}
