import 'package:flutter/material.dart';
import 'book_detail_page.dart';

final List<Map<String, dynamic>> reviews = [
  {
    'title': '1984 – George Orwell',
    'text': 'A haunting masterpiece. Orwell’s vision feels chillingly relevant even today.',
    'rating': 5
  },
  {
    'title': 'Sherlock Holmes – Arthur Conan Doyle',
    'text': 'Smart and clever, but a bit slow in parts.',
    'rating': 4
  },
  {
    'title': '12 Angry Men – Reginald Rose',
    'text': 'Tense, emotional, and powerfully written.',
    'rating': 5
  },
];

final List<Map<String, dynamic>> bookshelf = [
  {
    'image': 'lib/assets/george_orwell_1984.png',
    'author': 'George Orwell',
    'title': '1984',
  },
  {
    'image': 'lib/assets/sherlock_holmes.png',
    'author': 'Arthur Conan Doyle',
    'title': 'Sherlock Holmes',
  },
  {
    'image': 'lib/assets/twelve_angry_man.png',
    'author': 'Reginald Rose',
    'title': '12 Angry Men',
  },
];

final List<Map<String, dynamic>> wishlist = [
  {
    'image': 'lib/assets/animal_farm.png',
    'author': 'George Orwell',
    'title': 'Animal Farm',
  },
  {
    'image': 'lib/assets/romeo_and_juliet.png',
    'author': 'William Shakespeare',
    'title': 'Romeo and Juliet',
  },
  {
    'image': 'lib/assets/notes_from_underground.png',
    'author': 'Fyodor Dostoevsky',
    'title': 'Notes From Underground',
  },
];

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔍 Search bar & settings
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // 👤 Profile info + button
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF6DCCCB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.pink[100],
                      child: Icon(Icons.face, size: 40, color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Emma Johnson",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text("@ChapterChaser", style: TextStyle(fontSize: 13)),
                          Text("~Between the pages of a book is a lovely place to be.",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 🎯 Reading goal
              Row(
                children: [
                  Text("READING GOAL: 12/50 Books",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit Goals",
                      style: TextStyle(
                        color: Color(0xFF5BC8B8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              // 📚 My Bookshelf
              sectionTitle("My Bookshelf"),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFD0F2F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: bookshelf.map((book) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: bookItem(context, book['image']!, book['author']!, book['title']!),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // 📖 Wishlist
              sectionTitle("My Wishlist"),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFD0F2F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: wishlist.map((book) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: bookItem(context, book['image']!, book['author']!, book['title']!),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // ✍️ My Review
              sectionTitle("My Reviews"),
              ...reviews.map((review) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: reviewItem(review['title'], review['text'], review['rating']),
              )),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget bookItem(BuildContext context,String imagePath, String author, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookDetailPage(
              image: imagePath,
              author: author,
              title: title,
              rating: "4.5",
            ),
          ),
        );
      },
      child: SizedBox(
        width: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 28,
              alignment: Alignment.center,
              child: Text(
                author,
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 32,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                5,
                    (index) => Icon(Icons.star, size: 10, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reviewItem(String title, String reviewText, int rating) {
    return Card(
      elevation: 1,
      color: Colors.teal[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Row(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  size: 16,
                  color: index < rating ? Colors.amber : Colors.grey[400],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              reviewText,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

}
