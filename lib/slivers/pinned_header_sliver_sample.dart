import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// PinnedHeaderSliver: https://api.flutter.dev/flutter/widgets/PinnedHeaderSliver-class.html

class PinnedHeaderSliverSample extends HookWidget {
  const PinnedHeaderSliverSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isScrolled = useState(false);
    final scrollController = useScrollController();
    final headerColor =
        isScrolled.value ? const Color(0xFFF7F8F7) : const Color(0xFFF2F2F7);

    useEffect(() {
      void listener() {
        if (scrollController.offset > 0 && !isScrolled.value) {
          isScrolled.value = true;
        } else if (scrollController.offset <= 0 && isScrolled.value) {
          isScrolled.value = false;
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);

    final Widget header = AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: headerColor,
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        crossFadeState: isScrolled.value
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        firstChild: Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
          ),
          child: Text(
            'Settings',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        secondChild: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              thickness: 0.5,
              height: 0.5,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: headerColor,
        child: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              PinnedHeaderSliver(
                child: header,
              ),
              const ItemList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    this.itemCount = 25,
  }) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(
                          left: 24,
                          top: 12,
                          right: 24,
                          bottom: 4,
                        )
                      : const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 24,
                        ),
                  child: Text(
                    'item $index',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 16,
                  thickness: 0.5,
                );
              },
              itemCount: itemCount,
            ),
          ),
        ),
      ),
    );
  }
}
