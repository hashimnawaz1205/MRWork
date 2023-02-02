import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mrworker/AppState/providers/workerDetails_provider.dart';
import 'package:mrworker/Widgets/LoadingWidgets/workerLoading.dart';
import 'package:provider/provider.dart';

class WorkerDetailScreen extends StatefulWidget {
  final String user_id;
  const WorkerDetailScreen({Key? key, required this.user_id}) : super(key: key);
  @override
  _WorkerDetailScreenState createState() => new _WorkerDetailScreenState();
}

class _WorkerDetailScreenState extends State<WorkerDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WorkerDetailsProvider>(context, listen: false)
          .getWorkerDetails(widget.user_id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child:
            Consumer<WorkerDetailsProvider>(builder: (context, value, child) {
          return value.isLoading
              ? WorkerProfileLoading()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.workerDetails.length,
                  itemBuilder: (context, index) {
                    final worker = value.workerDetails[index];
                    return Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  'https://mrworker.pk/img/Header_iPhone.png'),
                              fit: BoxFit.cover),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Container(
                            alignment: const Alignment(0.0, 2.5),
                            child: CircleAvatar(
                              backgroundImage:
                                  CachedNetworkImageProvider(worker.image),
                              radius: 60.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        worker.name,
                        style: const TextStyle(
                            fontSize: 25.0,
                            color: Colors.blueGrey,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        worker.area,
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        worker.city,
                        style: const TextStyle(
                            fontSize: 15.0,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        elevation: 2.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 30),
                          child: Text(
                            worker.speciality,
                            style: const TextStyle(
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        worker.tags,
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black45,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      worker.fb_link,
                                      style: const TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    const Text(
                                      "15",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      "Followers",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "2000",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(80.0),
                            // ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: const [
                                      Colors.pink,
                                      Colors.redAccent
                                    ]),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 100.0,
                                  maxHeight: 40.0,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Contact me",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(80.0),
                            // ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: const [
                                      Colors.pink,
                                      Colors.redAccent
                                    ]),
                                borderRadius: BorderRadius.circular(80.0),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 100.0,
                                  maxHeight: 40.0,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Portfolio",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ]);
                  },
                );
        }),
      ),
    );
  }
}
