import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference _productsReference =
    FirebaseFirestore.instance.collection('products');

CollectionReference _orders = FirebaseFirestore.instance.collection('orders');
