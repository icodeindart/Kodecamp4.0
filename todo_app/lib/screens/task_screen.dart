import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/util/empty_space_widget.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key, required this.name});
  final String name;
  Color floatingActionButtonColor = const Color(0xFF4959F4);
  IconData? floatingActionButtonIcon = Icons.add;
  TextEditingController? taskName = TextEditingController();
  TextEditingController? taskDescription = TextEditingController();
  List activeTasksDetails = [];
  late int numberOfTasks;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void onClickFloatingActionButton() {
    setState(() {
      widget.floatingActionButtonColor = Colors.white;
      widget.floatingActionButtonIcon = Icons.clear;
    });
  }

  List taskOrProjectDetails = [
    ['📦', 'New Tasks', 0],
    ['🙌', 'Active Projects', 13]
  ];
  void deleteTask(List taskdetails, int index) {
    setState(() {
      taskdetails.removeAt(index);
      taskOrProjectDetails[0][2] = widget.activeTasksDetails.length;
    });
  }

  void createTask(
      TextEditingController? taskName, TextEditingController? taskDescription) {
    setState(() {
      widget.taskName = taskName;
      widget.taskDescription = taskDescription;
      widget.activeTasksDetails
          .add([widget.taskName!.text, widget.taskDescription!.text]);
    });
    widget.taskName!.clear();
    widget.taskDescription!.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: widget.floatingActionButtonColor,
          onPressed: () {
            onClickFloatingActionButton();
            showDialog(
                barrierColor: Colors.white60,
                context: context,
                builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 175),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Create Task',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontFamily: 'Roboto'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: SizedBox(
                                              width: 300,
                                              height: 300,
                                              child: Column(
                                                children: [
                                                  const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Task Name",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller: widget.taskName,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                    decoration:
                                                        const InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color: Colors.grey),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color: Colors.grey),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                  const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Task Description",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        widget.taskDescription,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                    decoration:
                                                        const InputDecoration(
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color: Colors.grey),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color: Colors.grey),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 3,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Cancel')),
                                              TextButton(
                                                  onPressed: () {
                                                    createTask(widget.taskName,
                                                        widget.taskDescription);
                                                    setState(() {
                                                      taskOrProjectDetails[0]
                                                              [2] =
                                                          widget
                                                              .activeTasksDetails
                                                              .length;
                                                    });
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Save'))
                                            ],
                                          ));
                                },
                                shape: const CircleBorder(),
                                backgroundColor: const Color(0xFF4959F4),
                                child: const Icon(
                                  Icons.task_alt_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const EmptySpace(25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Create Project',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontFamily: 'Roboto'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                onPressed: () {},
                                shape: const CircleBorder(),
                                backgroundColor: const Color(0xFF4959F4),
                                child: const Icon(
                                  Icons.feed_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )).then((_) {
              setState(() {
                widget.floatingActionButtonColor = const Color(0xFF4959F4);
                widget.floatingActionButtonIcon = Icons.add;
              });
            });
          },
          child: Icon(widget.floatingActionButtonIcon),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        surfaceTintColor: Colors.grey[200],
        automaticallyImplyLeading: false,
        title: UserIntroBarWidget(widget: widget),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const EmptySpace(30),
            SizedBox(
              height: 180,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TaskAndProjectInfoWidget(
                  emoji: taskOrProjectDetails[index][0],
                  taskOrProjectNum: taskOrProjectDetails[index][2],
                  taskOrProjectText: taskOrProjectDetails[index][1],
                ),
                itemCount: taskOrProjectDetails.length,
              ),
            ),
            const EmptySpace(30),
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF4959F4),
                  radius: 5,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Tasks',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ],
            ),
            const EmptySpace(15),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return TaskDisplayWidget(
                        taskList: widget.activeTasksDetails,
                        widget: widget,
                        index: index,
                        taskName: widget.activeTasksDetails[index][0],
                        taskDescription: widget.activeTasksDetails[index][1],
                        delete: deleteTask);
                  },
                  separatorBuilder: (context, index) => const EmptySpace(10),
                  itemCount: widget.activeTasksDetails.length),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.other_houses_outlined,
            ),
            label: 'Start',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.feed_outlined), label: 'Projects'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined), label: 'Menu'),
        ],
        selectedLabelStyle: const TextStyle(color: Color(0xFF4959F4)),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: const Color(0xFF4959F4),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // selectedIconTheme: IconThemeData(
        //   color: const Color(0xFF4959F4),
        // ),
      ),
    );
  }
}

class TaskDisplayWidget extends StatefulWidget {
  TaskDisplayWidget(
      {super.key,
      required this.widget,
      required this.taskName,
      required this.taskDescription,
      required this.delete,
      required this.taskList,
      required this.index});
  bool onSelect = false;
  final TaskScreen widget;
  final String taskName;
  final String taskDescription;
  void Function(List tasks, int index) delete;
  final int index;
  List taskList;
  @override
  State<TaskDisplayWidget> createState() => _TaskDisplayWidgetState();
}

class _TaskDisplayWidgetState extends State<TaskDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.taskList[widget.index]),
      endActionPane: ActionPane(
          dismissible: DismissiblePane(onDismissed: () {
            widget.delete(widget.taskList, widget.index);
          }),
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.delete(widget.taskList, widget.index);
              },
              icon: Icons.delete,
            )
          ]),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 3,
              color: Colors.grey.shade100,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              setState(() {
                widget.onSelect = !widget.onSelect;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.grey),
                shape: BoxShape.circle,
                color: widget.onSelect ? const Color(0xFF4959F4) : Colors.white,
              ),
              child: Icon(
                widget.onSelect ? Icons.check : null,
                size: 20,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.taskName,
                style: const TextStyle(),
              ),
              Text(
                widget.taskDescription,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserIntroBarWidget extends StatelessWidget {
  const UserIntroBarWidget({
    super.key,
    required this.widget,
  });

  final TaskScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'June Feb 17',
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 180,
              child: Text(
                'Hello, ${widget.name}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 33,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Text('👋'),
            const SizedBox(
              width: 60,
            ),
            const Icon(
              Icons.search,
              size: 35,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.notifications_none_outlined,
              size: 35,
            )
          ],
        ),
      ],
    );
  }
}

class TaskAndProjectInfoWidget extends StatelessWidget {
  const TaskAndProjectInfoWidget({
    required this.emoji,
    required this.taskOrProjectNum,
    required this.taskOrProjectText,
    super.key,
  });
  final String emoji;
  final int taskOrProjectNum;
  final String taskOrProjectText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Text(
            taskOrProjectText,
            style: const TextStyle(fontSize: 17),
          ),
          Text(
            '$taskOrProjectNum',
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
