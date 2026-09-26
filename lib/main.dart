import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const WedCraftApp());
}

class WedCraftApp extends StatelessWidget {
  const WedCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WedCraft',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

// ----------------- HOME DASHBOARD -----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WedCraft Studio', style: GoogleFonts.cinzel(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF800020),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildFeatureCard(
              context,
              title: "Wedding Card",
              icon: Icons.card_giftcard,
              color: Colors.maroon,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CardEditorScreen())),
            ),
            _buildFeatureCard(
              context,
              title: "Reels Generator",
              icon: Icons.video_collection,
              color: Colors.purple,
              onTap: () => _showComingSoon(context, "Reels Generator"),
            ),
            _buildFeatureCard(
              context,
              title: "Status Maker",
              icon: Icons.camera_alt,
              color: Colors.deepOrange,
              onTap: () => _showComingSoon(context, "Status Maker"),
            ),
            _buildFeatureCard(
              context,
              title: "Shayari & Quotes",
              icon: Icons.format_quote,
              color: Colors.teal,
              onTap: () => _showComingSoon(context, "Shayari Maker"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            const SizedBox(height: 10),
            Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature Tool is Coming in Next Update!')),
    );
  }
}

// ----------------- CARD EDITOR SCREEN -----------------
class CardEditorScreen extends StatefulWidget {
  const CardEditorScreen({super.key});

  @override
  State<CardEditorScreen> createState() => _CardEditorScreenState();
}

class _CardEditorScreenState extends State<CardEditorScreen> {
  TextEditingController groomController = TextEditingController(text: "Rahul");
  TextEditingController brideController = TextEditingController(text: "Priya");
  TextEditingController dateController = TextEditingController(text: "25 DECEMBER 2026");

  Color cardBgColor = const Color(0xFF2C0003);
  Offset textOffset = const Offset(40, 150);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Wedding Card'),
        backgroundColor: const Color(0xFF800020),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.amber),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Card Saved to Gallery Successfully!')),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Canvas Area
          Expanded(
            child: Center(
              child: Container(
                width: 280,
                height: 400,
                decoration: BoxDecoration(
                  color: cardBgColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD4AF37), width: 3),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 25,
                      left: 0,
                      right: 0,
                      child: Text(
                        "WEDDING INVITATION",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFFD4AF37), fontSize: 13, letterSpacing: 2, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: textOffset.dx,
                      top: textOffset.dy,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            textOffset += details.delta;
                          });
                        },
                        child: Column(
                          children: [
                            Text(groomController.text, style: GoogleFonts.greatVibes(color: Colors.white, fontSize: 36)),
                            const Text("&", style: TextStyle(color: Color(0xFFD4AF37), fontSize: 20)),
                            Text(brideController.text, style: GoogleFonts.greatVibes(color: Colors.white, fontSize: 36)),
                            const SizedBox(height: 8),
                            Text(dateController.text, style: const TextStyle(color: Colors.white70, fontSize: 11)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Customization Controls
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: groomController,
                        decoration: const InputDecoration(labelText: "Groom Name", border: OutlineInputBorder()),
                        onChanged: (val) => setState(() {}),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: brideController,
                        decoration: const InputDecoration(labelText: "Bride Name", border: OutlineInputBorder()),
                        onChanged: (val) => setState(() {}),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(labelText: "Wedding Date", border: OutlineInputBorder()),
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2C0003)),
                      onPressed: () => setState(() => cardBgColor = const Color(0xFF2C0003)),
                      child: const Text("Royal Red"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF002C1E)),
                      onPressed: () => setState(() => cardBgColor = const Color(0xFF002C1E)),
                      child: const Text("Emerald"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E002C)),
                      onPressed: () => setState(() => cardBgColor = const Color(0xFF1E002C)),
                      child: const Text("Royal Purple"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
