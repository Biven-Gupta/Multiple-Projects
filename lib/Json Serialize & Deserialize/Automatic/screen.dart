import 'package:flutter/material.dart';

import 'model_auto.dart';
import 'network_service_auto.dart';

class Screen extends StatelessWidget {
  final PersonNetworkServiceA personService = PersonNetworkServiceA();

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
            future: personService.fetchPersons(10),
            builder:
                (BuildContext context, AsyncSnapshot<List<UserA>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentPerson = snapshot.data![index];

                                return ListTile(
                                  title: Text(
                                    currentPerson.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(currentPerson.imageUrl),
                                  ),
                                  subtitle: Text(
                                    "Email: ${currentPerson.email}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                );
              }

              if (snapshot.hasError) {
                return Center(
                    child: Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 82.0,
                ));
              }

              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, please hold the line.")
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
