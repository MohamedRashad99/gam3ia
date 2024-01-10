import 'package:flutter/material.dart';
import 'package:jamaya/app/config/theme.dart';

class MainSheetContainer extends StatelessWidget {
  final List<Widget> body;

  const MainSheetContainer({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.second,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 76,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: AppColors.second,
                  ),
                ),
              ),
              ...body,
            ],
          ),
        ),
      ),
    );
  }
}
