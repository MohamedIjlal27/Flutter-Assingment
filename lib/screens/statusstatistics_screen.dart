import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusStatisticsScreen extends StatefulWidget {
  @override
  _StatusStatisticsScreenState createState() => _StatusStatisticsScreenState();
}

class _StatusStatisticsScreenState extends State<StatusStatisticsScreen> {
  final List<bool> _expanded = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status Statistics', style: GoogleFonts.lato(fontSize: 24)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildStatusCard(
              title: 'Pickup Rider Assigned',
              icon: Icons.add_circle,
              stats: [
                _buildStatRow([
                  _buildStatItem('76', 'No of Orders', Icons.assignment),
                  _buildStatItem(
                      '50371.50', 'Delivery Charge', Icons.attach_money),
                ]),
                _buildStatRow([
                  _buildStatItem('67%', 'Ratio', Icons.pie_chart),
                ]),
              ],
              index: 0,
            ),
            _buildSimpleStatusCard('Picked Up', Icons.check_circle, 1),
            _buildSimpleStatusCard('Confirmed', Icons.check, 2),
            _buildSimpleStatusCard('Cancelled', Icons.cancel, 3),
            _buildSimpleStatusCard('Delivered', Icons.local_shipping, 4),
            _buildSimpleStatusCard('Partially Delivered', Icons.adjust, 5),
            SizedBox(height: 16),
            Center(
              child: Text(
                'see more',
                style: GoogleFonts.lato(fontSize: 14, color: Colors.blue),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Powered by curfox.lk',
                style: GoogleFonts.lato(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard({
    required String title,
    required IconData icon,
    required List<Widget> stats,
    required int index,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ExpansionPanelList(
        elevation: 4,
        expandedHeaderPadding: EdgeInsets.all(0),
        expansionCallback: (int item, bool isExpanded) {
          setState(() {
            _expanded[index] = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                leading: Icon(icon, size: 40, color: Colors.blue),
                title: Text(title,
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: stats,
              ),
            ),
            isExpanded: _expanded[index],
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleStatusCard(String title, IconData icon, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(title,
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: IconButton(
          icon: Icon(_expanded[index] ? Icons.expand_less : Icons.expand_more),
          onPressed: () {
            setState(() {
              _expanded[index] = !_expanded[index];
            });
          },
        ),
        onTap: () {
          setState(() {
            _expanded[index] = !_expanded[index];
          });
        },
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

  Widget _buildStatRow(List<Widget> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }
}
