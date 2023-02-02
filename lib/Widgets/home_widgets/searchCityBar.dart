import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrworker/AppState/database.dart';
import 'package:mrworker/searchpage.dart';
import 'package:provider/provider.dart';
import '../../Screens/Api/user_api.dart';
import '../../Screens/data/network_type.dart';

class SearchCityBar extends StatelessWidget {
  const SearchCityBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    final TextEditingController typeAheadController2 = TextEditingController();
    return Container(
      margin: const EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width * 0.96,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xffd4d4d9), spreadRadius: 0.5, blurRadius: 5.0),
        ],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 8.0,
              ),
              const Icon(Icons.search),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SearchPage(),
                    ),
                  );
                },
                child: const SizedBox(
                    height: 50,
                    width: 200,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 15.0),
                      child: Text('Type Search Here'),
                    )

                    //NetworkTypeAheadPage(),
                    ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on,
                color: Color(0xFFa51b1f),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Select City'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  ListTile(
                                    title: const Text('Get City From Gps'),
                                    trailing: const Icon(
                                      Icons.gps_fixed,
                                      color: Colors.blue,
                                    ),
                                    onTap: () async {
                                      await dbclass.getPermission();
                                      dbclass.getCurrentlocation();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TypeAheadFormField<City?>(
                                      hideSuggestionsOnKeyboardHide: false,
                                      textFieldConfiguration:
                                          TextFieldConfiguration(
                                        focusNode: FocusScopeNode(),
                                        enableSuggestions: false,
                                        autofocus: false,
                                        controller: typeAheadController2,
                                        decoration: InputDecoration(
                                          hintStyle: GoogleFonts.montserrat(),
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black12)),
                                          focusedBorder: InputBorder.none,
                                          hintText: 'Search City ...',
                                        ),
                                      ),
                                      suggestionsCallback:
                                          UserApi1.getCitySuggestions,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter City Name';
                                        }
                                      },
                                      itemBuilder: (context, City? suggestion) {
                                        final city = suggestion!;

                                        return ListTile(
                                          title: Text(city.name),
                                        );
                                      },
                                      noItemsFoundBuilder: (context) =>
                                          const SizedBox(
                                        height: 10,
                                        child: Center(
                                          child: Text(
                                            'No City Found.',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      onSuggestionSelected: (City? suggestion) {
                                        final city = suggestion!;

                                        typeAheadController2.text =
                                            city.name.toString();
                                        print('completed');
                                        dbclass.SetCityForSearchbar(
                                            city.name.toString());
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      });
                },
                child: Consumer<DataBase>(
                  builder: (context, value, child) {
                    return Text(
                      dbclass.initial_city.toString(),
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFa51b1f),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
