// import 'package:flutter/foundation.dart';
// import '../models/CartItem/cart_item.dart';
//
// class CartProvider with ChangeNotifier {
//   final List<CartItem> _items = [];
//
//   List<CartItem> get items => _items;
//
//   Map<String, dynamic>? _deliveryAddress;
//   Map<String, dynamic>? get deliveryAddress => _deliveryAddress;
//   void addItem(CartItem item) {
//     _items.add(item);
//     notifyListeners();
//   }
//
//   void removeItem(String itemId) {
//     _items.removeWhere((item) => item.id == itemId);
//     notifyListeners();
//   }
//
//   double get totalPrice {
//     return _items.fold(0, (sum, item) => sum + item.price);
//   }
//   void setDeliveryAddress(Map<String, dynamic> address) {
//     _deliveryAddress = address;
//     notifyListeners();
//   }
//   void clearAddress() {
//     _deliveryAddress = null;
//     notifyListeners();
//   }
// }
import 'package:flutter/foundation.dart';
import '../models/CartItem/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  Map<String, dynamic>? _deliveryAddress;
  Map<String, dynamic>? _patientDetails;

  List<CartItem> get items => _items;
  Map<String, dynamic>? get deliveryAddress => _deliveryAddress;
  Map<String, dynamic>? get patientDetails => _patientDetails;

  String? _selectedSlot;
  String? get selectedSlot => _selectedSlot;
  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void setDeliveryAddress(Map<String, dynamic> address) {
    _deliveryAddress = address;
    notifyListeners();
  }

  void setPatientDetails(Map<String, dynamic> patient) {
    _patientDetails = patient;
    notifyListeners();
  }

  void setSelectedSlot(String slot) {
    _selectedSlot = slot;
    notifyListeners();
  }
  void clearAddress() {
    _deliveryAddress = null;
    notifyListeners();
  }

  void clearPatientDetails() {
    _patientDetails = null;
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _deliveryAddress = null;
    _patientDetails = null;
    _selectedSlot = null;
    notifyListeners();
  }
}