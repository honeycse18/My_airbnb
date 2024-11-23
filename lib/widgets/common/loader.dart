import 'package:flutter/material.dart';

class LoaderView extends StatelessWidget {
  final bool loading;
  final Widget child;

  const LoaderView({
    super.key,
    required this.loading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Loader());
    }
    return child;
  }
}

class LoaderStack extends StatelessWidget {
  final bool loading;
  final Widget child;

  const LoaderStack({
    super.key,
    required this.loading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if(loading)
          const Opacity(
            opacity: 0.3,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if(loading)
          const Loader(),
      ],
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black)),
    );
  }
}
