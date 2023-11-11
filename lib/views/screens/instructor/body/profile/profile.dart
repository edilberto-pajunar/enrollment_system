import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/networks/instructor.dart';
import 'package:web_school/values/strings/images.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

@RoutePage()
class InstructorProfileScreen extends StatefulWidget {
  const InstructorProfileScreen({
    required this.instructor,
    super.key,
  });

  final Instructor instructor;

  @override
  State<InstructorProfileScreen> createState() => _InstructorProfileScreenState();
}

class _InstructorProfileScreenState extends State<InstructorProfileScreen> {

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final InstructorDB instructorDB = Provider.of<InstructorDB>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("Profile",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: 24.0),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Icon(Icons.abc),
                      // child: profilePic == null
                      //     ? Image.asset(PngImages.peopleCircle,
                      //   fit: BoxFit.cover,
                      // )
                      //     : Image.network(profilePic,
                      //   fit: BoxFit.cover,
                      // ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),


                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () async {
                          await instructorDB.addFile(true);
                        },
                        icon: Icon(Icons.camera_alt,
                          size: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Center(
              //   child: CircleAvatar(
              //     radius: 40,
              //     child: Stack(
              //       children: [
              //         Icon(CupertinoIcons.profile_circled,
              //           size: 80,
              //         ),
              //         Positioned(
              //           bottom: 0,
              //           right: 0,
              //           child: IconButton(
              //             onPressed: () {},
              //             icon: Icon(Icons.camera_alt,
              //               size: 20,
              //               color: Colors.black87,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              PrimaryTextField(
                controller: TextEditingController(text: widget.instructor.userModel.controlNumber),
                label: "Control Number",
                readOnly: true,
              ),
              PrimaryTextField(
                controller: TextEditingController(text: widget.instructor.firstName),
                label: "First Name",
                readOnly: true,
              ),
              PrimaryTextField(
                controller: TextEditingController(text: widget.instructor.lastName),
                label: "Last Name",
                readOnly: true,
              ),
              PrimaryTextField(
                controller: TextEditingController(text: widget.instructor.grade?.label ?? "N/A"),
                label: "Grade",
                readOnly: true,
              ),
              PrimaryTextField(
                controller: TextEditingController(text: widget.instructor.section?.label ?? "N/A"),
                label: "Section",
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
