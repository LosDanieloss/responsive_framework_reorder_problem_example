import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 480, name: MOBILE),
        const Breakpoint(start: 481, end: 960, name: TABLET),
        const Breakpoint(start: 961, end: double.infinity, name: DESKTOP),
      ],
      child: Builder(
        builder: (context) {
          return ResponsiveScaledBox(
            width: ResponsiveValue<double>(
              context,
              conditionalValues: [],
              defaultValue: 800,
            ).value,
            child: MediaQuery.withClampedTextScaling(
              maxScaleFactor: 1,
              child: MaterialApp(
                home: CustomScrollView(
                  slivers: [
                    SliverReorderableList(
                      itemExtent: 110,
                      itemBuilder: (context, index) {
                        return RepaintBoundary(
                          key: ValueKey(index),
                          child: ReorderableDelayedDragStartListener(
                            index: index,
                            child: ColoredBox(
                              color: index.isEven
                                  ? Colors.greenAccent
                                  : Colors.amberAccent,
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                      // onReorder: cubit.reorderProjects,
                      onReorder: (oldIndex, newIndex) {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
