import 'package:flutter/material.dart';

class TabMenu extends StatefulWidget {
  const TabMenu({super.key});

  @override
  _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: const [
              HomeTab(),
              FavoritesTab(),
              CartTab(),
              ProfileTab(),
            ],
          ),
        ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ],
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
              'https://example.com/banner_image.jpg'), // Replace with your banner image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NEWS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const NewsItem(date: '2024.09.20', title: 'News title 1'),
                const NewsItem(date: '2024.09.15', title: 'News title 2'),
                const NewsItem(date: '2024.09.12', title: 'News title 3'),
                ElevatedButton(
                  onPressed: () {
                    // Handle "View all" action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .orange, // Use 'backgroundColor' instead of 'primary'
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text('View all'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final String date;
  final String title;

  const NewsItem({super.key, required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(date, style: const TextStyle(color: Colors.grey)),
          const SizedBox(width: 16),
          Expanded(child: Text(title)),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'My Favorites',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        FavoriteItem(
          title: 'Favorite Item 1',
          description: 'Description of favorite item 1',
          image: 'https://example.com/favorite1.jpg',
        ),
        FavoriteItem(
          title: 'Favorite Item 2',
          description: 'Description of favorite item 2',
          image: 'https://example.com/favorite2.jpg',
        ),
        FavoriteItem(
          title: 'Favorite Item 3',
          description: 'Description of favorite item 3',
          image: 'https://example.com/favorite3.jpg',
        ),
      ],
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const FavoriteItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.network(image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.favorite, color: Colors.red),
          onPressed: () {
            // Handle removing from favorites
          },
        ),
      ),
    );
  }
}

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'My Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(
            children: const [
              CartItem(
                title: 'Cart Item 1',
                price: 19.99,
                quantity: 2,
              ),
              CartItem(
                title: 'Cart Item 2',
                price: 29.99,
                quantity: 1,
              ),
              CartItem(
                title: 'Cart Item 3',
                price: 9.99,
                quantity: 3,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              // Handle checkout process
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text('Proceed to Checkout'),
          ),
        ),
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  final String title;
  final double price;
  final int quantity;

  const CartItem({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text('Price: \$${price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                // Handle decreasing quantity
              },
            ),
            Text('$quantity'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Handle increasing quantity
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Avatar dengan huruf inisial
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.purple,
            child: Text(
              'A',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          // Nama dan Username
          const Text(
            'over_quarzet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            '@over_quarzet',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          // Tombol "Edit Profil" dan "Lihat Arsip"
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle edit profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Edit profil'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle view archive
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Lihat arsip'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Statistik (Kiriman, Pengikut, Diikuti)
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileStat(title: 'Kiriman', value: '1'),
              VerticalDivider(width: 20, thickness: 1),
              ProfileStat(title: 'Pengikut', value: '9'),
              VerticalDivider(width: 20, thickness: 1),
              ProfileStat(title: 'Diikuti', value: '557'),
            ],
          ),
          const SizedBox(height: 20),
          // Divider
          const Divider(),
          // Placeholder untuk grid konten (kiriman)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6, // Ubah sesuai jumlah kiriman
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey.shade300,
                child: const Icon(Icons.image, size: 50, color: Colors.grey),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String title;
  final String value;

  const ProfileStat({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
