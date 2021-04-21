class User{
  String name,job;
  String quote;
  User({this.name,this.job,this.quote});
}
class Profile{
  User user;
  int followers,photos;
  double rating;
     Profile({this.user,this.photos,this.followers,this.rating});
}
class ProfileProvider{
  static Profile getProfile(){
    return Profile(
      user: User(
        quote:'The road to success and the road to failure are almost exactly the same!',
        name: 'Yassine Bennkhay',
        job: 'Flutter Developer',
      ),
      followers: 512,
      photos: 24,
      rating: 4.7,
    );
  }
}