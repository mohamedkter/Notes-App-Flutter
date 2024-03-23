import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:notes/widgets/CustomAppBar.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  Color selectedColor = Colors.green;
  bool Is_Alarm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1D2F3A),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              children: [
                CustomAppBar(
                  AppBarIcon: Icons.close,
                  FunctionToDo: () => Navigator.of(context).pop(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add Note",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Date and Time",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const CustomListWheelScroll(
                          counter: 7,
                          title: "Day",
                          is_zero_start: false,
                        ),
                        const CustomListWheelScroll(
                          counter: 12,
                          title: "Month",
                          is_zero_start: false,
                        ),
                        const CustomListWheelScroll(
                          counter: 24,
                          title: "Hour",
                          is_zero_start: false,
                        ),
                        const CustomListWheelScroll(
                          counter: 60,
                          title: "Minute",
                          is_zero_start: true,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                                height: 90,
                                width: 70,
                                child: ListWheelScrollView(
                                  perspective: 0.005,
                                  diameterRatio: 1.1,
                                  itemExtent: 30,
                                  children: const [
                                    Text("AM",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    Text("PM",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Title",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      maxLines: 1,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                          hintText: "Write the title",
                          fillColor: Color(0xff1D2F3A).withOpacity(0.1),
                          filled: true,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Note",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      maxLines: 2,
                      style:const TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                          hintText: "Write your important note",
                          fillColor: Color(0xff1D2F3A).withOpacity(0.1),
                          filled: true,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Color",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MaterialColorPicker(
                              circleSize: 30,
                              onColorChange: (color) {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                              selectedColor: selectedColor,
                              colors: const [
                                Colors.green,
                                Colors.orange,
                                Colors.red,
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Alarm",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            Switch(
                                activeTrackColor: Color(0xff1D2F3A),
                                activeColor: Colors.white,
                                inactiveThumbColor: Color(0xff1D2F3A),
                                inactiveTrackColor: Colors.white,
                                value: Is_Alarm,
                                onChanged: (value) {
                                  setState(() {
                                    Is_Alarm = value;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                   const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            backgroundColor:const Color(0xff3CAEE4),
                            fixedSize:const Size(150, 80),
                          ),
                          child:const Text("Save",style: TextStyle(fontSize: 24,color: Colors.white),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomListWheelScroll extends StatelessWidget {
  final String title;
  final int counter;
  final bool is_zero_start;
  const CustomListWheelScroll({
    super.key,
    required this.title,
    required this.counter,
    required this.is_zero_start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 100,
            width: 70,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (v) {
                print(v);
              },
              perspective: 0.005,
              diameterRatio: 1.1,
              itemExtent: 30,
              childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) => Text(
                        is_zero_start
                            ? index < 10
                                ? '0' + index.toString()
                                : index.toString()
                            : index < 10
                                ? '0' + (index + 1).toString()
                                : index.toString(),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                  childCount: counter),
            )),
      ],
    );
  }
}
