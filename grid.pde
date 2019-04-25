import processing.net.*; //<>//

Server sv; 
Client cl;
int data[]; 
String input;
Unit[][] grid;


// Number of columns and rows in the grid
int cols = 15, rows = 10, nprint, c;

boolean mc = false;

int ship_selected = 0, n_ships = 5;
int p1loc;
boolean mccl, mp=true;


void setup() {
  size(500, 500);

  sv = new Server(this, 12345);  // Start a simple server on a port

  grid = new Unit[cols][rows];
  c=50;

  // The variables i and j are counters for column and row numbers
  // In this example, they are used as arguments to the constructor for each object in the grid.
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Unit(i*c, j*c, c, c);
    }
  }

  background(0);

  for (int i = 0; i < cols; i++) {     
    for (int j = 0; j < rows; j++) {

      grid[i][j].display();
    }
  }
}

void draw() {


  //select ship location
  if (ship_selected < 5) {
    for (int i = 0; i < cols; i++) {     
      for (int j = 0; j < rows; j++) {

        grid[i][j].select_ship();
        if (grid[i][j].has_ship) {
        }
      }
    }
  }

  //establish communication
  if (mp==true) {
    int gxa, gya; 
    gxa = int(floor(mouseX/c));
    gya = int(floor(mouseY/c));
    sv.write(gxa + ' ' + gya);
   print(" data sent ");
    mp=false;
  }

  cl = sv.available();
  if (cl != null) {
  
    
    input = cl.readString(); 
    input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    data = int(split(input, '+'));  // Split values into an array
      print(" data received ");
    // check received coords
  //  if (grid[data[0]][data[1]].has_ship == true) {
  //    grid[data[0]][data[1]].colour(0);
  //  }
  }
}




void mouseClicked() {
  mc=true;
}

void mousePressed() {
  mp=true;
}
