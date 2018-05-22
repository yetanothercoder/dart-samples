// Define a function.
import 'dart:async';
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

foo1() async { return 42; }

void addStringToList(List<dynamic> list) { // tried List<Object> or just List - same
  list.add("my");
}

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
main() async {
  
  List<int> intList = [1,2,7,8,9,0,0];
  addStringToList(intList);
  print("my list type of ${intList.runtimeType}: $intList");
  
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


  var ip1 = const ImmutablePoint(1,2);
  var ip2 = const ImmutablePoint(1,2);
  assert(identical(ip1, ip2));


  final v1 = new Vector(2, 3);
  final v2 = new Vector(2, 2);

  assert((v1 + v2).x == 4 && (v1 + v2).y == 5);


  var musician = new Musician("Misha");
  musician.entertainMe();
  print("musician=$musician");

  runAsyncs();


  SortedCollection coll = new SortedCollection(sort);

  // All we know is that compare is a function,
  // but what type of function?
  print(coll.compare);
  assert(coll.compare is Compare<int>);
  print("foo1: $foo1, ${foo1.runtimeType}");
  
  await for (var fibNum in fibsTo(50)) {
    print ("ts ${new DateTime.now().millisecondsSinceEpoch}: fibNum=$fibNum");
  }
  
  scheduleMicrotask(()=> print("my first Micro! task )"));
  new Future.delayed(new Duration(milliseconds: 1), () => print("print from Future!"));
  
  print("********* FIB REVERSE >>");
  for (var fibNum in fibsToReverse(50)) {
    print ("ts ${new DateTime.now().millisecondsSinceEpoch}: fibNum=$fibNum");
  }
//  print("fibs: ${fibsTo(70).skip(50).forEach((e) => print(e))}");
}


Stream<int> fibsTo(n) async* {
  int k = 1;
  while (k <= n) yield fib(k++);
}

Iterable<int> fibsToReverse(n) sync* {
  if (n > 0) {
    yield fib(n);
    yield* fibsToReverse(n-1);
  }
}

int fib(n) {
  List<int> results = new List(n + 1);
  if (n <= 0) throw new ArgumentError(0);
  if (n <= 2) return n - 1;
  
  results[1] = results[2] = 1;
  
  for (var i = 3; i <= n; ++i) {
    results[i] = results[i-1] + results[i-2];
  }
  
  return results[n];
} 



class SortedCollection {
  Compare compare;

  SortedCollection(this.compare);
}

typedef int Compare<T>(T a, T b);

// Initial, broken implementation.
int sort(Object a, Object b) => 0;

void runAsyncs() async {
  var version = await lookUpVersion();
  print(version);
}

Future<String> lookUpVersion() async => '1.0.0';


class Musician extends Person with Musical {
  Musician(name) : super(name);
}

class Person {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

class Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    print("my hashcode: ");
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}



class Vector {
  final int x, y;

  const Vector(this.x, this.y);

  /// Overrides + (a + b).
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

  /// Overrides - (a - b).
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}

class ImmutablePoint implements Comparable<ImmutablePoint> {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);

  @override
  int compareTo(ImmutablePoint other) {

  }
}

