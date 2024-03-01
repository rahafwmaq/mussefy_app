import 'package:paramedic_app/models/doctor_model.dart';
import 'package:paramedic_app/models/paramedic_model.dart';
import 'package:paramedic_app/models/patient_model.dart';

bool userIsParamedic = false;
String scanBarcode = '';

Patient? globalCurrentPatient;
Paramedic? globalCurrentParamedic;
Doctor? globalCurrentDoctor;
String? profileImage;
