class Globo
{
  float x, y, vx, vy;
  float r, g, b; // Añadimos color para que se vean mejor
 
  Globo (float _x, float _y)
  {
    x = _x;
    y = _y; 
    vx = random(-0.25, 0.25);
    vy = random(-2, -0.5);
    // Colores aleatorios para darle variedad
    r = random(170, 255);
    g = random(0, 255);
    b = random(0, 255);
  }
 
  void update()
  {
    // He ajustado un poco los valores para que no salgan disparados tan rápido
    y += vy;
    x += vx;
  }
 
  void dibujate()
  {
    pushMatrix();      // Guarda el estado de la matriz
    translate(x, y, 0); // Mueve el "centro" del dibujo a la posición del globo
    fill(r, g, b);
    noStroke();
    sphere(40);        // Dibuja una esfera de radio 40
    popMatrix();       // Restaura la matriz para el siguiente globo
  }
}
 
ArrayList<Globo> globos;
 
void setup()
{
  size(640, 480, P3D);
  globos = new ArrayList<Globo>();  
}
 
void draw()
{
  background(20, 20, 30); // Un fondo más oscuro para que resalten las luces
  // Luces: sin esto, el 3D no se aprecia
  lights(); 
  directionalLight(255, 255, 255, 0, 1, -1);
 
  for(int i = 0; i < globos.size(); i++)
  {
    globos.get(i).update();
    globos.get(i).dibujate();
  }
}
 
void mousePressed()
{
  globos.add(new Globo(mouseX, mouseY));
}