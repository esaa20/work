import 'dart:convert';
import 'package:http/http.dart' as http;
class works {
  final String title;
  final String subtitle;
  final bool done;
  works({
    required this.title,
    required this.subtitle,
    required this.done
});

  factory works.fromjson(Map<String, dynamic> parsedjson){
    return works(
      title: parsedjson["title"],
      subtitle: parsedjson["sub"],
      done: parsedjson["done"]
    );
  }
}

class Postworks {
  final String title;
  final String subtitle;
  final bool done;
  Postworks({
    required this.title,
    required this.subtitle,
    required this.done
  });

  factory Postworks.fromjson(Map<String, dynamic> parsedjson){
    return Postworks(
        title: parsedjson["title"],
        subtitle: parsedjson["sub"],
        done: parsedjson["done"]
    );
  }
}

Future<List<works>> getdata() async {
  var url = 'https://works-82591-default-rtdb.firebaseio.com/.json';
  var jsonData = await http.get(Uri.parse(url));
  if (jsonData.statusCode == 200) {
    Map data = jsonDecode(jsonData.body);
    // List data = jsonDecode(jsonData.body);
    myList(){
      return data.entries.map((e) {
        return e.value ;
      }).toList();
    }
    print(myList());
    List<works> allworks = [];
    for (var u in myList()) {
      works toDo = works.fromjson(u);
      allworks.add(toDo);
    }
    return allworks;
  } else {
    throw Exception('Error');
  }
}
late Future<List<works>> AllWork;
Future upload()async{
   AllWork = getdata();

}

