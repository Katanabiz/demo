part of global_widgets;

class LoadingWidget extends StatelessWidget {
  LoadingWidget({
    required this.isLoading,
    required this.child,
    this.height = 0,
    this.color = Colors.green,
  });
  final bool isLoading;
  final Widget child;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? FadeIn(
            delay: Duration(milliseconds: 200),
            child: Container(
                height: this.height == 0 ? Get.height : this.height,
                child: Center(
                    child: CircularProgressIndicator(
                  color: color == Colors.green
                      ? Get.theme.primaryColor
                      : Colors.white,
                ))),
          )
        : FadeIn(delay: Duration(milliseconds: 200), child: child);
  }
}
