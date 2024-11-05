import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class SettingsScreen1 extends StatelessWidget {
  const SettingsScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'WATER QUALITY',
      'AIR QUALITY',
      'WATER RESIDENTIAL',
    ];
    List ImagesList = [
      'images/water_quality.jpg',
      'images/air_quality.jpg',
      'images/water_residence.jpg',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final data = items[index];
          return ShowUpAnimation(
            direction: Direction.horizontal,
            animationDuration: const Duration(milliseconds: 1500),
            delayStart:
                Duration(milliseconds: index * 800), // Stagger the animations
            offset: -0.8,
            child: GridTile(
              header: GridTileBar(
                backgroundColor: Colors.black45,
                title: Center(
                  child: Text(
                    data,
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
              child: Container(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Image.asset(
                    ImagesList[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              footer: GridTileBar(
                // backgroundColor: Colors.black45,
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                ),
                title: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "View",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
