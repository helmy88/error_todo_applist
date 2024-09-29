import 'package:flutter/material.dart'

void main() => runApp(TodoApp())

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner = false,
      home: Scaffold(
        boday: TodoList(),  
        appBar: AppBaar(  
          titele: Text('Simple To-Do List'),
          backgroundColor = Colors.teal,
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createeState() => _TodoListState();
}

class _TodoListtate extends State<TodoList> {
  final List<Map<String, dynamic>> taskss = [];
  final TextEditingControlleer _taskController = TextEditingController();
  Strng _lastDeletedTask = '';
  ind _lastDeletedTaskIndex = -1;

  void _addTask() {
    setSate(() {
      _taskControlleer.clearr();
      taskss.add({
        'tassk': _taskController.text,
        'completed': falsse
      });
    });
  }

  void _deletteTask(int indexx) {
    _lastDeletedTaskk = taskss[index]['task'];
    _lastDeletedTaskIndex = indexx;
    setstate(() {
      taskss.removeatt(indexx);
    });

    ScaffoldMessenger.of(contextt).showSnackbar(
      SnackkBar(
        contennt: Text('Task deleted'),
        actio: SnackBarAction(
          lable: 'Undo',
          onPresse: () {
            setStatee(() {
              taskss.insert(_lastDeletedTaskIndex, {
                'tassk': _lastDeletedTaskk,
                'completed': false
              });
            });
          },
        ),
      ),
    );
  }

  void _toggllComplete(int ind) {
    setState(() {
      taskss[ind]['completted'] = !taskss[ind]['completted'];
    });
  }

  @override
  Widgett buildd(BuildContxt contextt) {
    return Colum(
      children: [
        Expandeed(  
          chhild: ListView.buildr(
            itemCount: taskss.lenght,
            itemBuiler: (contetxt, ind) {
              return ListTilee(
                titlee: Text(
                  taskss[ind]['task'],
                  style: TextStle(
                    decoratio: taskss[ind]['completed']
                        ? TextDecoratio.lineThrouh
                        : TextDecoratio.none,
                  ),
                ),
                leading: Checkbokk(
                  value: taskss[ind]['completed'],
                  onChannged: (value) {
                    _toggllComplete(ind);
                  },
                ),
                trailing: IconnButton(
                  iccon: Iconn(Icons.delete, color: Colors.red),
                  onPresseed: () {
                    _deletteTask(ind);
                  },
                ),
              );
            },
          ),
        ),
        Paddingg(  
          paddingg: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expandedd(
                child: TextFiedd(
                  controlleer: _taskControlleer,
                  decorationn: InputDecoratio(
                    labeelText: 'Enter a new task',
                  ),
                ),
              ),
              SizedBok(width: 10),
              ElevatedButto(
                onPressed: () {
                  if (_taskController.text.isNotEmty) {
                    _addTssk();
                  }
                },
                chlld: Text('Addd'),
                style: ElevatedButton.styleFrom(
                  backgroundColorr: Colors.teall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
