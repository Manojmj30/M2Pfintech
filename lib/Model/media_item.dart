class MediaItem {
  final String type;
  final String title;
  final String artist;
  final String artworkUrl;
  final String previewUrl;

  MediaItem({
    required this.type,
    required this.title,
    required this.artist,
    required this.artworkUrl,
    required this.previewUrl,
  });

  factory MediaItem.fromJson(Map<String, dynamic> json) {
    return MediaItem(
      type: json['kind'] ?? 'Unknown',
      title: json['trackName'] ?? 'No Title',
      artist: json['artistName'] ?? 'Unknown Artist',
      artworkUrl: json['artworkUrl100'] ?? '',
      previewUrl: json['previewUrl'] ?? '',
    );
  }
}
