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
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: FormSection(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(children: [
                const MapSection(),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: const EdgeInsets.only(
                        top: 70,
                        right: 14,
                      ),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                              offset: Offset(1, 1))
                        ],
                        borderRadius: BorderRadius.circular(3),
                        color: const Color.fromRGBO(251, 251, 251, 0.5),
                      ),
                      child: const Icon(Icons.copy)),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
