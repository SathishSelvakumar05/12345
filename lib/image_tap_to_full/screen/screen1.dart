import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: GestureDetector(
                onTap: () => _showSecondPage(context),
                child: Hero(
                  tag: 'my-hero-animation-tag',
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/favicon256.png'),
                  ),
                ),
              ),
              title: const Text(
                'Tap on the photo to view the animation transition.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(title: Text('second page')),
          body: Center(
            child: Hero(
              tag: 'my-hero-animation-tag',
              child: Image.asset('assets/images/favicon256.png'),
            ),
          ),
        ),
      ),
    );
  }
}
