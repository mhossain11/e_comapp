import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_sheet_card.dart';

abstract class CartUtils {
  static Future<bool> verifyDeletion(BuildContext context,
      {String? message}) async {
    final finalMessage =
        message ?? 'Are you sure you want to remove this item?';
    final result = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      isDismissible: false,
      builder: (_) {
        return BottomSheetCard(
          title: finalMessage,
          positiveButtonText: 'Remove',
          negativeButtonText: 'Cancel',
          positiveButtonColour: Colors.red,
        );
      },
    );

    return result ?? false;
  }



  static Future<bool> verifyDeletions(BuildContext context, {String? message}) async {
    final finalMessage = message ?? 'Are you sure you want to remove this item?';

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text(finalMessage),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false), // Cancel
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true), // Remove
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

}

