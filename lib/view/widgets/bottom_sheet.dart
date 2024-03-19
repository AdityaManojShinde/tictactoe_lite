import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomSheet {
  void show(
      {required BuildContext ctx,
      required content,
      required WidgetRef ref,
      required bool isDraw}) {
    Scaffold.of(ctx).showBottomSheet(
      enableDrag: false,
      elevation: 5,
      (context) => SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      top: 1,
                      right: 2,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Text(
                                'x',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )))),
                  Center(
                      child: SizedBox(
                          height: 500,
                          width: 200,
                          child: Column(
                            children: [
                              !isDraw
                                  ? Image.asset(
                                      'assets/images/trophy.gif',
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/images/draw.png',
                                      fit: BoxFit.cover,
                                    ),
                              const SizedBox(height: 50),
                              Center(
                                child: Text(
                                  content,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ))),
                ],
              )),
        ),
      ),
    );
  }
}
