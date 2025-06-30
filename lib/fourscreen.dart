import 'package:flutter/material.dart';
import 'package:quizzer/fivescreen.dart';

class Fourscreen extends StatefulWidget {
  const Fourscreen({super.key});

  @override
  State<Fourscreen> createState() => _Fourscreen();
}

class _Fourscreen extends State<Fourscreen> {
  String selectedTab = "Forum";

  final List<String> tabs = [
    "Forum",
    "Add. classes",
    "Lessons",
    "Homework",
    "Schedule",
  ];

  final List<CourseData> courses = [
    CourseData("Category", Colors.deepPurple, "Dianne Russell", "⭐"),
    CourseData("History", Colors.redAccent, "Amy Arnold", "📘"),
    CourseData("Math", Colors.orange, "Amy Johnson", "🎓"),
    CourseData("Literature", Colors.green, "Steve Albert", "📚"),
  ];

  void onTabTap(String name) {
    setState(() {
      selectedTab = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            // Horizontal Scrollable Tab Bar
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children:
                      tabs.map((tab) {
                        return GestureDetector(
                          onTap: () => onTabTap(tab),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  selectedTab == tab
                                      ? Colors.deepPurple
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  tab,
                                  style: TextStyle(
                                    color:
                                        selectedTab == tab
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),

            // Grid of Course Cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(

                  itemCount: courses.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 26,
                    childAspectRatio:1.0,
                  ),
                  itemBuilder: (context, index) {
                    final course = courses[index]; // ✅ define it here first

                    if (course.title == "Category") {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Fivescreen()),
                          );
                        },
                        child: CourseCard(course: course),
                      );
                    } else {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Fivescreen()));
                        },
                          child: CourseCard(course: course));
                    }
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Course Data Model
class CourseData {
  final String title;
  final Color color;
  final String teacher;
  final String emoji;

  CourseData(this.title, this.color, this.teacher, this.emoji);
}

// Course Card Widget
class CourseCard extends StatelessWidget {
  final CourseData course;

  CourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavyClipper(),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: course.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.2),
                child: Text(course.emoji),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?u=${course.teacher}',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Teacher:\n${course.teacher}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Wavy Clipper
class WavyClipper extends CustomClipper<Path> {
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
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
