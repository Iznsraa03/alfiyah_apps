import 'package:alfiyah_apps/app/Utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget priorityBadge(String segment) {
  Color color;
  String label;

  switch (segment.toLowerCase()) {
    case 'high':
      color = Colors.red;
      label = 'High Priority';
      break;
    case 'medium':
      color = Colors.orange;
      label = 'Medium Priority';
      break;
    case 'low':
      color = Colors.green;
      label = 'Low Priority';
      break;
    default:
      color = AppColors.primary;
      label = segment;
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    ),
  );
}

Widget monetaryBadge(String level) {
  Color color;
  IconData icon;

  switch (level.toLowerCase()) {
    case 'vip':
      color = Colors.purple;
      icon = Icons.diamond;
      break;
    case 'premium':
      color = Colors.amber;
      icon = Icons.star;
      break;
    default:
      color = Colors.grey;
      icon = Icons.person;
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 4),
        Text(
          level.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    ),
  );
}

Widget urgencyBadge(String urgency) {
  Color color;
  
  switch (urgency.toLowerCase()) {
    case 'urgent':
      color = Colors.red;
      break;
    case 'soon':
      color = Colors.orange;
      break;
    default:
      color = Colors.blue;
  }

  return Container(
    width: 8,
    height: 8,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}
