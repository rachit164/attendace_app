import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/drop_down_list.dart';
import '../utils/colors.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _Dropdown();
}

class _Dropdown extends State<Dropdown> {
  @override
  void initState() {
    var dropDownData =
        Provider.of<DropDownProvider>(context, listen: false).dropDown();
    super.initState();
  }

  List<Map> list = [
    {
      "CompanyId": 3,
      "CompanyName": "Sprink Media Private Limited",
      "CompanyCode": "SMPL06"
    },
    {
      "CompanyId": 2,
      "CompanyName": "VertexPlus Software Private Limited",
      "CompanyCode": "VSPL02"
    },
    {
      "CompanyId": 1,
      "CompanyName": "VertexPlus Technologies Limited",
      "CompanyCode": "VTPL03"
    },
    {
      "CompanyId": 4,
      "CompanyName": "VertexPlus Technologies Pte Ltd. (Singapore)",
      "CompanyCode": "VTSG05"
    }
  ];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    var dropDownData = Provider.of<DropDownProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.offwhite, borderRadius: BorderRadius.circular(8)),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
      child: DropdownButtonFormField(
        value: dropdownValue,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person, color: AppColors.greyColor),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        hint: const Text(
          'Please select company',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            color: AppColors.greyColor,
          ),
        ),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        style: const TextStyle(color: AppColors.offwhite),
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        // onChanged: (Map? value) {
        //   setState(() {
        //     dropdownValue = value!;
        //   });
        // },
        items: list.map<DropdownMenuItem<Map>>((Map value) {
          return DropdownMenuItem<Map>(
            value: value,
            child: Text(
              value['CompanyName'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.blackColor,
                fontFamily: 'Inter',
              ),
            ),
          );
        }).toList(),
        onChanged: (Object? value) {
          print("Selected company =" + value!.toString());
        },
      ),
    );
  }
}
