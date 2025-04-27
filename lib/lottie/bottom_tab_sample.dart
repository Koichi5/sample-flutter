import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:sample_flutter/lottie/components/lottie_icon.dart';

class BottomTabSample extends HookWidget {
  const BottomTabSample({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final isRotated = useState(false);
    final fabSize = useState(0.0);

    // タブが切り替わった時の処理
    void onTabChanged(int index) {
      currentIndex.value = index;
      if (index == 2) {
        fabSize.value = 56.0;
        Future.delayed(const Duration(milliseconds: 100), () {
          isRotated.value = true;
        });
      } else {
        // 他のタブが選択された時
        isRotated.value = false;
        fabSize.value = 0.0;
      }
    }

    final screens = [
      Center(
        child: Lottie.asset(
          'assets/lotties/home.json',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          repeat: false,
        ),
      ),
      Center(
        child: Lottie.asset(
          'assets/lotties/video.json',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          repeat: false,
        ),
      ),
      Center(
        child: Lottie.asset(
          'assets/lotties/bookmark.json',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          repeat: false,
        ),
      ),
    ];

    return Scaffold(
      body: screens[currentIndex.value],
      floatingActionButton: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: fabSize.value,
        height: fabSize.value,
        curve: Curves.easeInOut,
        child: currentIndex.value == 2
            ? TweenAnimationBuilder(
                tween: Tween<double>(
                  begin: 0,
                  end: isRotated.value ? 90 : 0,
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                builder: (context, double angle, child) {
                  return Transform.rotate(
                    angle: angle * 3.14159 / 180,
                    child: FloatingActionButton(
                      onPressed: () {
                        print('Add bookmark');
                      },
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF0171E3),
                              const Color(0xFF0171E3).withValues(alpha: 0.5),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: onTabChanged,
        items: [
          BottomNavigationBarItem(
            icon: LottieIcon(
              lottiePath: 'assets/lotties/home.json',
              isSelected: currentIndex.value == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: LottieIcon(
              lottiePath: 'assets/lotties/video.json',
              isSelected: currentIndex.value == 1,
            ),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: LottieIcon(
              lottiePath: 'assets/lotties/bookmark.json',
              isSelected: currentIndex.value == 2,
            ),
            label: 'Bookmark',
          ),
        ],
      ),
    );
  }
}
