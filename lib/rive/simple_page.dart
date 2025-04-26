import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rive/rive.dart';

// Toggle Rive: https://rive.app/marketplace/9361-17807-skeuomorphic-toggle/
class RiveSimplePage extends HookWidget {
  const RiveSimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useRef<StateMachineController?>(null);
    final toggleState = useState(true);
    final toggleInput = useState<SMIBool?>(null);

    void handleToggle() {
      if (toggleInput.value != null) {
        toggleState.value = !toggleState.value;
        toggleInput.value!.value = toggleState.value;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Page')),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: GestureDetector(
            onTap: handleToggle,
            child: RiveAnimation.asset(
              'assets/rives/toggle.riv',
              fit: BoxFit.cover,
              onInit: (artboard) {
                controller.value = StateMachineController.fromArtboard(
                  artboard,
                  'State Machine',
                );

                if (controller.value == null) return;

                artboard.addController(controller.value!);
                toggleInput.value =
                    controller.value!.findInput<bool>('IsOn') as SMIBool;
                toggleInput.value!.value = toggleState.value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
