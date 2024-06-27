import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SliverListTextFiledHome extends HookWidget {
  const SliverListTextFiledHome({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    const textFieldLength = 10000;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverListTextFiledHome'),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= textFieldLength) return null;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    initialValue: 'Field $index',
                    decoration: InputDecoration(
                      labelText: 'Field $index',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                );
              },
              childCount: textFieldLength,
            ),
          ),
        ],
      ),
    );
  }
}

class SliverToBoxAdapterTextFiledHome extends HookWidget {
  const SliverToBoxAdapterTextFiledHome({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    const textFieldLength = 10000;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverToBoxAdapterTextFiledHome'),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          for (int i = 0; i < textFieldLength; i++) ...{
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: 'Field $i',
                  decoration: InputDecoration(
                    labelText: 'Field $i',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          },
        ],
      ),
    );
  }
}

class SingleChildScrollViewTextFiledHome extends HookWidget {
  const SingleChildScrollViewTextFiledHome({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    const textFieldLength = 10000;
    // final List<TextEditingController> controllers = List.generate(
    //   1000,
    //   (index) => useTextEditingController(text: 'Field $index'),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollViewHome'),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
              textFieldLength,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  // controller: controllers[index],
                  initialValue: 'Field $index',
                  decoration: InputDecoration(
                    labelText: 'Field $index',
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewBuilderTextFiledHome extends HookWidget {
  const ListViewBuilderTextFiledHome({super.key});

  @override
  Widget build(BuildContext context) {
    const textFieldLength = 10000;
    // final textEditingControllers = List.generate(
    //   30,
    //   (index) => useTextEditingController(),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewBuilderHome'),
      ),
      body: ListView.builder(
        itemCount: textFieldLength,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // controller: textEditingControllers[index],
              initialValue: 'Field $index',
              decoration: InputDecoration(
                labelText: 'Field $index',
                border: const OutlineInputBorder(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListViewTextFiledHome extends HookWidget {
  const ListViewTextFiledHome({super.key});

  @override
  Widget build(BuildContext context) {
    const textFieldLength = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewHome'),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < textFieldLength; i++) ...{
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: 'Field $i',
                decoration: InputDecoration(
                  labelText: 'Field $i',
                  border: const OutlineInputBorder(),
                ),
              ),
            )
          },
        ],
      ),
    );
  }
}

class SliverCheckBoxDemo extends HookWidget {
  const SliverCheckBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    const checkBoxLength = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliver CheckBox Demo'),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= checkBoxLength) return null;
                return CheckBoxTile(index: index);
              },
              childCount: checkBoxLength,
            ),
          ),
        ],
      ),
    );
  }
}

class SingleChildScrollViewCheckBoxDemo extends HookWidget {
  const SingleChildScrollViewCheckBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const checkBoxLength = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView CheckBox Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            checkBoxLength,
            (index) => CheckBoxTile(index: index),
          ),
        ),
      ),
    );
  }
}

class ListViewCheckboxDemo extends HookWidget {
  const ListViewCheckboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const checkBoxLength = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView with Checkboxes'),
      ),
      body: ListView(
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        // children: List.generate(
        //   checkBoxLength,
        //   (index) => CheckBoxTile(index: index),
        // ),

        children: [
          for (int i = 0; i < checkBoxLength; i++) ...{
            CheckBoxTile(
              index: i,
            ),
          }
        ],

        // itemCount: checkBoxLength,
        // itemBuilder: (context, index) {
        //   return Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: CheckBoxTile(
        //       index: index,
        //     ),
        //   );
        // },
      ),
    );
  }
}

class ListViewBuilderCheckboxDemo extends HookWidget {
  const ListViewBuilderCheckboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const checkBoxLength = 30;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView with Checkboxes'),
      ),
      body: ListView.builder(
        itemCount: checkBoxLength,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckBoxTile(
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class CheckBoxTile extends HookWidget {
  final int index;

  const CheckBoxTile({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(false);

    return ListTile(
      title: Text('Item $index'),
      trailing: Checkbox(
        value: isChecked.value,
        onChanged: (bool? value) {
          isChecked.value = value!;
        },
      ),
    );
  }
}
