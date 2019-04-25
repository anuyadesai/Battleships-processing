import processing.net.*; 

Server sv;
Client cl; 

String input;

int data[];

Unit[][] grid;

int gx=0, gy=0;

int cols = 15, rows = 10, nprint, c;

boolean mc = false;

int ship_selected = 0, n_ships = 5;
int p1loc;
boolean mccl, mp=true;
void setup() { 
  size(500, 500); 

  // Connect to the server’s IP address and port­

  cl = new Client(this, "127.0.0.1", 12345); // Replace with your server’s IP and port

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

  if (ship_selected < 5) {
    for (int i = 0; i < cols; i++) {     
      for (int j = 0; j < rows; j++) {

        grid[i][j].select_ship();
      }
    }
  }

 
  // Receive data from server
  if (cl.available() > 0) { 
    input = cl.readString(); 
    
    //input = input.substring(0, input.indexOf("\n"));  // Only up to the newline
    data = int(split(input, ' '));  // Split values into an array
    print( "data is here");

   
  }
  //int abcd=10;
  // if(abcd==10) {
  //    grid[data[0]][data[1]].colour(0);
  //  }
}



void mouseClicked() {
  mc=true;
}
