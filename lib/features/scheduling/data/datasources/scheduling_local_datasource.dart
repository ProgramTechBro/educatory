import '../../domain/entities/time_slot_entity.dart';

class SchedulingLocalDataSource {
  List<TimeSlotEntity> getTimeSlots() {
    return const [
      TimeSlotEntity(label: '9:00 - 10:00', isAvailable: false),
      TimeSlotEntity(label: '11:00 - 12:00', isAvailable: true),
      TimeSlotEntity(label: '02:00 - 03:00', isAvailable: false),
      TimeSlotEntity(label: '04:00 - 05:00', isAvailable: false),
      TimeSlotEntity(label: '06:00 - 7:00', isAvailable: true),
      TimeSlotEntity(label: '10:00 - 11:00', isAvailable: true),
      TimeSlotEntity(label: '12:00 - 01:00', isAvailable: true),
      TimeSlotEntity(label: '03:00 - 04:00', isAvailable: true),
      TimeSlotEntity(label: '05:00 - 06:00', isAvailable: true),
      TimeSlotEntity(label: '07:00 - 8:00', isAvailable: true),
    ];
  }
}
