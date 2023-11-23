// import 'dart:svg';

void main(){
  String? name = 'eric';
  String? result = name??'none';
  result ??='none' ;

  name = null;
  print(name?.length);

  bool flowerIsBeautiful1 = isBeautiful("flower") as bool;
  bool flowerIsBeautiful2 = isBeautiful("123")!;
  bool flowerIsBeautiful3 = isBeautiful("123")??false;




  List<int>? myList = [1, 2, 3];
  myList =null;
  print(myList?[2]);

  User? user = User();
  // user = null;

  user 
    ?..name = 'Ray' ..id =42;

  print('${user.name} - ${user.id}');

  String ? lengthUserName = user?.name?.length.toString();
  print(lengthUserName);
}

class User{
  String? name;
  int? id;
}

bool? isBeautiful(String? item){
  if(item=="flower") return true;
  else if(item == "garbage") return false;
  
  return null;
};

bool isLong(String? text){
  if(text == null) return false;

  return text.length > 100;
}

class TextWidget{
  String? text;

  bool isLong1(){
    if(text == null) return false;

    // makeNull 실행 되지 않을 것임을 확신.
    return text!.length > 100;
  }
  
  bool isLong2(){
    final txt = this.text;
    if(txt == null) return false;

    // makeNull 실행 되지 않을 것임을 확신.
    return txt.length > 100;
  }

  void makeNull(){
    text = null;
  }
}