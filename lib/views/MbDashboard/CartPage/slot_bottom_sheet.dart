import 'package:aiqure/views/MbDashboard/CartPage/payment_page.dart';
import 'package:flutter/material.dart';

class SelectSlotBottomSheet extends StatefulWidget {
  final Map<String, dynamic> address;
  final Map<String, dynamic> patient;
  final Function(String) onSlotSelected;

  const SelectSlotBottomSheet({
    Key? key,
    required this.address,
    required this.patient,
    required this.onSlotSelected,
  }) : super(key: key);

  @override
  _SelectSlotBottomSheetState createState() => _SelectSlotBottomSheetState();
}

class _SelectSlotBottomSheetState extends State<SelectSlotBottomSheet> {
  String? _selectedSlot;
  final List<String> _timeSlots = [
    '9:00 AM - 11:00 AM',
    '11:00 AM - 1:00 PM',
    '2:00 PM - 4:00 PM',
    '4:00 PM - 6:00 PM',
    '6:00 PM - 8:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final dob = widget.patient['dob'] as DateTime;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Select Time Slot',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.85 - 100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Delivery Address'),
                        _buildInfoRow('Name:', widget.address['recipientName']),
                        _buildInfoRow('Address:', widget.address['address']),
                        _buildInfoRow('Pincode:', widget.address['pincode']),
                        _buildInfoRow('Phone:', widget.address['phone']),
                        const SizedBox(height: 16),
                        _buildSectionTitle('Patient Details'),
                        _buildInfoRow('Name:', widget.patient['name']),
                        _buildInfoRow('DOB:', '${dob.day}/${dob.month}/${dob.year}'),
                        _buildInfoRow('Gender:', widget.patient['gender']),
                        const SizedBox(height: 24),
                        _buildSectionTitle('Available Time Slots'),
                        ..._timeSlots.map((slot) => RadioListTile<String>(
                          title: Text(slot),
                          value: slot,
                          groupValue: _selectedSlot,
                          onChanged: (value) => setState(() => _selectedSlot = value),
                          contentPadding: EdgeInsets.zero,
                        )).toList(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _selectedSlot == null
                      ? null
                      : () {
                    widget.onSlotSelected(_selectedSlot!);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage(),
                      ),
                    );
                  },
                  child: const Text('Confirm Slot'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}