part of global_widgets;

class ShowHideWidget extends StatelessWidget {
  const ShowHideWidget({required this.isItShow, required this.child});
  final bool isItShow;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return isItShow ? child : SizedBox.shrink();
  }
}
