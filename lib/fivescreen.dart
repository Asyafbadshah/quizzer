import 'package:flutter/material.dart';
import 'package:quizzer/first_screen.dart';

class Fivescreen extends StatefulWidget {
  const Fivescreen({super.key});

  @override
  State<Fivescreen> createState() => _FivescreenState();
}

class _FivescreenState extends State<Fivescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search",
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
          
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.tune, color: Colors.white, size: 25),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Subjects", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Spacer(),
          
                ],
              ),
              // SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CategoryCard(
                        title: 'Music',
                        quizzes: 10,
                        color: Color(0xFFFFD54F),
                        icon: Icons.headphones,
                      ),
                      CategoryCard(
                        title: 'History',
                        quizzes: 10,
                        color: Color(0xFFFF8A65),
                        icon: Icons.menu_book,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstScreen()));
                        },
                        child: CategoryCard(
                          title: 'Math',
                          quizzes: 12,
                          color: Color(0xFF9575CD),
                          icon: Icons.calculate,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                  children: [
                    Text("Homework",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Spacer(),
          
              ]),
              SizedBox(
                height: 200,
          
          
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child:ListView.builder(scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context,index){
                    return Row(
                      children: [
                        SizedBox(
                          width: 105,
                          height:150,
          
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                    alignment:Alignment.topRight,
                                    child: Icon(Icons.check,size: 20,color: Colors.grey,)),
                               Container(
                                 width: 50,
                                 height:50,
                                 decoration: BoxDecoration(
                            color: Color(0xFFFF8A65),
                                     borderRadius: BorderRadius.circular(10)
                                 ),
          
                                 child: Icon(Icons.headphones,color: Colors.white,size: 40,),
                               ),
                                Text("Music",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("19 May")
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 105,
                          height:150,
                          child: Card(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height:50,
          
                            decoration: BoxDecoration(
                                color: Color(0xFF9575CD),
                              borderRadius: BorderRadius.circular(10)
                        ),
                                  child: Icon(Icons.calculate,color: Colors.white,size: 40),
                                ),
                                Text("Math",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("29 May")
                              ],
                            ),
                          ),
                        ),   SizedBox(
                          width: 105,
                          height:150,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment:Alignment.topRight,
                                    child: Icon(Icons.check,size: 20,color: Colors.grey,)),
                                Container(
                                  width: 50,
                                  height:50,
                                  decoration: BoxDecoration(
                        color:Color(0xFFFFD54F),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
          
                                  child: Icon(Icons.videocam,color: Colors.white,size: 40,),
                                ),
                                Text("Geography",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("25 May")
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                      }),
                ),
              ),
             SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
          
                ),
          
                height: 90,
                child: Row(
                  children: [
                    SizedBox(width: 5,),
                    Container(
                      width: 50,
                      height:50,
          
                      decoration: BoxDecoration(
                          color: Color(0xFFFF8A65),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.calculate,color: Colors.white,size: 40),
                    ),
                    SizedBox(width: 7,),
                                        Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Math Testing April",style: TextStyle(fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("Math . 12 Quizzes"),
          
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right)
          
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class CategoryCard extends StatelessWidget {
  final String title;
  final int quizzes;
  final Color color;
  final IconData icon;

  const CategoryCard({
    super.key,
    required this.title,
    required this.quizzes,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipPath(
        clipper:NotchedCardClipper() ,
        child: Container(
          width: 105,
          height:150,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white24,
                radius: 24,
                child: Icon(icon, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "$quizzes quizzes",
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class NotchedCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double notchRadius = 20;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width , 0);
    path.quadraticBezierTo(
      size.width ,
      size.height * 0.25,
      size.width ,
      size.height * 0.4,
    );
    path.arcToPoint(
      Offset(size.width , size.height * 0.6),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.quadraticBezierTo(
      size.width ,
      size.height * 0.75,
      size.width ,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

