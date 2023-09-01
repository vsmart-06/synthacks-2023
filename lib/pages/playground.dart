import "package:flutter/material.dart";

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  bool buttonSelect = false;
  bool starSelect = false;
  bool crossSelect = false;

  List<Positioned> realStars = [];
  List<double> mouseLocation = [0, 0];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Constellation Playground"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (buttonSelect && starSelect) {
                              buttonSelect = false;
                              starSelect = false;
                              crossSelect = false;
                            } else {
                              buttonSelect = true;
                              starSelect = true;
                              crossSelect = false;
                            }
                          });
                        },
                        icon: Icon(Icons.star),
                        color: Colors.white),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (buttonSelect && crossSelect) {
                              buttonSelect = false;
                              starSelect = false;
                              crossSelect = false;
                            } else {
                              buttonSelect = true;
                              starSelect = false;
                              crossSelect = true;
                            }
                          });
                        },
                        icon: Icon(Icons.close),
                        color: Colors.white),
                  ],
                ),
                MouseRegion(
                  onHover: (event) {
                    Offset position = event.position;
                    setState(() {
                      mouseLocation = [position.dx, position.dy];
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 96,
                        child: Stack(
                          children: realStars
                        ),
                      ),
                      buttonSelect
                          ? Positioned(
                              left: mouseLocation[0] - 10,
                              top: mouseLocation[1] - 100,
                              child: IconButton(
                                onPressed: () {
                                  if (starSelect) {
                                    setState(() {
                                      realStars.add(
                                        Positioned(
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.white,
                                          ),
                                          left: mouseLocation[0]-10,
                                          top: mouseLocation[1]-100,
                                          )
                                        );
                                    });
                                  }
                                },
                                icon: Icon(
                                  starSelect ? Icons.star : Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
