import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PromoWave Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Card(
              child: ListTile(
                title: Text("Active Campaigns"),
                subtitle: Text("0 running"),
              ),
            ),

            const Card(
              child: ListTile(
                title: Text("Total Spend"),
                subtitle: Text("₦0"),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create-campaign');
              },
              child: const Text("Create Campaign"),
            ),
          ],
        ),
      ),
    );
  }
}
