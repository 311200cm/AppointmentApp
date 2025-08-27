import 'package:appointment_app/core/helpers/strings.dart';
import 'package:appointment_app/core/theming/app_styles.dart';
import 'package:appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:appointment_app/features/home/presentation/widgets/doctor_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListView extends StatelessWidget {
  List<DoctorModel>?doctors;
   DoctorListView({super.key,required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
            itemBuilder: (context,index){
              return DoctorListViewItem(doctorModel:doctors?[index]);
            },
            itemCount: doctors?.length??10)
    );
  }
}
