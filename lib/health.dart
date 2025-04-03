import 'package:flutter/material.dart';
import 'health2.dart';
import 'health5.dart';
import 'health7.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Tips',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Poppins',
      ),
      home: const HealthScreen(),
    );
  }
}

class HealthTipCard {
  final int id;
  final List<String> title;
  final List<Offset> titlePositions;
  final String image;
  final String? personImage;
  final String heading;
  final String description;
  final String readMoreLink;

  const HealthTipCard({
    required this.id,
    required this.title,
    required this.titlePositions,
    required this.image,
    this.personImage,
    required this.heading,
    required this.description,
    required this.readMoreLink,
  });
}

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key});

  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  int _selectedIndex = 0;

  static final List<HealthTipCard> healthTipCards = [
    const HealthTipCard(
      id: 1,
      title: [],
      titlePositions: [
        Offset(24, 10),
        Offset(162, 29),
        Offset(215, 51),
      ],
      image: 'assets/pics/health.png',
      heading: 'Calculate your water Intake!',
      description:
          'Water is essential for your body to function properly. Use this feature to log your daily water intake and',
      readMoreLink: '#',
    ),
    const HealthTipCard(
      id: 2,
      title: [],
      titlePositions: [
        Offset(24, 14),
        Offset(191, 36),
      ],
      image: 'assets/pics/health1.png',
      heading: 'Calculate your body fat!',
      description:
          'Calculating your body fat percentage helps you understand your overall health and fitness level better',
      readMoreLink: '#',
    ),
    const HealthTipCard(
      id: 3,
      title: [],
      titlePositions: [
        Offset(0, 0),
        Offset(1, 29),
        Offset(3, 58),
      ],
      image: 'assets/pics/health2.png',
      heading: 'Checkout Recommended Diet plans',
      description:
          'Create personalised meal plans tailored to your fitness goals and dietary preferences. Explore nutritious recipes',
      readMoreLink: '#',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEE8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Health Tips!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            height: 0.98,
                          ),
                          children: [
                            TextSpan(
                              text: 'You are on a ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: '3 day',
                              style: TextStyle(color: Color(0xFFC47958)),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(color: Color(0xFF909090)),
                            ),
                            TextSpan(
                              text: 'Streak! Keep it up!',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      ...healthTipCards.map((card) => Padding(
                            padding: const EdgeInsets.only(bottom: 28),
                            child: HealthTipCardWidget(card: card),
                          )).toList(),
                    ],
                  ),
                ),
              ),
            ),
            BottomNavigationBarWidget(
              selectedIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HealthScreen()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StatsScreen()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkoutsScreen()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                    break;
                }
              },
            ),
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 94,
                height: 1,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

// ====== NEW PAGES FOR HEALTH TIPS ======
class WaterIntakeScreen extends StatelessWidget {
  const WaterIntakeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Intake Calculator')),
      body: const Center(child: Text('Water intake calculator details')),
    );
  }
}

class BodyFatScreen extends StatelessWidget {
  const BodyFatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Body Fat Calculator')),
      body: const Center(child: Text('Body fat calculator details')),
    );
  }
}

class DietPlansScreen extends StatelessWidget {
  const DietPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diet Plans')),
      body: const Center(child: Text('Diet plans details')),
    );
  }
}

// ====== EXISTING SCREENS ======
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stats')),
      body: const Center(child: Text('Stats Screen')),
    );
  }
}

class WorkoutsScreen extends StatelessWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workouts')),
      body: const Center(child: Text('Workouts Screen')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Screen')),
    );
  }
}

// ====== UPDATED HEALTH TIP CARD WIDGET ======
class HealthTipCardWidget extends StatelessWidget {
  final HealthTipCard card;

  const HealthTipCardWidget({super.key, required this.card});

  void _navigateToDetailScreen(BuildContext context) {
    switch (card.id) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HealthScreen2()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HealthScreen5()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HealthScreen7()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 4,
      child: Column(
        children: [
          SizedBox(
            height: 222,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
              child: Stack(
                children: [
                  Image.asset(
                    card.image,
                    width: double.infinity,
                    height: 233,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Image failed to load'));
                    },
                  ),
                  ...List.generate(
                    card.title.length,
                    (index) => Positioned(
                      left: card.titlePositions[index].dx,
                      top: card.titlePositions[index].dy,
                      child: Text(
                        card.title[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  if (card.personImage != null)
                    Positioned(
                      top: card.id == 1 ? 10 : 3,
                      left: card.id == 1 ? 120 : 5,
                      child: Image.asset(
                        card.personImage!,
                        width: card.id == 1 ? 169 : 361,
                        height: card.id == 1 ? 215 : 222,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.heading,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 26),
                GestureDetector(
                  onTap: () => _navigateToDetailScreen(context),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.47,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(text: card.description),
                        const TextSpan(
                          text: '...Read more',
                          style: TextStyle(
                            color: Color(0xFFFE1600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ====== BOTTOM NAVIGATION BAR (UNCHANGED) ======
class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: (MediaQuery.of(context).size.width - 32) / 5 * selectedIndex + 8,
            child: Stack(
              children: [
                Image.asset(
                  'assets/ellipse-120.png',
                  width: 50,
                  height: 25,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 50,
                    );
                  },
                ),
                Positioned(
                  top: 6,
                  left: 8,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB09489),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getIconForIndex(selectedIndex),
                      color: Colors.white,
                      size: 29,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined),
                _buildNavItem(1, Icons.analytics_outlined),
                _buildNavItem(2, Icons.fitness_center_outlined),
                const SizedBox(width: 26),
                _buildNavItem(3, Icons.person_outline),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(
        icon,
        size: 26,
        color: selectedIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.analytics_outlined;
      case 2:
        return Icons.fitness_center_outlined;
      case 3:
        return Icons.monitor_heart_sharp;
      default:
        return Icons.favorite_border;
    }
  }
}