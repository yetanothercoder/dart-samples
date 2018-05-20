// Define a function.
import 'dart:convert';

printInteger(int aNumber) {
  print("The number is $aNumber."); // Print to console.
}

/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

class Point {
  num _x, y;

  Point(this._x, this.y);

  // Named constructor
  Point.origin() {
    _x = 0;
    y = 0;
  }

  @override
  String toString() => "x=$_x/y=$y";

}

// This is where the app starts executing.
main() {
  var d = r"41";

  var number = int.parse(d); // Declare and initialize a variable.
  assert(41 == number);
  const num myNum= 2;

//  number = null;
  printInteger(number); // Call a function.
  print(number.runtimeType);
  print(myNum.runtimeType);


  var sb = new StringBuffer();
  sb..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');


  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);



  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  print(gifts.runtimeType);


  print("gifts map: `$gifts`, and noble: `$nobleGases`");

  print(#g);


  String say(String from, String msg, [String device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  void doStuff(
      {List<int> list = const [1, 2, 3],
        Map<String, String> gifts = const {
          'first': 'paper',
          'second': 'cotton',
          'third': 'leather'
        }}) {
    print('list:  $list');
    print('gifts: $gifts');
  }

  doStuff(list: [3,4], gifts: {});


  var loudify = (msg) {
    return '!!! ${msg.toUpperCase()} !!!';
  };

  assert(loudify('hello') == '!!! HELLO !!!');


  var add2 = makeAdder(2);

  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);


  // Comparing instance methods.
  var v = new A(); // Instance #1 of A
  var w = new A(); // Instance #2 of A
  var y = w;
  var x = w.baz;

  print(x is Function);
  print(identical(y, w));

  var command = 'OPEN';
  switch (command) {
    case 'OPEN':
      print(1);
  // ERROR: Missing break
  break;

    case 'CLOSED':
      print(2);
      break;
  }

  try {
//    throw new FormatException("77");
      throw 'Епта!';
  } /*on Exception */catch (e, s) {
    print("very bad error: `$e`, stack-trace: $s");
  }

  var jsonData = jsonDecode('{"x":1, "y":2}');

  // Create a Point using Point().
  var p1 = new Point(2, 2);

// Create a Point using Point.fromJson().
  var p2 = new Point.origin()
  .._x=3
  ..y=4;

  print("p1=$p1 p2=$p2");
}

