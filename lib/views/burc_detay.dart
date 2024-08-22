import 'package:babadanders/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appbarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarRengi,
        title: Text('${widget.secilenBurc.burcAdi} Burcu ve Özellikleri'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              "images/${widget.secilenBurc.burcBuyukResim}",
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      widget.secilenBurc.burcAdi,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.7),
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                    ),
                  ),
                  // Divider
                  Divider(
                    color: Colors.white.withOpacity(0.6),
                    thickness: 1.5,
                  ),
                  // General Information
                  Container(
                    margin: const EdgeInsets.only(top: 12.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Subtitle
                        Text(
                          "Genel Bilgiler",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 8.0),
                        // Description
                        Text(
                          widget.secilenBurc.burcDetayi,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.black54,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    appbarRengi = _generator.vibrantColor?.color ?? Colors.pink;
    setState(() {});
  }
}