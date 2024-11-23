import 'dart:developer';

import 'package:airbnb_app/constants/app_gaps.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      top: 40,
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          type: MaterialType.transparency,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey, width: 0.1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // search Icon
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 5),
                        child: Icon(
                          Icons.search,
                          size: 24,
                        ),
                      ),
                      AppGaps.wGap8,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Where to?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          Text(
                            'Anywhere * Any week * Add guest',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppGaps.hGap15,
                  IconButton(
                    highlightColor: Colors.grey[200],
                    icon: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0, 0),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.tune,
                          size: 20,
                        )),
                    onPressed: () {},
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
