class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;
  String cardElementTop;
  String cardElementBottom;
  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground, this.cardElementBottom, this.cardElementTop);
}

class Transition {
  String company;
  String operation;
  String date;
  String price;
  Transition(this.company, this.operation, this.date, this.price);
}

List<Transition> transition = transitiontData
    .map(
      (item) => Transition(
          item['company'].toString(),
          item['operation'].toString(),
          item['date'].toString(),
          item['price'].toString()),
    )
    .toList();
var transitiontData = [
  {
    "company": "Uber",
    "operation": "Uber Ride",
    "date": "03-01-2023",
    "price": ' -35.14 \$',
  },
  {
    "company": "Nike",
    "operation": "Nike Outlet",
    "date": "09-01-2023",
    "price": ' -62.54 \$',
  },
  {
    "company": "Khaled",
    "operation": "Payment Recieved",
    "date": "11-01-2023",
    "price": ' +620.54 \$',
  }
];
// ignore: deprecated_member_use
final List<String> datas = [
  "Money Transfer",
  "Bank Withdraw",
  "Insight Tracking"
];

List<CardModel> cards = cartData
    .map(
      (item) => CardModel(
        item['user'].toString(),
        item['cardNumber'].toString(),
        item['cardExpired'].toString(),
        item['cardType'].toString(),
        int.parse(item['cardBackground'].toString()),
        item['cardElementBottom'].toString(),
        item['cardElementTop'].toString(),
      ),
    )
    .toList();

var cartData = [
  {
    "user": "Amanda Alex",
    "cardNumber": "**** **** **** 1425",
    "cardExpired": "03-01-2023",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFF1E1E99,
    "cardElementTop": "assets/svg/ellipse_top_pink.svg",
    "cardElementBottom": "assets/svg/ellipse_bottom_pink.svg",
  },
  {
    "user": "Mahmoud KADDOUR",
    "cardNumber": "**** **** **** 8287",
    "cardExpired": "03-01-2023",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFFFF70A3,
    "cardElementTop": "assets/svg/ellipse_top_blue.svg",
    "cardElementBottom": "assets/svg/ellipse_bottom_blue.svg",
  }
];
