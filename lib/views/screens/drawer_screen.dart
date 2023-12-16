import 'package:flutter/material.dart';
import 'package:shoes_ui/models/brandModel.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 3.0,
      width: size> 768 ? size*0.3  :size * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                height: 80,
                child: const ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/icons/account.png'),
                    radius: 30,
                  ),
                  title: Text('Confused Student'),
                  subtitle: Text('studentproblem2020@gmail.com'),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2.0,
            ),

            // show name and icon image by accessing through model
            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: drawerList.length,
              itemBuilder: (context, index) {
                final drawerContent = drawerList[index];
                return Card(
                  elevation: 1.0,
                  child: ListTile(
                    leading: Image.asset(
                      drawerContent['imageUrl'],
                      height: 30,
                      width: 30,
                    ),
                    title: Text(
                      drawerContent['name'],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
