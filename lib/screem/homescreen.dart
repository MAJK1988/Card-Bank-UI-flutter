// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plot_chart/conctants/card_model.dart';

import 'package:plot_chart/conctants/colors_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //handle indicotor
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 8),
            child: ListView(physics: const ClampingScrollPhysics(), children: <
                Widget>[
              //Custom AppBAr
              Container(
                margin: const EdgeInsets.only(left: 20, right: 16, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          // ignore: avoid_print
                          print('Drawer tap');
                        },
                        child: SvgPicture.asset('assets/svg/drawer_icon.svg')),
                    Container(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/user_image.jpg'))),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Good Morning',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kBlakColor)),
                    Text(
                      'Mahmoud KADDOUR',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: kBlakColor),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16, right: 6),
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.0),
                          color: Color(cards[index].cardBackground),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                child: SvgPicture.asset(
                                    cards[index].cardElementTop)),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: SvgPicture.asset(
                                    cards[index].cardElementBottom)),
                            Positioned(
                              left: 29,
                              top: 48,
                              child: Text("CARD NUMBER: ",
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: kWhiteColor)),
                            ),
                            Positioned(
                                left: 29,
                                top: 65,
                                child: Text(cards[index].cardNumber,
                                    style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: kWhiteColor))),
                            Positioned(
                                top: 5,
                                right: 5,
                                child: Image.asset(
                                  cards[index].cardType,
                                  width: 90,
                                )),
                            Positioned(
                                bottom: 60,
                                left: 29,
                                child: Text("CARD HOLDERNAME",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: kWhiteColor))),
                            Positioned(
                                bottom: 21,
                                left: 29,
                                child: Text(cards[index].user,
                                    style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: kWhiteColor))),
                            Positioned(
                                bottom: 60,
                                right: 55,
                                child: Text("EXPIRY DATE",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: kWhiteColor))),
                            Positioned(
                                bottom: 21,
                                right: 25,
                                child: Text(cards[index].cardExpired,
                                    style: GoogleFonts.inter(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                        color: kWhiteColor))),
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 13, top: 29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Operations',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: kBlakColor),
                    ),
                    Row(
                      children: map<Widget>([1, 2, 3], (index, selected) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == index
                                  ? kBlakColor
                                  : kTwentyBlueColor),
                        );
                      }),
                    )
                  ],
                ),
              ),
              Container(
                height: 123,
                child: ListView.builder(
                  itemCount: datas.length,
                  padding: const EdgeInsets.only(left: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: OperationCard(
                            isSelected: current == index,
                            operation: datas[index],
                            context: this));
                  },
                ),
              ),
              //transaction Section
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 13, top: 29),
                child: Text(
                  'Transaction Histories',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: kBlakColor),
                ),
              ),
              ListView.builder(
                itemCount: transition.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 16, right: 16),
                itemBuilder: (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    margin: const EdgeInsets.only(bottom: 13),
                    padding: const EdgeInsets.only(
                        left: 24, top: 12, bottom: 12, right: 22),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(),
                        boxShadow: const [
                          BoxShadow(
                              color: kTenBlackColor,
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(8.0, 8.0))
                        ]),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            transition[index].company,
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: kBlakColor),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                transition[index].operation,
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: kBlakColor),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text(
                                transition[index].date,
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: kBlueColor),
                              ),
                            ],
                          ),
                          Text(
                            transition[index].price,
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: kBlueColor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ])));
  }
}

class OperationCard extends StatefulWidget {
  final String operation;

  final bool isSelected;
  final _HomeScreenState context;

  const OperationCard(
      {Key? key,
      required this.isSelected,
      required this.operation,
      required this.context})
      : super(key: key);

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: widget.isSelected ? kBlueColor : kWhiteColor,
      ),
      margin: const EdgeInsets.only(right: 16),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          widget.operation,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: widget.isSelected ? kWhiteColor : kBlueColor,
          ),
        ),
      ),
    );
  }
}
