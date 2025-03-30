import 'package:flutter/material.dart';
import '../nodes_state.dart';

class HookNodeView extends StatelessWidget {
  final HookNode node;
  final bool isSelected;
  final VoidCallback? onTap;

  const HookNodeView({
    super.key,
    required this.node,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              node.type,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            if (node.label != null) ...[
              const SizedBox(height: 4),
              Text(node.label!, style: const TextStyle(fontSize: 10)),
            ],
            if (node.value != null) ...[
              const SizedBox(height: 4),
              Text(
                node.value!,
                style: const TextStyle(fontSize: 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
