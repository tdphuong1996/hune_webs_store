import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hune_webs_store/core/bloc/state.dart';

import '../bloc/base_bloc.dart';
import '../bloc/event.dart';

abstract class BaseViewStateless<B extends BaseBloc> extends StatelessWidget {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

   BaseViewStateless({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => createBloc(),
      child: BlocConsumer<B, BaseState>(
          listenWhen: (BaseState previous, BaseState current) {
        // return true/false to determine whether or not
        // to invoke listener with state
        return true;
      }, listener: (BuildContext context, BaseState state) {
        // do stuff here based on BlocA's state
        if (state is LoadingDialogState) {
          if (state.isShow) {
            _loadingOverlay.show(context);
          } else {
            _loadingOverlay.hide();
          }
        }
        if (state is ErrorDialogState) {
          showDialogNotiView(context: context, content: state.message);
        }
      }, buildWhen: (BaseState previous, BaseState current) {
        // return true/false to determine whether or not
        // to rebuild the widget with state
        return rebuildViewWhen(previous, current);
      }, builder: (contextBuilder, BaseState state) {
        // return widget here based on BlocA's state
        if (state is InitialState) {
          contextBuilder.read<B>().add(InitialEvent());
        }
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          onVerticalDragEnd: (DragEndDetails details) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          child: buildView(contextBuilder, state),
        );
      }),
    );
  }

  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is! ErrorDialogState;

  Widget buildView(BuildContext context, BaseState state);

  B createBloc();

  showDialogNotiView({required BuildContext context, required String content}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Thông báo"),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(
                context,
              ),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}

abstract class BaseViewStateful<B extends BaseBloc> extends StatefulWidget {
  const BaseViewStateful({Key? key}) : super(key: key);

  @override
  State<BaseViewStateful> createState() => _BaseViewStatefulState<B>();

  Widget buildView(BuildContext context, BaseState state);

  void initState() {}

  void dispose() {}

  B createBloc();
}

class _BaseViewStatefulState<B extends BaseBloc>
    extends State<BaseViewStateful<B>> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  void initState() {
    super.initState();
    widget.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => widget.createBloc(),
      child: BlocConsumer<B, BaseState>(
          listenWhen: (BaseState previous, BaseState current) {
        // return true/false to determine whether or not
        // to invoke listener with state
        return true;
      }, listener: (BuildContext context, BaseState state) {
        // do stuff here based on BlocA's state
        if (state is LoadingDialogState) {
          if (state.isShow) {
            _loadingOverlay.show(context);
          } else {
            _loadingOverlay.hide();
          }
        }
        if (state is ErrorDialogState) {
          showDialogNotiView(context: context, content: state.message);
        }
      }, buildWhen: (BaseState previous, BaseState current) {
        // return true/false to determine whether or not
        // to rebuild the widget with state
        return rebuildViewWhen(previous, current);
      }, builder: (contextBuilder, BaseState state) {
        // return widget here based on BlocA's state
        if (state is InitialState) {
          contextBuilder.read<B>().add(InitialEvent());
        }
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          onVerticalDragEnd: (DragEndDetails details) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          child: widget.buildView(contextBuilder, state),
        );
      }),
    );
  }

  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is! ErrorDialogState;

  showDialogView({required BuildContext context, required Widget content}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: content);
      },
    );
  }

  showDialogNotiView({required BuildContext context, required String content}) {
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Thông báo"),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(
                context,
              ),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}

class LoadingOverlay {
  OverlayEntry? _overlay;

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) => const ColoredBox(
          color: Color(0x80000000),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.amber),
            ),
          ),
        ),
      );
      Overlay.of(context)?.insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;
    }
  }
}
