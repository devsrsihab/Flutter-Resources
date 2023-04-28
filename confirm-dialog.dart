import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

//app class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeActivity());
  }
}

//home activity
class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  //snackbar
  mySnackbar(messsage, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messsage)));
  }

  //alert dialog
  myAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: const Text("Alert"),
              content: const Text("Do You Want To Delete ?"),
              actions: [
                TextButton(
                  child: const Text("Yes"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    mySnackbar("Deleted Successfully!", context);
                  },
                ),
                TextButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //buttons styling
    ButtonStyle buttonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.all(30),
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );

    //confirm dialog
    myAlertDialog() {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
                title: const Text("Alert!"),
                content: const Text("Are you Want to Deleted it ?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      mySnackbar("Yes", context);
                    },
                    child: const Text("Yes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      mySnackbar("No", context);
                    },
                    child: const Text("No"),
                  ),
                ]),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('This is appbar'),
        actions: [
          IconButton(
            onPressed: () {
              mySnackbar('This is App bar facebook', context);
            },
            icon: const Icon(Icons.facebook_outlined),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: "Cash"),
          ],
          onTap: (int index) {
            if (index == 0) {
              mySnackbar("This is Home", context);
            }
            if (index == 1) {
              mySnackbar("this is message", context);
            }
            if (index == 2) {
              mySnackbar("this is cash", context);
            }
          }),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                accountName: const Text('Sohan'),
                accountEmail: const Text('info@gmail.com'),
                currentAccountPicture: Image.network(
                    'https://i.postimg.cc/9fNMBq3J/devsrsihab.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Align(
                  alignment: Alignment(-1.2, 0), child: Text("Home")),
              onTap: () {
                mySnackbar("This is Home", context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Align(
                alignment: Alignment(-1.2, 0),
                child: Text('Messages'),
              ),
              onTap: () {
                mySnackbar("This is Message", context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cabin_sharp),
              title: const Align(
                alignment: Alignment(-1.2, 0),
                child: Text("Cash"),
              ),
              onTap: () {
                mySnackbar("Your Cash", context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: const Icon(Icons.add),
        onPressed: () {
          mySnackbar("This is floating action button", context);
        },
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Delete iT!"),
          onPressed: () {
            myAlertDialog();
          },
        ),
      ),
    );
  }
}
