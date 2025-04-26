import 'package:flutter/material.dart';
import 'recommended_books_page.dart';
import 'friends_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showRecommended = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // AppBar yüksekliği
        child: Container(
          color: Colors.teal[100],
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Shelfy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => showRecommended = true),
                        child: Container(
                          color: showRecommended ? Colors.teal[300] : Colors.teal[100],
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Center(
                            child: Text(
                              "Recommended",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => showRecommended = false),
                        child: Container(
                          color: !showRecommended ? Colors.teal[300] : Colors.teal[100],
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Center(
                            child: Text(
                              "Friends",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: showRecommended ? RecommendedPage() : FriendsPage(),
    );
  }
}
