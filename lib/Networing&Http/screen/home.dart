import 'package:flutter/material.dart';

import '../model/person_model.dart';
import '../service/network_service.dart';

class HomeScreen extends StatelessWidget {
  final PersonNetworkService personService = PersonNetworkService();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80"),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchPersons(100),
            builder:
                (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        color: Colors.black.withOpacity(0.5),
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var currentPerson = snapshot.data![index];

                              return ListTile(
                                title: Text(
                                  currentPerson.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(currentPerson.imageUrl),
                                ),
                                subtitle: Text(
                                  "Email: ${currentPerson.email}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                );
              }

              if (snapshot.hasError) {
                return const Center(
                    child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 82.0,
                ));
              }
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, Please Wait")
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
