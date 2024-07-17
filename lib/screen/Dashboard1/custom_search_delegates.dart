// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Painter',
    'Plumber',
    'Electrician',
    'And Many More'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  List<String> _filterSearchTerms(String query) {
    return searchTerms
        .where((term) => term.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchList(_filterSearchTerms(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchList(_filterSearchTerms(query));
  }

  Widget _buildSearchList(List<String> searchResults) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        var result = searchResults[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
