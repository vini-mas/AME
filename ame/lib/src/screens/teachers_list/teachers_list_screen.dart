import 'package:ame/src/providers/teacher_provider.dart';
import 'package:ame/src/screens/teachers_list/widgets/teacher_card.dart';
import 'package:ame/src/styles/ame_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../styles/ame_colors.dart';

class TeachersListScreen extends StatefulWidget {
  static const String routeName = '/teacher_list_screen';

  @override
  _TeachersListScreenState createState() => _TeachersListScreenState();
}

List<String> institutes = [
  "Instituto de Informática",
  "Instituto 2",
  "Instituto 3",
];

class _TeachersListScreenState extends State<TeachersListScreen> {
  String? _selectedInstitute;

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherProvider>(
        builder: (context, teacherProvider, _) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: new GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  behavior: HitTestBehavior.translucent,
                  child: SafeArea(
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 8,
                            left: AmeSize.getSideSpacing(context),
                            right: AmeSize.getSideSpacing(context)),
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 105,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(children: <Widget>[
                                  Container(
                                      height: 40,
                                      child: Material(
                                          elevation: 6,
                                          shadowColor:
                                              Colors.grey.withOpacity(0.8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          child: DropdownButtonHideUnderline(
                                              child: ButtonTheme(
                                                  alignedDropdown: true,
                                                  child: DropdownButton(
                                                    hint: Text(
                                                      "Selecione um instituto...",
                                                      style: TextStyle(
                                                          color: AmeColors
                                                              .primaryBlue
                                                              .withOpacity(0.6),
                                                          fontSize: 15),
                                                    ),
                                                    icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 32,
                                                        color: AmeColors
                                                            .primaryBlue),
                                                    value: _selectedInstitute,
                                                    isExpanded: true,
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        _selectedInstitute =
                                                            newValue;
                                                      });
                                                    },
                                                    style: TextStyle(),
                                                    items: institutes
                                                        .map((institute) =>
                                                            DropdownMenuItem(
                                                                value:
                                                                    institute,
                                                                child: Text(
                                                                  institute,
                                                                  style: TextStyle(
                                                                      color: AmeColors
                                                                          .primaryBlue),
                                                                )))
                                                        .toList(),
                                                  ))))),
                                  SizedBox(height: 10),
                                  Container(
                                      height: 40,
                                      child: Material(
                                        elevation: 6,
                                        shadowColor:
                                            Colors.grey.withOpacity(0.8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: TextField(
                                          decoration: InputDecoration(
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(Radius
                                                            .circular(20)),
                                                    borderSide: BorderSide(
                                                        color: AmeColors
                                                            .primaryBlue,
                                                        width: 2)),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            hintText: 'Procure um professor...',
                                            hintStyle: TextStyle(
                                                color: AmeColors.primaryBlue),
                                            suffixIcon: const Icon(Icons.search,
                                                size: 24,
                                                color: AmeColors.primaryBlue),
                                          ),
                                          style: TextStyle(
                                              color: AmeColors.primaryBlue,
                                              fontSize: 15),
                                          onChanged: (String searchTerm) {
                                            setState(() {
                                              teacherProvider.searchTerm =
                                                  searchTerm;
                                            });
                                          },
                                        ),
                                      )),
                                ])),
                            Expanded(
                                flex: 1,
                                child: ListView.builder(
                                  itemCount:
                                      teacherProvider.filteredTeachers.length,
                                  itemBuilder: (_, i) {
                                    return ListTile(
                                      title: TeacherCard(
                                          teacher: teacherProvider
                                              .filteredTeachers[i]),
                                    );
                                  },
                                  padding: EdgeInsets.only(bottom: 10),
                                  shrinkWrap: true,
                                )),
                          ],
                        )),
                  )),
            ));
  }
}
