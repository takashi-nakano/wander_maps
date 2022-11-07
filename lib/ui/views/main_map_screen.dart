import 'package:flutter/material.dart';
import 'package:wander_maps/ui/components/main_map/form_section.dart';
import 'package:wander_maps/ui/components/main_map/map_section.dart';

class MainMapScreen extends StatelessWidget {
  const MainMapScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MainMapScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("地点設定"), centerTitle: true),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: FormSection(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: MapSection(),
            ),
          ),
        ],
      ),
    );
  }
}
