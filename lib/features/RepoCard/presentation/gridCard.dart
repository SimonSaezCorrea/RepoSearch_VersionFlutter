import 'package:flutter/material.dart';
import 'package:repo_search_version_flutter/features/RepoCard/presentation/repoCard.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    const repositorio = {
      'ownerAvatar': 'https://avatars.githubusercontent.com/u/72891108?v=4',
      'userName': 'SimonSaezCorrea',
      'starsCount': '2',
      'repoName': 'RepoSearch',
      'repoDescription': 'null',
      'weightRepository': '427',
      'forksCount': '0',
      'languageRepository': 'TypeScript',
      'userURL': 'https://github.com/SimonSaezCorrea',
      'repoURL': 'https://github.com/SimonSaezCorrea/RepoSearch',
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: RepoCard(
              ownerAvatar: repositorio['ownerAvatar']!,
              userName: repositorio['userName']!,
              starsCount: repositorio['starsCount']!,
              repoName: repositorio['repoName']!,
              repoDescription: repositorio['repoDescription']!,
              weightRepository: repositorio['weightRepository']!,
              forksCount: repositorio['forksCount']!,
              languageRepository: repositorio['languageRepository']!,
              userURL: repositorio['userURL']!,
              repoURL: repositorio['repoURL']!,
            ),
          ),
        ],
      ),
    );
  }
}