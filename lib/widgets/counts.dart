import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Counts extends StatefulWidget {
  const Counts({super.key});

  @override
  State<Counts> createState() => _CountsState();
}

class _CountsState extends State<Counts> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: themeColor,
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: gColor.withOpacity(0.3), width: 1),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if(count>1){
                      setState(() {
                      count--;
                    });
                    }
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                    }
                    
                    
                  },
                  child: Icon(
                    Icons.remove,
                    color: themeColor,
                    size: 15,
                  ),
                ),
                Text("$count"),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: themeColor,
                    size: 15,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                },
                child: Text(
                  "ADD",
                  style: TextStyle(
                    color: themeColor,
                  ),
                ),
              ),
            ),
    );
  }
}
