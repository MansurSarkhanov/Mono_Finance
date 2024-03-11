import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Constants/Path/icon_path.dart';
import 'package:mono/Core/Utility/Extensions/icon_path_extension.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2F7E79),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Balance"),
                      Text(
                        "\$2,548.00",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration:
                                BoxDecoration(shape: BoxShape.circle, color: Colors.transparent.withOpacity(0.05)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(IconPath.arrowdown.toPathSvg()),
                            ),
                          ),
                          const Text("Income")
                        ],
                      ),
                      const Text("\$ 1,840.00")
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration:
                                BoxDecoration(shape: BoxShape.circle, color: Colors.transparent.withOpacity(0.05)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(IconPath.arrowup.toPathSvg()),
                            ),
                          ),
                          const Text("Expenses")
                        ],
                      ),
                      const Text("\$ 1,840.00")
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
