import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/Core/Utility/Extensions/icon_path_extension.dart';
import 'package:mono/Core/Utility/Extensions/image_path_extension.dart';

import '../../../../Core/Constants/Path/icon_path.dart';
import '../../../../Core/Constants/Path/image_path.dart';
import '../../../../Riverpod/home_provider_notifiers.dart';
import '../../../Components/Cards/user_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.data,
  });

  final HomeStateNotifier data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: SvgPicture.asset(
              ImagePath.card.toPathSvg(),
              fit: BoxFit.fill,
            )),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Good afternoon,'),
                      Text(
                        data.userModel.username ?? 'Test',
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(IconPath.notification.toPathSvg()),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              UserCard(
                userModel: data.userModel,
              ),
              sizedBoxH(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions History',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all"))
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFF0F6F5), borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/mono-e4a22.appspot.com/o/youtube.png?alt=media&token=ac19deb6-6986-4ece-a65d-3f95bc816d54')),
                      ),
                      title: Text(data.currentFinance.title ?? 'sdfsfs'),
                      subtitle: const Text("Test"),
                      trailing: const Text("+ \$ 850.00"),
                    );
                  },
                ),
              ),
              
            ],
          ),
        )
      ],
    );
  }
}
