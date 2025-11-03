import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_icons/simple_icons.dart';

class RepoCard extends StatelessWidget {
  final String ownerAvatar;
  final String userName;
  final String starsCount;
  final String repoName;
  final String repoDescription;
  final String weightRepository;
  final String forksCount;
  final String languageRepository;
  final String userURL;
  final String repoURL;

  const RepoCard({
    super.key,
    required this.ownerAvatar,
    required this.userName,
    required this.starsCount,
    required this.repoName,
    required this.repoDescription,
    required this.weightRepository,
    required this.forksCount,
    required this.languageRepository,
    required this.userURL,
    required this.repoURL,
  });

  Future<void> _launchUserUrl() async {
    final Uri url = Uri.parse(userURL);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo lanzar $userURL');
    }
  }

  Future<void> _launchRepoUrl() async {
    final Uri url = Uri.parse(repoURL);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('No se pudo lanzar $repoURL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topSection(),
            Divider(),
            _midSection(),
            Divider(),
            const SizedBox(height: 8.0),
            _bottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _topSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: _launchUserUrl,
          child: CircleAvatar(
            backgroundImage: NetworkImage(ownerAvatar),
            radius: 24.0,
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          userName,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Icon(Icons.star, color: Colors.yellow[600], size: 18),
        const SizedBox(width: 4),
        Text(starsCount, style: const TextStyle(fontSize: 16.0)),
      ],
    );
  }

  Widget _midSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          repoName,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          repoDescription != 'null'
              ? repoDescription
              : 'No description provided.',
          style: const TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
        const SizedBox(height: 20.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5.0,
          children: [
            Icon(
              Icons.storage_outlined,
              size: 16,
            ),
            Text(
              '$weightRepository KB',
              style: const TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
            const SizedBox(width: 16.0),
            Icon(
              Icons.account_tree_outlined,
              size: 16,
            ),
            Text(
              forksCount,
              style: const TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottomSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        languageRepository,
        style: const TextStyle(fontSize: 14.0, color: Colors.black54),
      ),
      IconButton(
          onPressed: _launchRepoUrl,
          icon: Icon(
            SimpleIcons.github,
            size: 24,
          )
      )
    ]);
  }
}
