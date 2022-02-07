
// ignore_for_file: file_names

class tvModel{
  final String rank ;
  final String title ;
  final String fullTitle ;
  final String year ;
  final String image ;
  final String crew ;
  final String imDbRating ;
  final String imDbRatingCount ;

  tvModel({required this.rank,required  this.title,required  this.fullTitle,required  this.year,required  this.image,
    required  this.crew,required  this.imDbRating,required  this.imDbRatingCount});

  factory tvModel.map(Map<String,dynamic> m){
    return tvModel(
        rank: m['rank'] ?? 'null',
        title: m['title'] ?? 'null',
        fullTitle: m['fullTitle'] ?? 'null',
        year: m['year']??'null',
        image: m['image']??'null',
        crew: m['crew']??'null',
        imDbRating:  m['imDbRating']??'null',
        imDbRatingCount: m['imDbRatingCount']??'null'
    );
  }

  @override
  String toString() {
    return 'tvModel{rank: $rank, title: $title, fullTitle: $fullTitle, year: $year, image: $image, crew: $crew, imDbRating: $imDbRating, imDbRatingCount: $imDbRatingCount}';
  }
}
class searchModel  {
  final String image;
  final String title;
  final String descripition;
  searchModel({required this.image,required this.title,required this.descripition });
  factory searchModel.map(Map<String,dynamic>m){
    return searchModel(
    image: m['image'] ?? 'null',
    title: m['title'] ?? 'null',
    descripition :m['descripition'] ?? 'null',
  
    );
  }
}