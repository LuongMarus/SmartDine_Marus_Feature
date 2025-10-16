import 'package:flutter/material.dart';
import '../models/branch.dart';

class BranchCard extends StatelessWidget {
  final Branch branch;

  const BranchCard({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(branch.status),
          child: const Icon(Icons.store, color: Colors.white),
        ),
        title: Text(
          branch.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(branch.address),
            const SizedBox(height: 2),
            Text('Manager: ${branch.manager}'),
            const SizedBox(height: 2),
            Text('Phone: ${branch.phone}'),
          ],
        ),
        trailing: Chip(
          label: Text(
            branch.status.toString().split('.').last,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          backgroundColor: _getStatusColor(branch.status),
        ),
        isThreeLine: true,
      ),
    );
  }

  Color _getStatusColor(BranchStatus status) {
    switch (status) {
      case BranchStatus.active:
        return Colors.green;
      case BranchStatus.inactive:
        return Colors.red;
      case BranchStatus.maintenance:
        return Colors.orange;
    }
  }
}
