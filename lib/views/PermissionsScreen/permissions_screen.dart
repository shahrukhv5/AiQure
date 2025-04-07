// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class PermissionHandlerScreen extends StatefulWidget {
//   final Widget nextScreen;
//
//   const PermissionHandlerScreen({super.key, required this.nextScreen});
//
//   @override
//   State<PermissionHandlerScreen> createState() => _PermissionHandlerScreenState();
// }
//
// class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
//   bool _isLoading = true;
//   bool _allPermissionsGranted = false;
//   bool _showPermissionDenied = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//   }
//
//   Future<void> _checkPermissions() async {
//     final locationStatus = await Permission.location.status;
//     final cameraStatus = await Permission.camera.status;
//     final storageStatus = await Permission.storage.status;
//     final photosStatus = await Permission.photos.status;
//
//     if (locationStatus.isGranted &&
//         cameraStatus.isGranted &&
//         (storageStatus.isGranted || photosStatus.isGranted)) {
//       _allPermissionsGranted = true;
//       if (mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => widget.nextScreen),
//         );
//       }
//     } else {
//       setState(() => _isLoading = false);
//     }
//   }
//
//   Future<void> _requestPermissions() async {
//     setState(() {
//       _isLoading = true;
//       _showPermissionDenied = false;
//     });
//
//     final permissions = await [
//       Permission.location,
//       Permission.camera,
//       Permission.storage,
//       Permission.photos,
//     ].request();
//
//     final locationGranted = permissions[Permission.location]?.isGranted ?? false;
//     final cameraGranted = permissions[Permission.camera]?.isGranted ?? false;
//     final storageGranted = permissions[Permission.storage]?.isGranted ?? false;
//     final photosGranted = permissions[Permission.photos]?.isGranted ?? false;
//
//     if (locationGranted && cameraGranted && (storageGranted || photosGranted)) {
//       if (mounted) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => widget.nextScreen),
//         );
//       }
//     } else {
//       setState(() {
//         _isLoading = false;
//         _showPermissionDenied = true;
//       });
//
//       // Show which permissions were denied
//       final deniedPermissions = [];
//       if (!locationGranted) deniedPermissions.add('Location');
//       if (!cameraGranted) deniedPermissions.add('Camera');
//       if (!storageGranted && !photosGranted) deniedPermissions.add('Storage/Photos');
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please grant ${deniedPermissions.join(', ')} permissions to continue'),
//           duration: const Duration(seconds: 3),
//         ),
//       );
//     }
//   }
//
//   void _openAppSettings() async {
//     await openAppSettings();
//   }
//
//   void _showPermissionRationale() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Why We Need These Permissions'),
//         content: const SingleChildScrollView(
//           child: ListBody(
//             children: [
//               Text('To provide the full functionality of our app, we need the following permissions:'),
//               SizedBox(height: 16),
//               _PermissionRationaleItem(
//                 icon: Icons.location_on,
//                 title: 'Location Access',
//                 description: 'To provide location-based services and content relevant to your area',
//               ),
//               _PermissionRationaleItem(
//                 icon: Icons.camera_alt,
//                 title: 'Camera Access',
//                 description: 'To enable photo and video capture features in the app',
//               ),
//               _PermissionRationaleItem(
//                 icon: Icons.photo_library,
//                 title: 'Storage/Photos Access',
//                 description: 'To save and retrieve media files from your device',
//               ),
//               SizedBox(height: 16),
//               Text('All permissions are required for the app to function properly.'),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _requestPermissions();
//             },
//             child: const Text('Continue'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Permissions Required'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.perm_device_info, size: 100, color: Color(0xFF3661E2)),
//             const SizedBox(height: 20),
//             const Text(
//               'This app requires the following permissions to function:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'All permissions are mandatory for the app to work properly.',
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             _buildPermissionItem(Icons.location_on, 'Location - For location-based services'),
//             _buildPermissionItem(Icons.camera_alt, 'Camera - To capture photos and videos'),
//             _buildPermissionItem(Icons.photo_library, 'Storage/Photos - To access and save media'),
//             const SizedBox(height: 30),
//             if (_showPermissionDenied)
//               Column(
//                 children: [
//                   const Text(
//                     'Some permissions were denied',
//                     style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   TextButton(
//                     onPressed: _openAppSettings,
//                     child: const Text('Open Settings to grant permissions'),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ElevatedButton(
//               onPressed: _showPermissionRationale,
//               child: const Text('GRANT PERMISSIONS'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 50),
//                 backgroundColor: Colors.blue,
//                 foregroundColor: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPermissionItem(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: Colors.blue),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(text, style: const TextStyle(fontSize: 14)),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _PermissionRationaleItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//
//   const _PermissionRationaleItem({
//     required this.icon,
//     required this.title,
//     required this.description,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: 24, color: Colors.blue),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//                 Text(
//                   description,
//                   style: const TextStyle(fontSize: 13),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerScreen extends StatefulWidget {
  final Widget nextScreen;

  const PermissionHandlerScreen({super.key, required this.nextScreen});

  @override
  State<PermissionHandlerScreen> createState() =>
      _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  bool _isLoading = true;
  bool _allPermissionsGranted = false;
  bool _showPermissionDenied = false;

  static const Color primaryColor = Color(0xFF3661E2);

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final locationStatus = await Permission.location.status;
    final cameraStatus = await Permission.camera.status;
    final storageStatus = await Permission.storage.status;
    final photosStatus = await Permission.photos.status;

    if (locationStatus.isGranted &&
        cameraStatus.isGranted &&
        (storageStatus.isGranted || photosStatus.isGranted)) {
      _allPermissionsGranted = true;
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.nextScreen),
        );
      }
    } else {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _requestPermissions() async {
    setState(() {
      _isLoading = true;
      _showPermissionDenied = false;
    });

    final permissions =
        await [
          Permission.location,
          Permission.camera,
          Permission.storage,
          Permission.photos,
        ].request();

    final locationGranted =
        permissions[Permission.location]?.isGranted ?? false;
    final cameraGranted = permissions[Permission.camera]?.isGranted ?? false;
    final storageGranted = permissions[Permission.storage]?.isGranted ?? false;
    final photosGranted = permissions[Permission.photos]?.isGranted ?? false;

    if (locationGranted && cameraGranted && (storageGranted || photosGranted)) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => widget.nextScreen),
        );
      }
    } else {
      setState(() {
        _isLoading = false;
        _showPermissionDenied = true;
      });

      final deniedPermissions = [];
      if (!locationGranted) deniedPermissions.add('Location');
      if (!cameraGranted) deniedPermissions.add('Camera');
      if (!storageGranted && !photosGranted)
        deniedPermissions.add('Storage/Photos');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please grant ${deniedPermissions.join(', ')} permissions to continue',
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _openAppSettings() async {
    await openAppSettings();
  }

  void _showPermissionRationale() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Why We Need These Permissions'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    'To provide the full functionality of our app, we need the following permissions:',
                  ),
                  SizedBox(height: 16),
                  _PermissionRationaleItem(
                    icon: Icons.location_on,
                    title: 'Location Access',
                    description:
                        'To provide location-based services and content relevant to your area',
                  ),
                  _PermissionRationaleItem(
                    icon: Icons.camera_alt,
                    title: 'Camera Access',
                    description:
                        'To enable photo and video capture features in the app',
                  ),
                  _PermissionRationaleItem(
                    icon: Icons.photo_library,
                    title: 'Storage/Photos Access',
                    description:
                        'To save and retrieve media files from your device',
                  ),
                  SizedBox(height: 16),
                  Text(
                    'All permissions are required for the app to function properly.',
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xFF3661E2)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _requestPermissions();
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Color(0xFF3661E2)),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions Required'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.perm_device_info, size: 100, color: primaryColor),
            const SizedBox(height: 20),
            const Text(
              'This app requires the following permissions to function:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'All permissions are mandatory for the app to work properly.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildPermissionItem(
              Icons.location_on,
              'Location - For location-based services',
            ),
            _buildPermissionItem(
              Icons.camera_alt,
              'Camera - To capture photos and videos',
            ),
            _buildPermissionItem(
              Icons.photo_library,
              'Storage/Photos - To access and save media',
            ),
            const SizedBox(height: 30),
            if (_showPermissionDenied)
              Column(
                children: [
                  const Text(
                    'Some permissions were denied',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: _openAppSettings,
                    child: const Text('Open Settings to grant permissions'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ElevatedButton(
              onPressed: _showPermissionRationale,
              child: const Text('GRANT PERMISSIONS'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryColor),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

class _PermissionRationaleItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  static const Color primaryColor = Color(0xFF3661E2);

  const _PermissionRationaleItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(description, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
