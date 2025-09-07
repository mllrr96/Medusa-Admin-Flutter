class AppUpdate {
  final String? url;
  final String? htmlUrl;
  final String? tagName;
  final String? name;
  final bool? draft;
  final bool? preRelease;
  final String? createdAt;
  final String? publishedAt;
  final List<Assets>? assets;
  final String? body;

  const AppUpdate({
    this.url,
    this.htmlUrl,
    this.tagName,
    this.name,
    this.draft,
    this.preRelease,
    this.createdAt,
    this.publishedAt,
    this.assets,
    this.body,
  });

  factory AppUpdate.fromJson(Map<String, dynamic> json) {
    return AppUpdate(
      url: json['url'] as String?,
      htmlUrl: json['html_url'] as String?,
      tagName: json['tag_name'] as String?,
      name: json['name'] as String?,
      draft: json['draft'] as bool?,
      preRelease: json['prerelease'] as bool?,
      createdAt: json['created_at'] as String?,
      publishedAt: json['published_at'] as String?,
      assets: json['assets'] != null ? List<Assets>.from(json['assets'].map((x) => Assets.fromJson(x))): null,
      body: json['body'] as String?,
    );
  }

  @override
  String toString() =>
      "AppUpdate(url: $url,htmlUrl: $htmlUrl,tagName: $tagName,name: $name,draft: $draft,prerelease: $preRelease,createdAt: $createdAt,publishedAt: $publishedAt,assets: $assets,body: $body)";

  @override
  int get hashCode => Object.hash(url, htmlUrl, tagName, name, draft,
      preRelease, createdAt, publishedAt, assets, body);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppUpdate &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          htmlUrl == other.htmlUrl &&
          tagName == other.tagName &&
          name == other.name &&
          draft == other.draft &&
          preRelease == other.preRelease &&
          createdAt == other.createdAt &&
          publishedAt == other.publishedAt &&
          assets == other.assets &&
          body == other.body;
}

class Assets {
  String? url;
  int? id;
  String? name;
  String? label;
  String? contentType;
  String? state;
  int? size;
  int? downloadCount;
  String? createdAt;
  String? updatedAt;
  String? browserDownloadUrl;

  Assets({
    this.url,
    this.id,
    this.name,
    this.label,
    this.contentType,
    this.state,
    this.size,
    this.downloadCount,
    this.createdAt,
    this.updatedAt,
    this.browserDownloadUrl,
  });

  factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      url: json['url'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      label: json['label'] as String?,
      contentType: json['content_type'] as String?,
      state: json['state'] as String?,
      size: json['size'] as int?,
      downloadCount: json['download_count'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      browserDownloadUrl: json['browser_download_url'] as String?,
    );
  }

  @override
  String toString() =>
      "Assets(url: $url,id: $id,name: $name,label: $label,contentType: $contentType,state: $state,size: $size,downloadCount: $downloadCount,createdAt: $createdAt,updatedAt: $updatedAt,browserDownloadUrl: $browserDownloadUrl)";

  @override
  int get hashCode => Object.hash(url, id, name, label, contentType, state,
      size, downloadCount, createdAt, updatedAt, browserDownloadUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Assets &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          id == other.id &&
          name == other.name &&
          label == other.label &&
          contentType == other.contentType &&
          state == other.state &&
          size == other.size &&
          downloadCount == other.downloadCount &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          browserDownloadUrl == other.browserDownloadUrl;
}
