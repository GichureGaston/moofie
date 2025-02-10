import 'package:flutter/material.dart';

import '../../data/models/download.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  final List<Download> downloads = [
    Download(
      title: 'Sample File 1.pdf',
      subtitle: '12.5 MB',
      progress: 0.7,
    ),
    Download(
      title: 'Sample File 2.mp4',
      subtitle: '45.8 MB',
      progress: 1.0,
      isCompleted: true,
    ),
  ];

  void _deleteDownload(int index) {
    setState(() {
      downloads.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads'),
        actions: [
          if (downloads.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              onPressed: () {
                setState(() {
                  downloads.clear();
                });
              },
              tooltip: 'Clear all downloads',
            ),
        ],
      ),
      body: downloads.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download_done,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No downloads yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: downloads.length,
              itemBuilder: (context, index) {
                final download = downloads[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Card(
                    elevation: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Icon(
                            download.isCompleted
                                ? Icons.download_done
                                : Icons.download_rounded,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          download.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(download.subtitle),
                            if (!download.isCompleted)
                              LinearProgressIndicator(
                                value: download.progress,
                                backgroundColor: Colors.grey[200],
                              ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () => _deleteDownload(index),
                          color: Colors.red,
                        ),
                        isThreeLine: !download.isCompleted,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
