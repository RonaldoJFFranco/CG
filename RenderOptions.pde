public class RenderOptions{
  int largura;
  int altura;
  int maximumDepth;
  int cameraSamples;
  int lightSamples;
  int diffuseSamples;
  float filterWidth;
  float gamma;
  float exposure;
  
  public RenderOptions(){}
  public RenderOptions(int largura, int altura, int maximumDepth, int cameraSamples, int lightSamples, int diffuseSamples, float filterWidth, float gamma, float exposure){
    this.largura = largura;
    this.altura = altura;
    this.maximumDepth = maximumDepth;
    this.cameraSamples = cameraSamples;
    this.lightSamples = lightSamples;
    this.diffuseSamples = diffuseSamples;
    this.filterWidth = filterWidth;
    this.gamma = gamma;
    this.exposure = exposure;
  }

}
