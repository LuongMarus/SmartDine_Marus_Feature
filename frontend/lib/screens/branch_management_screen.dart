import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/branch_provider.dart';
import '../models/branch.dart';
import '../widgets/branch_card.dart';

class BranchManagementScreen extends StatefulWidget {
  const BranchManagementScreen({super.key});

  @override
  State<BranchManagementScreen> createState() => _BranchManagementScreenState();
}

class _BranchManagementScreenState extends State<BranchManagementScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BranchProvider>().loadBranches();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Branch Management'),
        elevation: 2,
      ),
      body: Consumer<BranchProvider>(
        builder: (context, branchProvider, child) {
          if (branchProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (branchProvider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading branches',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(branchProvider.error ?? ''),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => branchProvider.loadBranches(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (branchProvider.branches.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.store_outlined, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'No branches found',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  const Text('Add your first branch to get started'),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => branchProvider.loadBranches(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: branchProvider.branches.length,
              itemBuilder: (context, index) {
                final branch = branchProvider.branches[index];
                return BranchCard(branch: branch);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show add branch dialog
          _showAddBranchDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddBranchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Branch'),
        content: const Text('Branch creation form would go here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Add branch logic
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
