import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff1E3C72), Color(0xff2A5298)],
            ),
          ),
        ),
        title: const Text('About Us', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1E3C72), Color(0xff2A5298)],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.directions_car,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'CAR Rental',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pakistan\'s Most Trusted Car Rental Service',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Mission
            _Section(
              icon: Icons.flag,
              title: 'Our Mission',
              content:
                  'To provide affordable, reliable, and comfortable car rental services across Pakistan. We believe every journey should be smooth, safe, and memorable — and we\'re here to make that happen.',
            ),

            // Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  _StatCard(value: '10+', label: 'Years\nExperience'),
                  const SizedBox(width: 12),
                  _StatCard(value: '500+', label: 'Cars\nAvailable'),
                  const SizedBox(width: 12),
                  _StatCard(value: '50K+', label: 'Happy\nCustomers'),
                  const SizedBox(width: 12),
                  _StatCard(value: '13+', label: 'Cities\nCovered'),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Vision
            _Section(
              icon: Icons.visibility,
              title: 'Our Vision',
              content:
                  'To become the number one car rental platform in South Asia, connecting travelers to premium vehicles at unbeatable prices through technology and exceptional customer service.',
            ),

            // Services
            _Section(
              icon: Icons.build_circle,
              title: 'Our Services',
              content: '',
              child: Column(
                children: const [
                  _ServiceItem(icon: Icons.directions_car, text: 'Self-drive car rental'),
                  _ServiceItem(icon: Icons.person, text: 'Chauffeur-driven vehicles'),
                  _ServiceItem(icon: Icons.airplane_ticket, text: 'Airport transfers'),
                  _ServiceItem(icon: Icons.celebration, text: 'Wedding & event car hire'),
                  _ServiceItem(icon: Icons.business, text: 'Corporate fleet solutions'),
                  _ServiceItem(icon: Icons.tour, text: 'Tour packages across Pakistan'),
                ],
              ),
            ),

            // Team
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Meet Our Team',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1E3C72),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Expanded(child: _TeamCard(name: 'Ali Hassan', role: 'CEO & Founder', initial: 'A')),
                      SizedBox(width: 12),
                      Expanded(child: _TeamCard(name: 'Sara Baig', role: 'Operations Head', initial: 'S')),
                      SizedBox(width: 12),
                      Expanded(child: _TeamCard(name: 'Umar Farouk', role: 'Fleet Manager', initial: 'U')),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Contact
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xff1E3C72),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const Text(
                    'Get In Touch',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ContactRow(icon: Icons.phone, text: '+92 300 1234567'),
                  const SizedBox(height: 10),
                  _ContactRow(icon: Icons.email, text: 'info@carrental.pk'),
                  const SizedBox(height: 10),
                  _ContactRow(icon: Icons.location_on, text: 'Blue Area, Islamabad, Pakistan'),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Widget? child;

  const _Section({
    required this.icon,
    required this.title,
    required this.content,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xff1E3C72), size: 24),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1E3C72),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (content.isNotEmpty)
            Text(
              content,
              style: const TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ServiceItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xff1E3C72),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  final String name;
  final String role;
  final String initial;
  const _TeamCard({required this.name, required this.role, required this.initial});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xff1E3C72).withOpacity(0.15),
            child: Text(
              initial,
              style: const TextStyle(
                color: Color(0xff1E3C72),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
      ],
    );
  }
}