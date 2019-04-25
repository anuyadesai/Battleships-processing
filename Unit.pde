class Unit {

  float x, y, w, h; //unit object in a grid that knows its location and size

  float gridlen, gridwid;
  boolean has_ship;

  //float hitg; 
  //Unit constructor
  Unit(int tempx, int tempy, int tempw, int temph) {
    x=tempx;
    y=tempy;
    w=tempw;
    h=temph;
    has_ship = false;
  }

  void display() {
    fill(255);
    stroke(0);
    rect(x, y, w, h);
  }

  void colour(float hit) {
    //hitg=hit;

    if (hit==-1) {
      fill(120, 120, 120);
      stroke(0);
      rect(x, y, w, h);
    } else if (hit==0) {
      fill(255, 0, 0);
      stroke(0);
      rect(x, y, w, h);
    } else if (hit==1) {
      fill(120);
      stroke(0);
      rect(x, y, w, h);
    }
  }

  void select_ship() {

    int gx, gy;
    //print("select called");
    if (mc == true) {
      if (has_ship==false) {  
        gx = int(floor(mouseX/c));
        gy = int(floor(mouseY/c));
        grid[gx][gy].colour(-1);
        print("selected");
        mc = false;
        ship_selected = ship_selected + 1;
        has_ship = true;
      }
    }
  }
}
