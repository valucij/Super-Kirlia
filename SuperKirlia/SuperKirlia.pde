
  //Zastava za ispis, pomoc
  boolean b = true;
  //Zastava koja pokayuje koji se 
  int flag = 0;
  //Klasa za gumb na meniu. Prebacuje s menu-a na prvi level
  class ButtonMenu extends AbstractButton {
    void doFunction() {
      flag = 1;
    }
  }
  
  class ButtonExit extends AbstractButton{
    void doFunction(){
      exit();
    }
  }
  
  //Glavni lik, igrac njime upravlja
  Kirlia k2;
  Kirlia k1;
  Rectangle r1;
  Rectangle r2;
  Rectangle r3;
  Rectangle floor;
  Rectangle floor2;
  PImage prvi;
  PImage drugi;
  Rectangle[] r;
  Point[] coinPoints;
  //Coin coin;
  //int coinIndex;
  Enemy e;
 // int enemyTimer;
  Level l;
  Level l2;
  ButtonMenu menuButton;
  ButtonExit exitButton;
  PImage menu, won, lost;
  ArrayList<Level> allLevels;
  ArrayList<Rectangle> allFloors;
  int currentLevel;
  //Funckija koja postavlja sve na pocetku, i inicijalizira sve levele
  void setup() {
  
    size(1000, 800);
    menu = new PImage();
    menu = loadImage("menu.jpeg");
    
    lost = new PImage();
    lost = loadImage("lost.jpeg");
    
    won = new PImage();
    won = loadImage("won.jpeg");
    
    prvi = new PImage();
    prvi = loadImage("prva.jpeg");
    
    drugi = new PImage();
    drugi = loadImage("drugi.jpeg");
  
    menuButton = new ButtonMenu();
    menuButton.setX(380);
    menuButton.setY(460);
    menuButton.setHeight(113);
    menuButton.setWidth(260);
    
    exitButton = new ButtonExit();
    exitButton.setX(380);
    exitButton.setY(637);
    exitButton.setHeight(115);
    exitButton.setWidth(260);
  
    k2 = new Kirlia();
    k1 = new Kirlia();
    r1 = new Rectangle();
    r2 = new Rectangle();
    r3 = new Rectangle();
    floor = new Rectangle();
    floor2 = new Rectangle();
  
    
    //false
    r1.setX(361);
    r1.setY(442);
    r1.setH(45);
    r1.setW(316);
  
    //true
    r2.setX(7);
    r2.setY(325);
    r2.setH(45);
    r2.setW(535);
  
    //false
    r3.setX(582);
    r3.setY(465);
    r3.setH(45);
    r3.setW(327);
  
    k2.setOgX(400);//POTREBNO ISTO POSTAVITI NA POCETKU
    k2.setX(400);
    k2.setOgY(578);//POTREBNO ISTO POSTAVITI NA POCETKU
    k2.setY(578);
    k2.setHeigth(20);
    k2.setWidth(20);
    PImage tmpImg = loadImage("kirlia.png");
    k2.setImage(tmpImg);
    k2.scale(100, 90);
    
    k1.setOgX(400);
    k1.setX(400);
    k1.setOgY(578);
    k1.setY(578);
    k1.setHeigth(20);
    k1.setWidth(20);
    k1.setImage(tmpImg);
    k1.scale(100, 90);
  
    floor.setX(0);
    floor.setY(600);
    floor.setW(1000);
    floor.setH(300);
    
    floor2.setX(0);
    floor2.setY(600);
    floor2.setW(1000);
    floor2.setH(300);
  
    ArrayList<Rectangle> p = new ArrayList<Rectangle>();
    p.add(floor);
    p.add(r1);
   // p.add(r2);
    //p.add(r3);
    
    ArrayList<Rectangle> platforms2 = new ArrayList<Rectangle>();
    platforms2.add(floor2);
    platforms2.add(r2);
    platforms2.add(r3);
    
    k2.setCurrentlyAbove(floor);//postavljati prije ulaska u level
    k1.setCurrentlyAbove(floor2);//postavljati prije ulaska u level
   // coinIndex = 0;
  
    
    Point p1 = new Point(585, 585);
    Point p2 = new Point(220, 585);
    Point p3 = new Point(585, 420);
   
    ArrayList<Point> coinsP = new ArrayList<Point>();
    
    coinsP.add(p1);
    coinsP.add(p2);
    coinsP.add(p3);
  
  
    Point p4 = new Point(730, 445);
    Point p5 = new Point(100, 307);
    
    ArrayList<Point> coinsP2 = new ArrayList<Point>();
    coinsP2.add(p1);
    coinsP2.add(p2);
    coinsP2.add(p4);
    coinsP2.add(p5);
   
    e = new Enemy();
    e.setX(370);
    e.setY(270);
    e.setOgX(300);
    e.setOgY(550);
    e.setHeigth(50);
    e.setWidth(30);
    e.setDistance(30);
    tmpImg = loadImage("e1.png");
    e.setImage(tmpImg);
    e.scale(250,150);
   
    l = new Level(3, k2, null, coinsP, p, prvi);
    l2 = new Level(5, k1, e, coinsP2, platforms2, drugi);
    
    currentLevel = 0;
    allLevels = new ArrayList<Level>();
    allLevels.add(l);
    allLevels.add(l2);
  }
  
  //Funckija koja crta trenutni ekran.
  //0 - crta se menu
  //1 - crta se level
  //2 - crta se zadnji ekran/zavrsetak, ali pobjeda
  //3 - crta se zadnji ekran/zavrsetak, ali gubitak 
  void draw() {
  
    //demoButton.draw();
    if (flag == 1) {
      if(currentLevel == 0){
        flag = l.draw();
      }else if(currentLevel == 1){
        flag = l2.draw();
      }
      
    } else if (flag == 0) {
     // background(255);
       background(menu);
    //  menuButton.draw();
    //  exitButton.draw();
    } else if (flag == 2 ) {
      //background(170);
      currentLevel++;
      //println(currentLevel + " " + allLevels.size());
      if(currentLevel >= allLevels.size()){
        //println("da");
         background(won);  
      }else{
        flag = 1;
        int tmpH = l.getHealt();
        int tmpP = l.getPoints();
        l2.setHealth(tmpH);
        l2.setPoints(tmpP);
      }
      
    }else if(flag == 3){
      background(lost);
    }
  
    //SAMO PROVJERA ZA MENE
    if (b) {
      println(flag);
      b = false;
    }
  
    //PROVJERA ZA MENE, ali nesto slicno ce biti sa zadnjim ekranima
    if (flag == 2) {
      println("Pobjeda");
    } else if (flag == 3) {
      println("Gubitak!");
    }
  }
  
  //Funkcija koja se poziva kad se pritisne tipka na misu
  void mousePressed() {
    //demoButton.mousePressed();
    if (flag == 0) {
      menuButton.mousePressed();
      exitButton.mousePressed();
    } else if (flag == 1) {
      l.mousePressed();
    }else if(flag == 2 || flag == 3){
      flag = 0;
    }
  }
  //Funkcija koja se poziva kad se pritisne tipka na tipkovnici
  void keyPressed() {
    l.keyPressed();
    l2.keyPressed();
  }
  //Funckija koja se zove kad se otpusti tipka na tipkovnici
  void keyReleased() {
    l.keyReleased();
    l2.keyReleased();
  }
