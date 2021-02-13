class Calculator{
  Calculator({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calciBMI(){
    _bmi=weight/(height*height*0.01*0.01);
    return _bmi.toStringAsFixed(1);
  }
  String result(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>=18.5){
      return 'Normal';
    }else{
      return "Underweight";
    }
  }
  String comments(){
    if(_bmi>=25){
      return 'You need to start exercising';
    }else if(_bmi>=18.5){
      return 'You are perfect';
    }else{
      return "You have a lower body weight\nStart eating more";
    }
  }

}