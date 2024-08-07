import 'package:bag_shop/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final dropDownItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back_ios),
                Gap(100),
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                padding: const EdgeInsets.all(5),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar2.png"),
                  radius: 80,
                ),
              ),
              const Positioned(
                bottom: -1,
                left: 120,
                child: Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
              ),
            ],
          ),
          const Gap(20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Emtithal ALjabri',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'emtithal@gmail.com',
              ),
            ),
          ),
          DropdownMenu(
            width: 330,
            hintText: 'Country',
            label: const Text('Country'),
            controller: dropDownItem,
            trailingIcon: const Icon(Icons.keyboard_arrow_down),
            selectedTrailingIcon: const Icon(Icons.keyboard_arrow_down),
            inputDecorationTheme:
                const InputDecorationTheme(suffixIconColor: Colors.grey),
            helperText: "Select",
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 1, label: 'Oman'),
              DropdownMenuEntry(value: 1, label: 'Qater'),
              DropdownMenuEntry(value: 1, label: 'Saudia'),
            ],
          ),
          const Gap(30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Colors.white,
              ),
            ),
            child: const Text('Save Changes',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                )),
          ),
        ],
      ),
    );
  }
}
