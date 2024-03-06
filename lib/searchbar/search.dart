import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:MovieFlixer/constants.dart';
import 'dart:convert';


class searchfunc extends StatefulWidget {
  searchfunc({super.key});

@override
  State<searchfunc> createState() => _searchfuncState();

}
class descriptioncheckui extends StatelessWidget {
  final int id;

  descriptioncheckui(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace this with your widget tree
  }
}

class _searchfuncState extends State<searchfunc> {

  List <Map<String, dynamic>> searchResult = [];
  final TextEditingController searchText = TextEditingController();
  bool showlist = false;
  var val1;

  Future<void> Searchlistfunc(String val) async {
    var searchurl = 
        'https://api.themoviedb.org/3/search/multi?api_key=${Constants.apiKey}&query=$val1';

         var searchResponse = await http.get(Uri.parse(searchurl));
        if (searchResponse.statusCode == 200) {
          var tempdata = jsonDecode(searchResponse.body);
          var searchjson = tempdata['results'];

          for (var item in searchjson) {
            if (item['title']!= null &&
                item['poster_path'] != null &&
                item['popularity'] != null) {
                  searchResult.add ({
                    'title': item['title'],
                    'poster_path': item ['poster_path'],
                    'vote_average': item ['vote_average'],
                    'popularity': item ['popularity'],
                    'overview': item ['overview'],

                  });

                  if (searchResult.length > 20) {
                    searchResult.removeRange((20), searchResult.length);
                  }

                } else {
                  print ('Null value found');
                }
          }
        }
  }
  
  @override
  Widget build (BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
        showlist = !showlist;
      },

      child: Column(
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(10)
              ),
            ),
            child: TextField(
              autofocus: false,
              controller: searchText,
              onSubmitted: (value){
                searchResult.clear();
                setState(() {
                  val1 = value;
                });
              },
                onChanged: (value){
                  searchResult.clear();
                  setState(() {
                    val1 = value;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      Fluttertoast.showToast(
                        webBgColor: "FFFFFF",
                        webPosition: "center",
                        webShowClose: true,
                        msg: "Search Cleared",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Color.fromRGBO(7, 7, 7, 1),
                        textColor: Color.fromARGB(255, 221, 26, 26),
                        fontSize: 16.0
                      );
                      setState(() {
                        searchText.clear();
                        FocusManager.instance.primaryFocus?.unfocus();
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color.fromARGB(255, 206, 28, 28).withOpacity(0.6),
                    ),
                  ),
                  prefix: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 219, 8, 8),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 17, 17, 17).withOpacity(0.2))
                  )
                ),
              ),
              SizedBox(height: 3),
              if (searchText.text.length > 0) 
              FutureBuilder(
                future: Searchlistfunc(val1),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      height: 500,
                       child: ListView.builder(
                          itemCount: searchResult.length,
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => descriptioncheckui(
                                      searchResult[index] ['title'],             
                                    )
                                  )
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 3, bottom: 3),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(19, 20, 1, 9),
                                  borderRadius: 
                                    BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 
                                          MediaQuery.of(context).size.width*0.2,
                                          height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: 
                                            BorderRadius.all(Radius.circular(5)),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                           'https://image.tmdb.org/t/p/w500${searchResult[index]['poster_path']}'),
                                           fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment: 
                                            MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                '${searchResult[index]['title']}',
                                              ), 
                                               color: Color.fromARGB(255, 3, 3, 3)
                                            ),  
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(255, 3, 3, 3)
                                                      .withOpacity(0.2),
                                                      borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(6),
                                                        )
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment: 
                                                        MainAxisAlignment
                                                             .center,
                                                        children: [
                                                          Icon(
                                                            Icons.start,
                                                            color: const Color.fromARGB(255, 255, 7, 7),
                                                            size: 20,
                                                          ),
                                                          SizedBox(width: 4),
                                                          Text(
                                                            '${searchResult[index] ['vote_average']}'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Container(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width*
                                                        0.2,
                                                    height: 30,
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(255, 176, 76, 76)
                                                            .withOpacity(0.2),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: 
                                                        MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                               .people_outline_sharp,
                                                            color: Color.fromARGB(255, 156, 88, 88),
                                                            size: 10,
                                                          ),
                                                          SizedBox(width: 5),
                                                          Expanded(
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .scaleDown,
                                                            child: Text(
                                                               '${searchResult[index] ['popularity']}',
                                                               overflow: 
                                                                TextOverflow
                                                                    .ellipsis,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize: 
                                                                12),
                                                            ),
                                                            ),
                                                          )
                                                        ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context)
                                                              .size
                                                              .width* 
                                                          0.4,
                                                    height: 85,
                                                    child: Text(
                                                      '${searchResult[index] ['overview']}',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color.fromARGB(255, 0, 0, 0)
                                                        ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],

                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              )
                            );
                          }
                      )
                    );

                  } else {
                    return Center(
                      child: CircularProgressIndicator(color: const Color.fromARGB(255, 255, 7, 7)) 
                    );
                  }
                },
              )

        ],
      )

    );
  }
   
}
