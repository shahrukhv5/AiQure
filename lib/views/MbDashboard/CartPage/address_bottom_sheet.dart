import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressBottomSheet extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

  const AddressBottomSheet({Key? key, required this.onSave}) : super(key: key);

  @override
  _AddressBottomSheetState createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _addressType = 'Home';
  String _addressName = '';

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _pincodeController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Delivery Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Recipient's Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter recipient name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    if (value.length != 10) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _pincodeController,
                  decoration: const InputDecoration(
                    labelText: "Pincode",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pincode';
                    }
                    if (value.length != 6) {
                      return 'Pincode must be 6 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: "Complete Address",
                    hintText: "House/Flat No., Building, Locality/Area",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your complete address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Address Type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Home',
                      groupValue: _addressType,
                      onChanged: (value) {
                        setState(() {
                          _addressType = value.toString();
                        });
                      },
                    ),
                    const Text('Home'),
                    Radio(
                      value: 'Office',
                      groupValue: _addressType,
                      onChanged: (value) {
                        setState(() {
                          _addressType = value.toString();
                        });
                      },
                    ),
                    const Text('Office'),
                    Radio(
                      value: 'Other',
                      groupValue: _addressType,
                      onChanged: (value) {
                        setState(() {
                          _addressType = value.toString();
                        });
                      },
                    ),
                    const Text('Other'),
                  ],
                ),
                if (_addressType == 'Other')
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _addressName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Address Name (e.g., Mom's House)",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (_addressType == 'Other' &&
                          (value == null || value.isEmpty)) {
                        return 'Please enter address name';
                      }
                      return null;
                    },
                  ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final address = {
                          'recipientName': _nameController.text,
                          'phone': _phoneController.text,
                          'pincode': _pincodeController.text,
                          'address': _addressController.text,
                          'addressType': _addressType,
                          'addressName': _addressType == 'Other'
                              ? _addressName
                              : _addressType,
                        };
                        widget.onSave(address);
                      }
                    },
                    child: const Text('Save Address'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}