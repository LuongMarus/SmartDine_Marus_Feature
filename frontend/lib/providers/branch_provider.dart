import 'package:flutter/foundation.dart';
import '../models/branch.dart';
import '../services/branch_service.dart';

class BranchProvider extends ChangeNotifier {
  final BranchService _branchService = BranchService();
  List<Branch> _branches = [];
  Branch? _selectedBranch;
  bool _isLoading = false;
  String? _error;

  List<Branch> get branches => _branches;
  Branch? get selectedBranch => _selectedBranch;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadBranches() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _branches = await _branchService.getAllBranches();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createBranch(Branch branch) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final newBranch = await _branchService.createBranch(branch);
      _branches.add(newBranch);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateBranch(String id, Branch branch) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final updatedBranch = await _branchService.updateBranch(id, branch);
      final index = _branches.indexWhere((b) => b.id == id);
      if (index != -1) {
        _branches[index] = updatedBranch;
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteBranch(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _branchService.deleteBranch(id);
      _branches.removeWhere((b) => b.id == id);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectBranch(Branch? branch) {
    _selectedBranch = branch;
    notifyListeners();
  }

  List<Branch> getBranchesByStatus(BranchStatus status) {
    return _branches.where((b) => b.status == status).toList();
  }
}
