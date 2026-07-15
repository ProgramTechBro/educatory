import '../../domain/entities/review_entity.dart';

class ProfileLocalDataSource {
  List<ReviewEntity> getMyReviews() {
    return const [
      ReviewEntity(
        targetType: ReviewTargetType.tutor,
        targetName: 'Arlene McCoy',
        rating: 4.5,
        reviewText:
            'Arlene McCoy is an exceptional live tutor. His expertise and '
            'patience made learning enjoyable and productive. He provided '
            'real-time feedback that greatly enhanced my understanding of '
            'complex concepts. Highly recommended!',
        date: '24 Aug 2023',
      ),
      ReviewEntity(
        targetType: ReviewTargetType.course,
        targetName: 'Introduction to Photography and Editing',
        rating: 4.5,
        reviewText:
            "The 'Introduction to Photography and Editing' course was "
            'fantastic! It covered everything from basic camera settings to '
            'advanced editing techniques. Perfect for beginners and '
            'intermediate photographers alike.',
        date: '24 Aug 2023',
      ),
      ReviewEntity(
        targetType: ReviewTargetType.course,
        targetName: 'Artificial Intelligence with Python',
        rating: 4.5,
        reviewText:
            'The course on Artificial Intelligence with Python was good, but '
            'I felt it could have gone deeper into some of the advanced '
            "topics. The hands-on projects were helpful, but the "
            "explanations sometimes lacked detail. Still, it's a decent "
            'introduction to AI with Python.',
        date: '24 Aug 2023',
      ),
    ];
  }
}
