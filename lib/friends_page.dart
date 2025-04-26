import 'package:flutter/material.dart';
import 'friend_profile_page.dart';

class FriendsPage extends StatelessWidget {
  final List<Map<String, dynamic>> friends = [
    {
      "name": "Daniel Brooks",
      "quote": "~My reality is just a page away — every book takes me somewhere new.",
      "action": "marked Brave New World as read.",
      "readingGoal": "23",
      "comment": "Disturbing yet fascinating. A chilling vision of the future.",
      "stars": 5,
      "avatar": "lib/assets/avatars/avatar_1.png",
      "reviews": [
        {
          'title': 'Brave New World – Aldous Huxley',
          'text':
              'Disturbing yet fascinating. A chilling vision of the future.',
          'rating': 5,
          'likes': 3,
          'dislikes': 1,
        },
      ],
      "bookshelf": [
        {
          'image': 'lib/assets/friend_books/crime_and_punishment.png',
          'author': 'Dostoevsky',
          'title': 'Crime and Punishment',
        },
        {
          'image': 'lib/assets/friend_books/the_metamorphosis.png',
          'author': 'Kafka',
          'title': 'The Metamorphosis',
        },
        {
          'image': 'lib/assets/friend_books/anna_karenina.png',
          'author': 'Tolstoy',
          'title': 'Anne Karenina',
        }
      ],
      "wishlist": [
        {
          'image': 'lib/assets/friend_books/twelve_angry_man.png',
          'author': 'Reginald Rose',
          'title': 'Twelve Angry Man',
        },
        {
          'image': 'lib/assets/friend_books/fahrenheit_451.png',
          'author': 'Ray Bradbury',
          'title': 'Fahrenheit 451',
        },
        {
          'image': 'lib/assets/friend_books/divine_comedy.png',
          'author': 'Dante Alighieri',
          'title': 'Divine Comedy',
        },
      ],
    },
    {
      "name": "Emily Hayes",
      "quote": null,
      "action": "added The Bell Jar to her wishlist.",
      "readingGoal": "5",
      "comment": null,
      "stars": 0,
      "avatar": "lib/assets/avatars/avatar_2.png",
      "reviews": <Map<String, dynamic>>[],
      "bookshelf": <Map<String, dynamic>>[],
      "wishlist": <Map<String, dynamic>>[],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7F4),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FriendProfilePage(
                      name: friend['name'],
                      avatar: friend['avatar'],
                      quote: friend['quote'] ?? 'No quote available',
                      readingGoal: friend['readingGoal'],
                      reviews: friend['reviews'] ,
                      bookshelf: friend['bookshelf'],
                      wishlist: friend['wishlist'],
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(friend['avatar']),
              ),
            ),
            title: Text(
              "${friend['name']} ${friend['action']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                if (friend["stars"] > 0)
                  Row(
                    children: List.generate(5, (i) {
                      return Icon(
                        i < friend["stars"] ? Icons.star : Icons.star_border,
                        size: 16,
                        color: Colors.black87,
                      );
                    }),
                  ),
                SizedBox(height: 5),
                if (friend["comment"] != null)
                  Text("\"${friend["comment"]}\""),
              ],
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          );
        },
      ),
    );
  }
}
