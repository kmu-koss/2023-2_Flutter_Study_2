void main(List<String> args) {
  Sex gender = Sex.male;

  if(gender == Sex.male){
    print("일어 선다.");
  }
  else{
    print("앉아 있는다.");
  }

  EatChicken status = EatChicken.none;
  
  switch(status){
    case EatChicken.none:
      // TODO: Handle this case.
  }
}

enum Sex{
  male,
  female
}

enum EatChicken{
  none,
  findNumber,
  callStore,
  orderChicken,
  deliveredChicken,
  eatChicken
}