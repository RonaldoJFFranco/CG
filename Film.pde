public class Film{
  float largura;
  float altura;
  
  public Film(){}
  public Film(float largura, float altura) {
     this.largura = largura;
     this.altura = altura;
  }
  
  public float aspectRatio(){
    return largura/altura;
  }

}
