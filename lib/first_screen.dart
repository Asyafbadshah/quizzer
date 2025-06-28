import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzer/second_screen.dart';



class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _selectedIndex = 0;

  final _pages = [
    Center(child: Text('Explore')),
    Center(child: Text('Leaderboard')),
    Center(child: Text('Bookmarks')),
    Center(child: Text('Settings')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade200,

              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text("Quizzer",style: TextStyle(color: Colors.white,fontSize: 20),),

            Container(
              height: 180,
              width: 330,

              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(13)
              ),
            ),
            Row(
              children: [
                SizedBox(width: 15,),
                Text("Quiz" ,style: TextStyle(
                  color: Colors.white
                ),),
                Spacer(),
                Text("view All",style: TextStyle(
                    color: Colors.white
                )),
                SizedBox(width: 15,),
              ],
            ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
          GridView.count(
            crossAxisCount: 5,
            padding: EdgeInsets.all(16),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/img1.jpg", height:20), // ✅ fixed image path
                    SizedBox(height: 3),
                    Text("footbell",style: TextStyle(fontSize: 10),)
                ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/img1.jpg", height:20), // ✅ fixed image path
                      SizedBox(height: 3),
                      Text("footbell",style: TextStyle(fontSize: 10),)
                    ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/img1.jpg", height:20), // ✅ fixed image path
                      SizedBox(height: 3),
                      Text("footbell",style: TextStyle(fontSize: 10),)
                    ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/img1.jpg", height:20), // ✅ fixed image path
                      SizedBox(height: 3),
                      Text("footbell",style: TextStyle(fontSize: 10),)
                    ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/img1.jpg", height:20), // ✅ fixed image path
                      SizedBox(height: 3),
                      Text("footbell",style: TextStyle(fontSize: 10),)
                    ]
                ),
              ),



            ],
          )
        ),
      ),
            Row(
              children: [
                SizedBox(width: 15,),
                Text("More Games" ,style: TextStyle(
                    color: Colors.white
                ),),
                Spacer(),
                Text("view All",style: TextStyle(
                    color: Colors.white
                )),
                SizedBox(width: 15,),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/img1.jpg", height: 95), // ✅ fixed image path
                        SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child:
                      Text("Language Quiz", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),Align(
              alignment: Alignment.bottomLeft,
              child:   Text("15 Questions", style: TextStyle(color: Colors.grey)),
                        ) ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/img3.jpg", height: 95), // ✅ fixed image path
                          SizedBox(height: 8),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("Exam quiz", style: TextStyle(fontWeight: FontWeight.bold))),
                      Align(
                        alignment: Alignment.bottomLeft,
                       child:    Text("12 Questions", style: TextStyle(color: Colors.grey)),
                      ) ],
                      ),
                    ),
                  ),
                ],
              ),
            )

          ]),
    ),
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepPurple.shade400,
      unselectedItemColor: Colors.deepPurple.shade100,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events_outlined),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          label: 'Bookmarks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Settings',
        ),
      ],
    ),

    );
  }
}





