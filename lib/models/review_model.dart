// lib/models/review_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String userName;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final String? appointmentId; // ID của appointment liên quan

  Review({
    required this.userName,
    required this.rating,
    required this.comment,
    required this.createdAt,
    this.appointmentId,
  });

  factory Review.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Review(
      userName: data['userName'] ?? 'Người dùng ẩn danh',
      rating: (data['rating'] ?? 0.0).toDouble(),
      comment: data['comment'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      appointmentId: data['appointmentId'] as String?,
    );
  }
}
