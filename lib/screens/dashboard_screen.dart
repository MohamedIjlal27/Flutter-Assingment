import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_drive/services/auth.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text("FireBase Auth");
  }

  Widget _userid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text("Sign Out"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: GoogleFonts.lato(fontSize: 24)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildStatisticCard(
                title: 'Orders Statistics',
                stats: [
                  _buildStatItem('3.1k', 'Orders Count', Icons.shopping_bag),
                  _buildStatItem(
                      '4.8k', 'Total Delivery Charge', Icons.delivery_dining),
                ],
              ),
              SizedBox(height: 16),
              _buildFinanceStatisticCard(
                title: 'Finance Statistics',
                stats: [
                  _buildStatItem(
                      '234.1k', 'Invoice Value', Icons.monetization_on),
                  _buildStatItem('122.3k', 'Pending Invoice', Icons.pending),
                  _buildStatItem('678.7k', 'Paid Invoice Value', Icons.payment),
                  _buildStatItem(
                      '101.1k', 'Approved Invoice', Icons.check_circle),
                ],
              ),
              SizedBox(height: 5),
              _buildStatusCard(),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Powered by curfox.lk',
                  style: GoogleFonts.lato(fontSize: 14, color: Colors.grey),
                ),
              ),
              _userid(),
              _signOutButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticCard(
      {required String title, required List<Widget> stats}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.lato(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: stats,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinanceStatisticCard(
      {required String title, required List<Widget> stats}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.lato(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 96.0,
              mainAxisSpacing: 0.5,
              physics: ScrollPhysics(),
              children: stats,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 8),
        Text(value,
            style: GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(label, style: GoogleFonts.lato(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildStatusCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: Icon(Icons.list, size: 40, color: Colors.blue),
        title: Text('Status Statistics',
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: TextButton(
          onPressed: () {},
          child: Text('Show details', style: TextStyle(color: Colors.blue)),
        ),
      ),
    );
  }
}
