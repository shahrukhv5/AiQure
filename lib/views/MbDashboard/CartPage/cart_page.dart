// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/services.dart';
// import '../../../providers/cart_provider.dart';
//
// class CartPage extends StatefulWidget {
//   const CartPage({Key? key}) : super(key: key);
//
//   @override
//   State<CartPage> createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void _showAddressBottomSheet() {
//     final cart = Provider.of<CartProvider>(context, listen: false);
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) => AddressBottomSheet(
//         onSave: (address) async {
//           cart.setDeliveryAddress(address);
//           Navigator.pop(context);
//
//           await Future.delayed(const Duration(milliseconds: 300));
//
//           if (!mounted) return;
//           _showPatientBottomSheet();
//         },
//       ),
//     );
//   }
//
//   void _showPatientBottomSheet() {
//     final cart = Provider.of<CartProvider>(context, listen: false);
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) => AddPatientBottomSheet(
//         onSave: (patient) async {
//           cart.setPatientDetails(patient);
//           Navigator.pop(context);
//
//           await Future.delayed(const Duration(milliseconds: 300));
//
//           if (!mounted) return;
//           _showSelectSlotBottomSheet();
//         },
//       ),
//     );
//   }
//
//   void _showSelectSlotBottomSheet() {
//     final cart = Provider.of<CartProvider>(context, listen: false);
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) => SelectSlotBottomSheet(
//         address: cart.deliveryAddress!,
//         patient: cart.patientDetails!,
//         onSlotSelected: (selectedSlot) {
//           cart.setSelectedSlot(selectedSlot);
//           Navigator.pop(context);
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const PaymentPage(),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context);
//
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: const Text('My Cart'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             if (cart.items.isEmpty)
//               Expanded(
//                 child: Center(
//                   child: Text(
//                     'Your cart is empty',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               )
//             else ...[
//               if (cart.deliveryAddress != null)
//                 _buildAddressCard(cart),
//               if (cart.patientDetails != null)
//                 _buildPatientCard(cart),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: cart.items.length,
//                   itemBuilder: (context, index) {
//                     final item = cart.items[index];
//                     return Card(
//                       margin: const EdgeInsets.only(bottom: 16),
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.asset(
//                                 item.image,
//                                 width: 80,
//                                 height: 80,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item.name,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   Text(item.description),
//                                   Text(
//                                     '₹${item.price}',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 cart.removeItem(item.id);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//             if (cart.items.isNotEmpty)
//               Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   children: [
//                     if (cart.deliveryAddress != null)
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Delivery to: ${cart.deliveryAddress!['addressName']}',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: _showAddressBottomSheet,
//                               child: Text('Change'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     if (cart.patientDetails != null)
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Patient: ${cart.patientDetails!['name']}',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: _showPatientBottomSheet,
//                               child: Text('Change'),
//                             ),
//                           ],
//                         ),
//                       ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Total: ₹${cart.totalPrice.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (cart.deliveryAddress == null || cart.patientDetails == null) {
//                               _showAddressBottomSheet();
//                             } else if (cart.selectedSlot == null) {
//                               _showSelectSlotBottomSheet();
//                             } else {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const PaymentPage(),
//                                 ),
//                               );
//                             }
//                           },
//                           child: Text(
//                             cart.deliveryAddress == null || cart.patientDetails == null
//                                 ? 'Add Details'
//                                 : cart.selectedSlot == null
//                                 ? 'Select Delivery Slot'
//                                 : 'Proceed to Payment',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAddressCard(CartProvider cart) {
//     final address = cart.deliveryAddress!;
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Delivery Address',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.edit, size: 20),
//                   onPressed: _showAddressBottomSheet,
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Text(
//               '${address['recipientName']}',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text('${address['houseNumber']}, ${address['building']}'),
//             Text('${address['locality']}'),
//             Text('Pincode: ${address['pincode']}'),
//             Text('Phone: ${address['phone']}'),
//             SizedBox(height: 8),
//             Chip(
//               label: Text(
//                 address['addressName'],
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPatientCard(CartProvider cart) {
//     final patient = cart.patientDetails!;
//     final dob = patient['dob'] as DateTime;
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Patient Details',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.edit, size: 20),
//                   onPressed: _showPatientBottomSheet,
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Name: ${patient['name']}',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text('Date of Birth: ${dob.day}/${dob.month}/${dob.year}'),
//             Text('Gender: ${patient['gender']}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AddressBottomSheet extends StatefulWidget {
//   final Function(Map<String, dynamic>) onSave;
//
//   const AddressBottomSheet({Key? key, required this.onSave}) : super(key: key);
//
//   @override
//   _AddressBottomSheetState createState() => _AddressBottomSheetState();
// }
//
// class _AddressBottomSheetState extends State<AddressBottomSheet> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _pincodeController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController(); // Combined address field
//   String _addressType = 'Home';
//   String _addressName = '';
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _pincodeController.dispose();
//     _addressController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Add Delivery Address',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: const InputDecoration(
//                     labelText: "Recipient's Name",
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter recipient name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: _phoneController,
//                   decoration: const InputDecoration(
//                     labelText: "Phone Number",
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.phone,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(10),
//                   ],
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter phone number';
//                     }
//                     if (value.length != 10) {
//                       return 'Please enter a valid 10-digit phone number';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: _pincodeController,
//                   decoration: const InputDecoration(
//                     labelText: "Pincode",
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(6),
//                   ],
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter pincode';
//                     }
//                     if (value.length != 6) {
//                       return 'Pincode must be 6 digits';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 TextFormField(
//                   controller: _addressController,
//                   decoration: const InputDecoration(
//                     labelText: "Complete Address",
//                     hintText: "House/Flat No., Building, Locality/Area",
//                     border: OutlineInputBorder(),
//                   ),
//                   maxLines: 3, // Allow multiple lines for address
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your complete address';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 const Text(
//                   'Address Type',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Row(
//                   children: [
//                     Radio(
//                       value: 'Home',
//                       groupValue: _addressType,
//                       onChanged: (value) {
//                         setState(() {
//                           _addressType = value.toString();
//                         });
//                       },
//                     ),
//                     const Text('Home'),
//                     Radio(
//                       value: 'Office',
//                       groupValue: _addressType,
//                       onChanged: (value) {
//                         setState(() {
//                           _addressType = value.toString();
//                         });
//                       },
//                     ),
//                     const Text('Office'),
//                     Radio(
//                       value: 'Other',
//                       groupValue: _addressType,
//                       onChanged: (value) {
//                         setState(() {
//                           _addressType = value.toString();
//                         });
//                       },
//                     ),
//                     const Text('Other'),
//                   ],
//                 ),
//                 if (_addressType == 'Other')
//                   TextFormField(
//                     onChanged: (value) {
//                       setState(() {
//                         _addressName = value;
//                       });
//                     },
//                     decoration: const InputDecoration(
//                       labelText: "Address Name (e.g., Mom's House)",
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) {
//                       if (_addressType == 'Other' &&
//                           (value == null || value.isEmpty)) {
//                         return 'Please enter address name';
//                       }
//                       return null;
//                     },
//                   ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         final address = {
//                           'recipientName': _nameController.text,
//                           'phone': _phoneController.text,
//                           'pincode': _pincodeController.text,
//                           'address': _addressController.text, // Combined address
//                           'addressType': _addressType,
//                           'addressName': _addressType == 'Other'
//                               ? _addressName
//                               : _addressType,
//                         };
//                         widget.onSave(address);
//                       }
//                     },
//                     child: const Text('Save Address'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class AddPatientBottomSheet extends StatefulWidget {
//   final Function(Map<String, dynamic>) onSave;
//
//   const AddPatientBottomSheet({Key? key, required this.onSave}) : super(key: key);
//
//   @override
//   _AddPatientBottomSheetState createState() => _AddPatientBottomSheetState();
// }
//
// class _AddPatientBottomSheetState extends State<AddPatientBottomSheet> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   DateTime? _selectedDate;
//   String _selectedGender = 'Male';
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: ConstrainedBox(
//             constraints: BoxConstraints(
//               maxHeight: constraints.maxHeight * 0.8,
//             ),
//             child: SingleChildScrollView(
//               physics: const ClampingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20.0,
//                   vertical: 10.0,
//                 ),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       const Text(
//                         'Add Patient Details',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: _nameController,
//                         decoration: const InputDecoration(
//                           labelText: "Patient's Name",
//                           border: OutlineInputBorder(),
//                           contentPadding: EdgeInsets.symmetric(
//                             horizontal: 12,
//                             vertical: 14,
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter patient name';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       InkWell(
//                         onTap: () => _selectDate(context),
//                         child: InputDecorator(
//                           decoration: const InputDecoration(
//                             labelText: "Date of Birth",
//                             border: OutlineInputBorder(),
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 12,
//                               vertical: 14,
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 _selectedDate == null
//                                     ? 'Select date'
//                                     : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
//                               ),
//                               const Icon(Icons.calendar_today),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Gender',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: RadioListTile<String>(
//                               title: const Text('Male'),
//                               value: 'Male',
//                               groupValue: _selectedGender,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _selectedGender = value!;
//                                 });
//                               },
//                               contentPadding: EdgeInsets.zero,
//                               dense: true,
//                             ),
//                           ),
//                           Expanded(
//                             child: RadioListTile<String>(
//                               title: const Text('Female'),
//                               value: 'Female',
//                               groupValue: _selectedGender,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _selectedGender = value!;
//                                 });
//                               },
//                               contentPadding: EdgeInsets.zero,
//                               dense: true,
//                             ),
//                           ),
//                           Expanded(
//                             child: RadioListTile<String>(
//                               title: const Text('Other'),
//                               value: 'Other',
//                               groupValue: _selectedGender,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _selectedGender = value!;
//                                 });
//                               },
//                               contentPadding: EdgeInsets.zero,
//                               dense: true,
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               if (_selectedDate == null) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text('Please select date of birth'),
//                                   ),
//                                 );
//                                 return;
//                               }
//
//                               final patient = {
//                                 'name': _nameController.text,
//                                 'dob': _selectedDate,
//                                 'gender': _selectedGender,
//                               };
//                               widget.onSave(patient);
//                             }
//                           },
//                           child: const Text('Save Patient'),
//                         ),
//                       ),
//                       const SizedBox(height: 10), // Ensure minimal bottom padding
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//
//   }
// }
// class SelectSlotBottomSheet extends StatefulWidget {
//   final Map<String, dynamic> address;
//   final Map<String, dynamic> patient;
//   final Function(String) onSlotSelected;
//
//   const SelectSlotBottomSheet({
//     Key? key,
//     required this.address,
//     required this.patient,
//     required this.onSlotSelected,
//   }) : super(key: key);
//
//   @override
//   _SelectSlotBottomSheetState createState() => _SelectSlotBottomSheetState();
// }
//
// class _SelectSlotBottomSheetState extends State<SelectSlotBottomSheet> {
//   String? _selectedSlot;
//   final List<String> _timeSlots = [
//     '9:00 AM - 11:00 AM',
//     '11:00 AM - 1:00 PM',
//     '2:00 PM - 4:00 PM',
//     '4:00 PM - 6:00 PM',
//     '6:00 PM - 8:00 PM',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final dob = widget.patient['dob'] as DateTime;
//
//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       child: Container(
//         constraints: BoxConstraints(
//           maxHeight: MediaQuery.of(context).size.height * 0.85,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(16),
//               child: const Text(
//                 'Select Time Slot',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Divider(height: 1),
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const AlwaysScrollableScrollPhysics(),
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     minHeight: MediaQuery.of(context).size.height * 0.85 - 100,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildSectionTitle('Delivery Address'),
//                         _buildInfoRow('Name:', widget.address['recipientName']),
//                         _buildInfoRow('Address:', widget.address['address']),
//                         _buildInfoRow('Pincode:', widget.address['pincode']),
//                         _buildInfoRow('Phone:', widget.address['phone']),
//                         const SizedBox(height: 16),
//                         _buildSectionTitle('Patient Details'),
//                         _buildInfoRow('Name:', widget.patient['name']),
//                         _buildInfoRow('DOB:', '${dob.day}/${dob.month}/${dob.year}'),
//                         _buildInfoRow('Gender:', widget.patient['gender']),
//                         const SizedBox(height: 24),
//                         _buildSectionTitle('Available Time Slots'),
//                         ..._timeSlots.map((slot) => RadioListTile<String>(
//                           title: Text(slot),
//                           value: slot,
//                           groupValue: _selectedSlot,
//                           onChanged: (value) => setState(() => _selectedSlot = value),
//                           contentPadding: EdgeInsets.zero,
//                         )).toList(),
//                         const SizedBox(height: 16),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(16),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                   onPressed: _selectedSlot == null
//                       ? null
//                       : () {
//                     widget.onSlotSelected(_selectedSlot!);
//                     Navigator.pop(context);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const PaymentPage(),
//                       ),
//                     );
//                   },
//                   child: const Text('Confirm Slot'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 80,
//             child: Text(
//               label,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(width: 8),
//           Expanded(child: Text(value)),
//         ],
//       ),
//     );
//   }
// }
//
//
// class PaymentPage extends StatelessWidget {
//   const PaymentPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Order Summary',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text('Total Items:'),
//                         Text('${cart.items.length}'),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text('Subtotal:'),
//                         Text('₹${cart.totalPrice.toStringAsFixed(2)}'),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text('Delivery Fee:'),
//                         const Text('₹50.00'),
//                       ],
//                     ),
//                     const Divider(height: 24),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Total Amount:',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           '₹${(cart.totalPrice + 50).toStringAsFixed(2)}',
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Delivery Details',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     if (cart.deliveryAddress != null) ...[
//                       Text(
//                         cart.deliveryAddress!['recipientName'],
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       // Text('${cart.deliveryAddress!['houseNumber']}, ${cart.deliveryAddress!['building']}'),
//                       // Text(cart.deliveryAddress!['locality']),
//                       Text(cart.deliveryAddress!['address']),
//                       Text('Pincode: ${cart.deliveryAddress!['pincode']}'),
//                       Text('Phone: ${cart.deliveryAddress!['phone']}'),
//                       const SizedBox(height: 8),
//                       Chip(
//                         label: Text(
//                           cart.deliveryAddress!['addressName'],
//                           style: const TextStyle(color: Colors.white),
//                         ),
//                         backgroundColor: Colors.blue,
//                       ),
//                     ],
//                     const SizedBox(height: 16),
//                     if (cart.selectedSlot != null) ...[
//                       const Text(
//                         'Delivery Slot',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text(cart.selectedSlot!),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Patient Details',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     if (cart.patientDetails != null) ...[
//                       Text(
//                         'Name: ${cart.patientDetails!['name']}',
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text('Gender: ${cart.patientDetails!['gender']}'),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   backgroundColor: Colors.green,
//                 ),
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Payment processed successfully!'),
//                       duration: Duration(seconds: 2),
//                     ),
//                   );
//
//                   Future.delayed(const Duration(seconds: 2), () {
//                     cart.clearCart();
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const OrderConfirmationPage(),
//                       ),
//                     );
//                   });
//                 },
//                 child: Text(
//                   'Pay ₹${(cart.totalPrice + 50).toStringAsFixed(2)}',
//                   style: const TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class OrderConfirmationPage extends StatelessWidget {
//   const OrderConfirmationPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Order Confirmation'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.check_circle,
//               color: Colors.green,
//               size: 100,
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Order Placed Successfully!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Thank you for your purchase',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.popUntil(context, (route) => route.isFirst);
//               },
//               child: const Text('Back to Home'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../providers/cart_provider.dart';
import 'address_bottom_sheet.dart';
import 'patient_bottom_sheet.dart';
import 'slot_bottom_sheet.dart';
import 'payment_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showAddressBottomSheet() {
    final cart = Provider.of<CartProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddressBottomSheet(
        onSave: (address) async {
          cart.setDeliveryAddress(address);
          Navigator.pop(context);

          await Future.delayed(const Duration(milliseconds: 300));

          if (!mounted) return;
          _showPatientBottomSheet();
        },
      ),
    );
  }

  void _showPatientBottomSheet() {
    final cart = Provider.of<CartProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddPatientBottomSheet(
        onSave: (patient) async {
          cart.setPatientDetails(patient);
          Navigator.pop(context);

          await Future.delayed(const Duration(milliseconds: 300));

          if (!mounted) return;
          _showSelectSlotBottomSheet();
        },
      ),
    );
  }

  void _showSelectSlotBottomSheet() {
    final cart = Provider.of<CartProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SelectSlotBottomSheet(
        address: cart.deliveryAddress!,
        patient: cart.patientDetails!,
        onSlotSelected: (selectedSlot) {
          cart.setSelectedSlot(selectedSlot);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentPage(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (cart.items.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            else ...[
              if (cart.deliveryAddress != null)
                _buildAddressCard(cart),
              if (cart.patientDetails != null)
                _buildPatientCard(cart),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.image,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(item.description),
                                  Text(
                                    '₹${item.price}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                cart.removeItem(item.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            if (cart.items.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    if (cart.deliveryAddress != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery to: ${cart.deliveryAddress!['addressName']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: _showAddressBottomSheet,
                              child: Text('Change'),
                            ),
                          ],
                        ),
                      ),
                    if (cart.patientDetails != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Patient: ${cart.patientDetails!['name']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: _showPatientBottomSheet,
                              child: Text('Change'),
                            ),
                          ],
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: ₹${cart.totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (cart.deliveryAddress == null || cart.patientDetails == null) {
                              _showAddressBottomSheet();
                            } else if (cart.selectedSlot == null) {
                              _showSelectSlotBottomSheet();
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PaymentPage(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            cart.deliveryAddress == null || cart.patientDetails == null
                                ? 'Add Details'
                                : cart.selectedSlot == null
                                ? 'Select Delivery Slot'
                                : 'Proceed to Payment',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard(CartProvider cart) {
    final address = cart.deliveryAddress!;
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 20),
                  onPressed: _showAddressBottomSheet,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              '${address['recipientName']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${address['houseNumber']}, ${address['building']}'),
            Text('${address['locality']}'),
            Text('Pincode: ${address['pincode']}'),
            Text('Phone: ${address['phone']}'),
            SizedBox(height: 8),
            Chip(
              label: Text(
                address['addressName'],
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPatientCard(CartProvider cart) {
    final patient = cart.patientDetails!;
    final dob = patient['dob'] as DateTime;
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Patient Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 20),
                  onPressed: _showPatientBottomSheet,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Name: ${patient['name']}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Date of Birth: ${dob.day}/${dob.month}/${dob.year}'),
            Text('Gender: ${patient['gender']}'),
          ],
        ),
      ),
    );
  }
}