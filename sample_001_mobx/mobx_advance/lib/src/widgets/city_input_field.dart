import 'package:flutter/material.dart';
import 'package:mobx_advance/src/stores/weather_store.dart';
import 'package:provider/provider.dart';
import 'package:search_widget/search_widget.dart';

// Inspiration from https://pub.dev/packages/search_widget/example

class CitySearchInputField extends StatelessWidget {
  final cities = <String>['Montreal', 'Toulouse', 'Paris', 'New York'];

  void submitCityName(BuildContext context, String cityName) {
    final weatherStore = context.read<WeatherStore>();
    weatherStore.getWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return SearchWidget<String>(
      dataList: cities,
      hideSearchBoxWhenItemSelected: false,
      listContainerHeight: MediaQuery.of(context).size.height / 4,
      queryBuilder: (query, list) {
        return list
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      popupListItemBuilder: (item) {
        return PopupListItemWidget(item);
      },
      selectedItemBuilder: (selectedItem, deleteSelectedItem) {
        return SelectedItemWidget(selectedItem, deleteSelectedItem);
      },
      // widget customization
      noItemsFoundWidget: NoItemsFound(),
      textFieldBuilder: (controller, focusNode) {
        return MyTextField(controller, focusNode);
      },
      onItemSelected: (item) => submitCityName(context, item),
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        item,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  final String selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedItem,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedItem,
          ),
        ],
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "Aucune donnée trouvée",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "Rechercher ici ...",
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}
