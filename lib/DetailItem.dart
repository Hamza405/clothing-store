import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailItem extends StatefulWidget {
  final heroTag;
  final cloth;
  final price;

  DetailItem(this.heroTag, this.cloth, this.price);
  _DetailItemState createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  var selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFec407a),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Detail",
          style: TextStyle(
              fontFamily: "Montserrat", fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35.0),
                      topLeft: Radius.circular(35.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30,
                right: (MediaQuery.of(context).size.width) / 2 - 100,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.heroTag),
                            fit: BoxFit.cover)),
                  ),
                ),
                height: 200,
                width: 200,
              ),
              Positioned(
                  top: 250,
                  left: 25,
                  right: 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            right: (MediaQuery.of(context).size.width) / 2),
                        child: Text(
                          widget.cloth,
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.price,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 1.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFFec407a),
                            ),
                          ),
                          Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Color(0xFFec407a),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Color(0xFFec407a),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.remove,
                                          color: Colors.white, size: 20),
                                    ),
                                  ),
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
                                      fontSize: 16),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: Color(0xFFec407a),
                                    ),
                                    child: Center(
                                      child: Icon(Icons.add,
                                          color: Colors.white, size: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 125,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoItem("l", "low"),
                            _buildInfoItem("m", "Mediuam"),
                            _buildInfoItem("la", "Larg"),
                            _buildInfoItem("xl", "XLarg"),
                            _buildInfoItem("xxl", "XXLarg"),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfoItem(String itemTitle, String info) {
    return InkWell(
      onTap: () {
        SelectedItem(itemTitle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: itemTitle == selectedItem ? Color(0xFFec407a) : Colors.white,
            border: Border.all(
                color: itemTitle == selectedItem
                    ? Color(0xFFec407a)
                    : Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid,
                width: 0.9)),
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              info,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 17,
                  color:
                      itemTitle == selectedItem ? Colors.white : Colors.black),
            ),
            Text(
              "More info ...",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 17,
                  color:
                      itemTitle == selectedItem ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }

  SelectedItem(itemTitle) {
    setState(() {
      selectedItem = itemTitle;
    });
  }
}
