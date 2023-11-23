void main(){
  var stringBuffer = StringBuffer();
  String firstName = "Sunwoo";
  String lastName = "Sunwoo";
  var sentence = "My name is ";
  var rst = sentence + firstName + " Kim";

  stringBuffer.write(sentence);
  stringBuffer.write(firstName);
  stringBuffer.write(" Kim\u2665");
  print(rst);
  print(stringBuffer.toString());
  print("My name is $firstName ${lastName.toUpperCase()}");
}