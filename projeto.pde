void setup() {
  size(500, 500);
  
  RenderOptions option = new RenderOptions(500,500,1,4,4,4,2.0,2.2,0);
  Camera camera = new Camera(radians(45.5), new Film(option.largura,option.altura), new PMatrix3D());
  
  camera.lookAt(new PVector(0,0,10.0), new PVector(0,0,0), new PVector(0,1.0,0));
  
  Sphere sphere = new Sphere(new PVector(0,0,0),2.0,null,false,null);
  
  ArrayList<Shape> shapes = new ArrayList();
  shapes.add(sphere);
  
  Scene scene = new Scene(shapes);
  
  Renderer renderer = new Renderer(option,camera,scene);
  image(renderer.render(),0,0);
   noLoop();
 }

//loop
void draw() {
} 
