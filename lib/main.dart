import 'package:flutter/material.dart';

void main() {
  runApp(const WedCraftApp());
}

class WedCraftApp extends StatelessWidget {
  const WedCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CardEditorScreen(),
    );
  }
}

class CardEditorScreen extends StatefulWidget {
  const CardEditorScreen({super.key});

  @override
  State<CardEditorScreen> createState() => _CardEditorScreenState();
}

class _CardEditorScreenState extends State<CardEditorScreen> {
  String groomName = "Rahul";
  String brideName = "Priya";
  String weddingDate = "25 DECEMBER 2026";
  Offset textOffset = const Offset(60, 180);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WedCraft - Card Maker'),
        backgroundColor: const Color(0xFF800020),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.amber),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Card Saved To Gallery!')),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          width: 280,
          height: 420,
          decoration: BoxDecoration(
            color: const Color(0xFF2C0003),
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
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 13,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
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
                      Text(
                        groomName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "&",
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        brideName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        weddingDate,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
