
class Calculator{
  int height, weight;
  double bm;
  Calculator({this.height, this.weight});

  double bmi(){
    bm = double.parse(((weight)/((height*0.0254)*(height*0.0254))).toStringAsFixed(1));
    return bm;
  }

  int cat(){
    if(bm>25){
      return 3;
    }
    else if(bm>18.5){
      return 2;
    }
    else{
      return 1;
    }
  }
}
