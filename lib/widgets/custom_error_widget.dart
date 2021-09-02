import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function? onRetryClicked;

  const CustomErrorWidget(this.errorMessage, {this.onRetryClicked, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.error,
            size: 64,
            color: Colors.red,
          ),
          Text(errorMessage),
          onRetryClicked != null
              ? IconButton(
                  onPressed: () => onRetryClicked,
                  icon: Icon(Icons.restore),
                )
              : Container(),
        ],
      ),
    );
  }
}
