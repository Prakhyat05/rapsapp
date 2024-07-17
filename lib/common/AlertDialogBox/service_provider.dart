import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class ServiceProvider extends StatefulWidget {
  const ServiceProvider({super.key});

  @override
  State<ServiceProvider> createState() => _ServiceProviderState();
}

class _ServiceProviderState extends State<ServiceProvider> {
  List<dynamic> category = [];
  String? categoryId;

  @override
  void initState() {
    super.initState();

    this.category.add({"id": 1, "name": "Personal Services"});
    this.category.add({"id": 2, "name": "Home Maintenance"});
    this.category.add({"id": 3, "name": "Education"});
    this.category.add({"id": 4, "name": "Household and Other Services"});
    this.category.add({"id": 5, "name": "Health and Wellness"});
    this.category.add({"id": 6, "name": "Professional Services"});
    this.category.add({"id": 7, "name": "Event and Entertainment"});
    this.category.add({"id": 8, "name": "Food and Beverage"});
    this.category.add({"id": 9, "name": "Transportation"});
    this.category.add({"id": 10, "name": "Travel and Hospitality"});
    this.category.add({"id": 11, "name": "Technology and Digital Services"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(
                color: Colors.black54,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FormHelper.dropDownWidget(
              context,
              "Select Service Category",
              this.categoryId,
              this.category,
              (onChangedVal) {
                this.categoryId = onChangedVal;
                print('Selected Category: $onChangedVal');
              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Plesae Select Category';
                }
                return null;
              },
              //borderColor: Colors.white,
              //borderFocusColor: Colors.white,
              //borderRadius: 2,
              optionValue: "id",
              optionLabel: "name",
            ),
          )
        ],
      ),
    );
  }
}
