public class Renderer{
  RenderOptions options;
  Camera camera;
  Scene cena;
  
  public Renderer(){}
  public Renderer(RenderOptions options, Camera camera, Scene cena){
    this.options = options;
    this.camera = camera;
    this.cena = cena;
  }

public PVector trace(Ray ray, int depth){
    Intersection intersection = cena.intersects(ray);
    if(intersection.hit)
      return new PVector(1, 1, 1);
    return new PVector(0, 0, 0);
  }
 
  public PVector computeIndirectIllumination(BSDF bsdf, ShaderGlobals shaderGlobals, int depth){
    return null;
  }

  
   public PVector computeDirectIllumination(BSDF bsdf, ShaderGlobals shaderGlobals){
    return null;
  }
  
  
  public PImage render(){
    
    PImage pImage = createImage(options.largura, options.altura, RGB);
    
    for(int i = 0; i < options.largura; i++){
     for(int j = 0; j < options.altura; j++){
       
       ArrayList<PVector> samples = stratifiedSample(options.cameraSamples);
       
       PVector pVector = new PVector(0, 0, 0);
       float totalWeight = 0;
       
       for(int k = 0; k < options.cameraSamples; k++){
         
         PVector sample = PVector.mult(samples.get(k).sub(new PVector(0.5, 0.5)), options.filterWidth);
         Ray ray = camera.generateRay(i, j, sample);
         float weight = gauss2D(sample, options.filterWidth);
         
         pVector.add(PVector.mult(trace(ray, 0), weight));
         totalWeight += weight;
         
       }
       pVector.div(totalWeight);
       pImage.set(i, j, (int)saturate(exposure(gamma(pVector, options.gamma), options.exposure)) * 255);
     }
   }
    return pImage;
  }

}
